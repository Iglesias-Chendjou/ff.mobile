import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'core/api_service.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SelectedLang = prefs.getString('ff_SelectedLang') ?? _SelectedLang;
    });
    _safeInit(() {
      _dataFruits = prefs
              .getStringList('ff_dataFruits')
              ?.map((x) {
                try {
                  return DataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dataFruits;
    });
    _safeInit(() {
      _CartList = prefs
              .getStringList('ff_CartList')
              ?.map((x) {
                try {
                  return CartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _CartList;
    });

    // Clear stale cached products and load fresh from API
    prefs.remove('ff_dataFruits');
    await loadProductsFromApi();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  // Map product names to local asset images
  static const _productImages = <String, String>{
    'Barquette de fraises': 'assets/images/600x600_(1).png',
    'Bananes bio': 'assets/images/600x600_(31).png',
    'Carottes lavées': 'assets/images/d7144865a2d02d253bcf345d294b.png',
    'Brocoli frais': 'assets/images/6b05b3ed7a2c77848c3178e91a9d.png',
    'Pommes Jonagold': 'assets/images/66ce9b0fbeca91ba2f9956920fcc.png',
    'Salade César': 'assets/images/253bf999528a78fce1bf44f84f86.png',
    'Pain de campagne': 'assets/images/75546d8cd3aaf2cd8d900a7fb1c2.png',
    'Croissants au beurre x4': 'assets/images/8d187b48bea51e3c486c339d932e.png',
    'Pâtes complètes 500g': 'assets/images/3f234f4wrgeg.png',
    'Fromage Brie Président': 'assets/images/600x600_(39).png',
    'Yaourt grec nature x6': 'assets/images/0b4decdd4e580de061349c60bcec.png',
    'Yaourt nature bio': 'assets/images/f75393724b28a68eda2f69bab555.png',
    'Filet de poulet fermier': 'assets/images/0cb93a2b51fbb1e6b65c0d0cc83f.png',
    'Aile de dinde': 'assets/images/08f63f6f03fd06e1cc4556201d29.png',
    'Soupe de légumes maison': 'assets/images/327a70bb676f88670ccbe6961f97.png',
    "Jus d'orange pressé": 'assets/images/42e3412aa5be158c9c071023be83.png',
    'Limonade artisanale bio': 'assets/images/51263bbf9f18caa90c348d5xd141.png',
    "Huile d'olive extra vierge": 'assets/images/424r322r_(1).png',
  };

  static const _categoryColors = <String, Color>{
    'Fruits & Légumes': Color(0xFF0DB14B),
    'Boulangerie': Color(0xFFFFC709),
    'Produits laitiers': Color(0xFF77DDE7),
    'Viandes & Poissons': Color(0xFFFC5230),
    'Épicerie': Color(0xFFFF9800),
  };

  /// Load products from the backend API and convert to DataStruct
  Future<void> loadProductsFromApi() async {
    try {
      final api = ApiService();
      final products = await api.fetchAvailableProducts();
      if (products.isNotEmpty) {
        // Deduplicate by product name (same product in multiple stores)
        final seen = <String>{};
        final unique = <Map<String, dynamic>>[];
        for (final p in products) {
          final name = p['name'] as String? ?? '';
          if (seen.add(name)) unique.add(p);
        }

        _dataFruits = unique.map((p) {
          final name = p['name'] as String? ?? '';
          final originalPrice = (p['originalPrice'] as num?)?.toDouble() ?? 0.0;
          final discountedPrice =
              (p['discountedPrice'] as num?)?.toDouble() ?? 0.0;
          final discount = originalPrice > 0
              ? '-${((1 - discountedPrice / originalPrice) * 100).round()}%'
              : '-50%';
          final category = p['categoryName'] as String? ?? '';
          return DataStruct(
            title: name,
            image: _productImages[name] ?? 'assets/images/600x600_(1).png',
            priceOld: '${originalPrice.toStringAsFixed(2)} EUR',
            priceNew: '${discountedPrice.toStringAsFixed(2)} EUR',
            sale: discount,
            tag1: category,
            tag1Color: _categoryColors[category] ?? const Color(0xFF0DB14B),
            description:
                '${p['unit'] ?? ''} - ${p['storeName'] ?? ''}',
            oldPrice: originalPrice,
            newPrice: discountedPrice,
            id: (p['storeInventoryId']?.hashCode ?? 0) % 100000,
          );
        }).toList();
        prefs.setStringList(
            'ff_dataFruits', _dataFruits.map((x) => x.serialize()).toList());
        notifyListeners();
        debugPrint(
            'API: ${_dataFruits.length} produits charges depuis le backend');
      } else {
        debugPrint('API: aucun produit, utilisation des donnees locales');
      }
    } catch (e) {
      debugPrint('API: erreur chargement produits, fallback local: $e');
    }
  }

  late SharedPreferences prefs;

  List<FaqStruct> _faqList = [
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Qu\'est-ce que FoodFirst ?\",\"answer\":\"FoodFirst est une plateforme anti-gaspi a Bruxelles. Nous recuperons les invendus des supermarches partenaires (Delhaize, Colruyt, Carrefour) et vous les livrons a -50% avant leur date de peremption.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Comment passer commande ?\",\"answer\":\"Parcourez le catalogue, ajoutez des produits au panier, choisissez votre adresse de livraison et payez par carte ou Bancontact. Commandez avant 17h pour une livraison le jour meme !\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Dans quelles zones livrez-vous ?\",\"answer\":\"Nous livrons dans les 19 communes de Bruxelles, reparties en 3 zones : Centre (Bruxelles-Ville, Ixelles, Saint-Gilles, Etterbeek), Nord (Schaerbeek, Evere, Woluwe) et Sud (Forest, Uccle, Anderlecht, Molenbeek).\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Combien coute la livraison ?\",\"answer\":\"Les frais de livraison sont de 2.50 EUR par commande. La livraison est gratuite pour les abonnes et les commandes de plus de 30 EUR.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Quels moyens de paiement acceptez-vous ?\",\"answer\":\"Nous acceptons les cartes de credit/debit (Visa, Mastercard), Bancontact et les paiements 3D Secure via Stripe.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Qu\'est-ce que le Colis Surprise ?\",\"answer\":\"Le Colis Surprise est un abonnement mensuel (Decouverte 30 EUR, Classique 50 EUR, Premium 80 EUR) ou vous recevez des produits anti-gaspi selectionnes par nos soins. La valeur du colis est toujours superieure au prix paye !\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Pourquoi les produits sont-ils a -50% ?\",\"answer\":\"Nos produits proviennent d\'invendus de supermarches proches de leur date de peremption. Ils sont parfaitement consommables mais ne peuvent plus etre vendus en rayon. Nous les proposons a moitie prix pour eviter le gaspillage.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Comment suivre ma livraison ?\",\"answer\":\"Suivez votre livreur en temps reel sur la carte dans la section Mes Commandes. La position GPS est mise a jour toutes les 30 secondes.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Puis-je annuler ma commande ?\",\"answer\":\"Vous pouvez annuler votre commande tant qu\'elle n\'a pas ete preparee. Apres preparation, un remboursement partiel peut etre propose selon la situation.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Comment contacter le support ?\",\"answer\":\"Utilisez la section Aide et Support dans l\'app ou envoyez un email a support@foodfirst.be. Notre equipe repond sous 24h.\"}'))
  ];
  List<FaqStruct> get faqList => _faqList;
  set faqList(List<FaqStruct> value) {
    _faqList = value;
  }

  void addToFaqList(FaqStruct value) {
    faqList.add(value);
  }

  void removeFromFaqList(FaqStruct value) {
    faqList.remove(value);
  }

  void removeAtIndexFromFaqList(int index) {
    faqList.removeAt(index);
  }

  void updateFaqListAtIndex(
    int index,
    FaqStruct Function(FaqStruct) updateFn,
  ) {
    faqList[index] = updateFn(_faqList[index]);
  }

  void insertAtIndexInFaqList(int index, FaqStruct value) {
    faqList.insert(index, value);
  }

  List<LanguagesStruct> _languages = [
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"English\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/hdg5brj08oaz/25.png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Mandarin\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/p717acacqrie/4_(2).png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Hindi\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/91n33jpiv9o3/9_(1).png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Korean\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/044847p3rur1/20_(2).png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Arabic\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/h1h1dlx9m22l/24.png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Russian\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/1o8cxj1azfim/17.png\"}'))
  ];
  List<LanguagesStruct> get languages => _languages;
  set languages(List<LanguagesStruct> value) {
    _languages = value;
  }

  void addToLanguages(LanguagesStruct value) {
    languages.add(value);
  }

  void removeFromLanguages(LanguagesStruct value) {
    languages.remove(value);
  }

  void removeAtIndexFromLanguages(int index) {
    languages.removeAt(index);
  }

  void updateLanguagesAtIndex(
    int index,
    LanguagesStruct Function(LanguagesStruct) updateFn,
  ) {
    languages[index] = updateFn(_languages[index]);
  }

  void insertAtIndexInLanguages(int index, LanguagesStruct value) {
    languages.insert(index, value);
  }

  String _SelectedLang = 'English';
  String get SelectedLang => _SelectedLang;
  set SelectedLang(String value) {
    _SelectedLang = value;
    prefs.setString('ff_SelectedLang', value);
  }

  String _SelectedCountry = 'Bruxelles';
  String get SelectedCountry => _SelectedCountry;
  set SelectedCountry(String value) {
    _SelectedCountry = value;
  }

  bool _updater = false;
  bool get updater => _updater;
  set updater(bool value) {
    _updater = value;
  }

  int _messagesTab = 0;
  int get messagesTab => _messagesTab;
  set messagesTab(int value) {
    _messagesTab = value;
  }

  String _SelectedGender = '';
  String get SelectedGender => _SelectedGender;
  set SelectedGender(String value) {
    _SelectedGender = value;
  }

  int _SelectedCard = 0;
  int get SelectedCard => _SelectedCard;
  set SelectedCard(int value) {
    _SelectedCard = value;
  }

  bool _SearchStretching = false;
  bool get SearchStretching => _SearchStretching;
  set SearchStretching(bool value) {
    _SearchStretching = value;
  }

  bool _SelectedFilter1 = false;
  bool get SelectedFilter1 => _SelectedFilter1;
  set SelectedFilter1(bool value) {
    _SelectedFilter1 = value;
  }

  bool _SelectedSilter2 = false;
  bool get SelectedSilter2 => _SelectedSilter2;
  set SelectedSilter2(bool value) {
    _SelectedSilter2 = value;
  }

  String _SelectedAvailabilityFilter = 'Dans les 3 prochains jours';
  String get SelectedAvailabilityFilter => _SelectedAvailabilityFilter;
  set SelectedAvailabilityFilter(String value) {
    _SelectedAvailabilityFilter = value;
  }

  bool _SelectedFilter3 = false;
  bool get SelectedFilter3 => _SelectedFilter3;
  set SelectedFilter3(bool value) {
    _SelectedFilter3 = value;
  }

  String _SelectedLanguageFilter = '';
  String get SelectedLanguageFilter => _SelectedLanguageFilter;
  set SelectedLanguageFilter(String value) {
    _SelectedLanguageFilter = value;
  }

  String _SelectedSortBy = 'Popularité';
  String get SelectedSortBy => _SelectedSortBy;
  set SelectedSortBy(String value) {
    _SelectedSortBy = value;
  }

  String _SelectedCategoryHome = '';
  String get SelectedCategoryHome => _SelectedCategoryHome;
  set SelectedCategoryHome(String value) {
    _SelectedCategoryHome = value;
  }

  List<DataStruct> _dataFruits = [];
  List<DataStruct> get dataFruits => _dataFruits;
  set dataFruits(List<DataStruct> value) {
    _dataFruits = value;
    prefs.setStringList(
        'ff_dataFruits', value.map((x) => x.serialize()).toList());
  }

  void addToDataFruits(DataStruct value) {
    dataFruits.add(value);
    prefs.setStringList(
        'ff_dataFruits', _dataFruits.map((x) => x.serialize()).toList());
  }

  void removeFromDataFruits(DataStruct value) {
    dataFruits.remove(value);
    prefs.setStringList(
        'ff_dataFruits', _dataFruits.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDataFruits(int index) {
    dataFruits.removeAt(index);
    prefs.setStringList(
        'ff_dataFruits', _dataFruits.map((x) => x.serialize()).toList());
  }

  void updateDataFruitsAtIndex(
    int index,
    DataStruct Function(DataStruct) updateFn,
  ) {
    dataFruits[index] = updateFn(_dataFruits[index]);
    prefs.setStringList(
        'ff_dataFruits', _dataFruits.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDataFruits(int index, DataStruct value) {
    dataFruits.insert(index, value);
    prefs.setStringList(
        'ff_dataFruits', _dataFruits.map((x) => x.serialize()).toList());
  }

  List<DataStruct> _WishList = [];
  List<DataStruct> get WishList => _WishList;
  set WishList(List<DataStruct> value) {
    _WishList = value;
  }

  void addToWishList(DataStruct value) {
    WishList.add(value);
  }

  void removeFromWishList(DataStruct value) {
    WishList.remove(value);
  }

  void removeAtIndexFromWishList(int index) {
    WishList.removeAt(index);
  }

  void updateWishListAtIndex(
    int index,
    DataStruct Function(DataStruct) updateFn,
  ) {
    WishList[index] = updateFn(_WishList[index]);
  }

  void insertAtIndexInWishList(int index, DataStruct value) {
    WishList.insert(index, value);
  }

  List<String> _MessageList = [];
  List<String> get MessageList => _MessageList;
  set MessageList(List<String> value) {
    _MessageList = value;
  }

  void addToMessageList(String value) {
    MessageList.add(value);
  }

  void removeFromMessageList(String value) {
    MessageList.remove(value);
  }

  void removeAtIndexFromMessageList(int index) {
    MessageList.removeAt(index);
  }

  void updateMessageListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MessageList[index] = updateFn(_MessageList[index]);
  }

  void insertAtIndexInMessageList(int index, String value) {
    MessageList.insert(index, value);
  }

  List<String> _MyAddresses = ['Rue de la Loi 42, 1040 Etterbeek'];
  List<String> get MyAddresses => _MyAddresses;
  set MyAddresses(List<String> value) {
    _MyAddresses = value;
  }

  void addToMyAddresses(String value) {
    MyAddresses.add(value);
  }

  void removeFromMyAddresses(String value) {
    MyAddresses.remove(value);
  }

  void removeAtIndexFromMyAddresses(int index) {
    MyAddresses.removeAt(index);
  }

  void updateMyAddressesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MyAddresses[index] = updateFn(_MyAddresses[index]);
  }

  void insertAtIndexInMyAddresses(int index, String value) {
    MyAddresses.insert(index, value);
  }

  List<CartStruct> _CartList = [];
  List<CartStruct> get CartList => _CartList;
  set CartList(List<CartStruct> value) {
    _CartList = value;
    prefs.setStringList(
        'ff_CartList', value.map((x) => x.serialize()).toList());
  }

  void addToCartList(CartStruct value) {
    CartList.add(value);
    prefs.setStringList(
        'ff_CartList', _CartList.map((x) => x.serialize()).toList());
  }

  void removeFromCartList(CartStruct value) {
    CartList.remove(value);
    prefs.setStringList(
        'ff_CartList', _CartList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCartList(int index) {
    CartList.removeAt(index);
    prefs.setStringList(
        'ff_CartList', _CartList.map((x) => x.serialize()).toList());
  }

  void updateCartListAtIndex(
    int index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    CartList[index] = updateFn(_CartList[index]);
    prefs.setStringList(
        'ff_CartList', _CartList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCartList(int index, CartStruct value) {
    CartList.insert(index, value);
    prefs.setStringList(
        'ff_CartList', _CartList.map((x) => x.serialize()).toList());
  }

  bool _CartGift = false;
  bool get CartGift => _CartGift;
  set CartGift(bool value) {
    _CartGift = value;
  }

  int _checkoutTab = 0;
  int get checkoutTab => _checkoutTab;
  set checkoutTab(int value) {
    _checkoutTab = value;
  }

  String _SelectedTip = '';
  String get SelectedTip => _SelectedTip;
  set SelectedTip(String value) {
    _SelectedTip = value;
  }

  double _start = 0.0;
  double get start => _start;
  set start(double value) {
    _start = value;
  }

  double _end = 100.0;
  double get end => _end;
  set end(double value) {
    _end = value;
  }

  List<String> _SelectedRatingFilter = [];
  List<String> get SelectedRatingFilter => _SelectedRatingFilter;
  set SelectedRatingFilter(List<String> value) {
    _SelectedRatingFilter = value;
  }

  void addToSelectedRatingFilter(String value) {
    SelectedRatingFilter.add(value);
  }

  void removeFromSelectedRatingFilter(String value) {
    SelectedRatingFilter.remove(value);
  }

  void removeAtIndexFromSelectedRatingFilter(int index) {
    SelectedRatingFilter.removeAt(index);
  }

  void updateSelectedRatingFilterAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SelectedRatingFilter[index] = updateFn(_SelectedRatingFilter[index]);
  }

  void insertAtIndexInSelectedRatingFilter(int index, String value) {
    SelectedRatingFilter.insert(index, value);
  }

  List<String> _SelectedCountryFilter = [];
  List<String> get SelectedCountryFilter => _SelectedCountryFilter;
  set SelectedCountryFilter(List<String> value) {
    _SelectedCountryFilter = value;
  }

  void addToSelectedCountryFilter(String value) {
    SelectedCountryFilter.add(value);
  }

  void removeFromSelectedCountryFilter(String value) {
    SelectedCountryFilter.remove(value);
  }

  void removeAtIndexFromSelectedCountryFilter(int index) {
    SelectedCountryFilter.removeAt(index);
  }

  void updateSelectedCountryFilterAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SelectedCountryFilter[index] = updateFn(_SelectedCountryFilter[index]);
  }

  void insertAtIndexInSelectedCountryFilter(int index, String value) {
    SelectedCountryFilter.insert(index, value);
  }

  List<String> _SelectedBrandFilter = [];
  List<String> get SelectedBrandFilter => _SelectedBrandFilter;
  set SelectedBrandFilter(List<String> value) {
    _SelectedBrandFilter = value;
  }

  void addToSelectedBrandFilter(String value) {
    SelectedBrandFilter.add(value);
  }

  void removeFromSelectedBrandFilter(String value) {
    SelectedBrandFilter.remove(value);
  }

  void removeAtIndexFromSelectedBrandFilter(int index) {
    SelectedBrandFilter.removeAt(index);
  }

  void updateSelectedBrandFilterAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SelectedBrandFilter[index] = updateFn(_SelectedBrandFilter[index]);
  }

  void insertAtIndexInSelectedBrandFilter(int index, String value) {
    SelectedBrandFilter.insert(index, value);
  }

  List<String> _SelectedPackageList = [];
  List<String> get SelectedPackageList => _SelectedPackageList;
  set SelectedPackageList(List<String> value) {
    _SelectedPackageList = value;
  }

  void addToSelectedPackageList(String value) {
    SelectedPackageList.add(value);
  }

  void removeFromSelectedPackageList(String value) {
    SelectedPackageList.remove(value);
  }

  void removeAtIndexFromSelectedPackageList(int index) {
    SelectedPackageList.removeAt(index);
  }

  void updateSelectedPackageListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SelectedPackageList[index] = updateFn(_SelectedPackageList[index]);
  }

  void insertAtIndexInSelectedPackageList(int index, String value) {
    SelectedPackageList.insert(index, value);
  }

  List<String> _FiltersCategoryList = [];
  List<String> get FiltersCategoryList => _FiltersCategoryList;
  set FiltersCategoryList(List<String> value) {
    _FiltersCategoryList = value;
  }

  void addToFiltersCategoryList(String value) {
    FiltersCategoryList.add(value);
  }

  void removeFromFiltersCategoryList(String value) {
    FiltersCategoryList.remove(value);
  }

  void removeAtIndexFromFiltersCategoryList(int index) {
    FiltersCategoryList.removeAt(index);
  }

  void updateFiltersCategoryListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FiltersCategoryList[index] = updateFn(_FiltersCategoryList[index]);
  }

  void insertAtIndexInFiltersCategoryList(int index, String value) {
    FiltersCategoryList.insert(index, value);
  }

  bool _Notif1 = true;
  bool get Notif1 => _Notif1;
  set Notif1(bool value) {
    _Notif1 = value;
  }

  bool _Notif2 = false;
  bool get Notif2 => _Notif2;
  set Notif2(bool value) {
    _Notif2 = value;
  }

  bool _Notif3 = true;
  bool get Notif3 => _Notif3;
  set Notif3(bool value) {
    _Notif3 = value;
  }

  bool _Notif4 = true;
  bool get Notif4 => _Notif4;
  set Notif4(bool value) {
    _Notif4 = value;
  }

  bool _Notif5 = false;
  bool get Notif5 => _Notif5;
  set Notif5(bool value) {
    _Notif5 = value;
  }

  String _ArchiveCategories = '';
  String get ArchiveCategories => _ArchiveCategories;
  set ArchiveCategories(String value) {
    _ArchiveCategories = value;
  }

  bool _fromRegister1 = false;
  bool get fromRegister1 => _fromRegister1;
  set fromRegister1(bool value) {
    _fromRegister1 = value;
  }

  bool _fromRegister2 = false;
  bool get fromRegister2 => _fromRegister2;
  set fromRegister2(bool value) {
    _fromRegister2 = value;
  }

  List<String> _cartUpdater = [];
  List<String> get cartUpdater => _cartUpdater;
  set cartUpdater(List<String> value) {
    _cartUpdater = value;
  }

  void addToCartUpdater(String value) {
    cartUpdater.add(value);
  }

  void removeFromCartUpdater(String value) {
    cartUpdater.remove(value);
  }

  void removeAtIndexFromCartUpdater(int index) {
    cartUpdater.removeAt(index);
  }

  void updateCartUpdaterAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cartUpdater[index] = updateFn(_cartUpdater[index]);
  }

  void insertAtIndexInCartUpdater(int index, String value) {
    cartUpdater.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
