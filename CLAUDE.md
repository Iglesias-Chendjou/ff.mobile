# CLAUDE.md — ff.mobile (App Mobile Flutter)

## Projet
Plateforme Anti-Gaspi Bruxelles — Application mobile client (iOS & Android).
App principale permettant aux clients de commander, suivre les livraisons en temps reel, gerer abonnements et colis surprise.

## Stack technique
- **Framework** : Flutter (Dart)
- **State management** : Riverpod ou BLoC
- **HTTP** : Dio (interceptors JWT)
- **Paiement** : flutter_stripe (Stripe SDK)
- **Notifications push** : firebase_messaging (FCM)
- **Temps reel** : signalr_netcore (SignalR client)
- **Cartes** : google_maps_flutter ou flutter_map (suivi GPS livreur)
- **Stockage local** : shared_preferences (token JWT), hive ou sqflite (cache)
- **Navigation** : GoRouter

## Structure attendue
```
ff.mobile/
├── lib/
│   ├── main.dart
│   ├── app.dart                 # MaterialApp, routing, theme
│   ├── core/
│   │   ├── api/                 # ApiClient (Dio), interceptors
│   │   ├── auth/                # AuthService, token management
│   │   ├── notifications/       # FCM setup, local notifications
│   │   └── theme/               # Couleurs, typographie (vert anti-gaspi)
│   ├── features/
│   │   ├── auth/                # LoginScreen, RegisterScreen
│   │   ├── catalog/             # CatalogScreen, ProductDetailScreen, SearchScreen
│   │   ├── cart/                # CartScreen, CheckoutScreen
│   │   ├── orders/              # OrderHistoryScreen, OrderDetailScreen
│   │   ├── tracking/            # LiveTrackingScreen (carte + SignalR)
│   │   ├── subscriptions/       # SubscriptionScreen, PlanSelectionScreen
│   │   ├── surprise_box/        # SurpriseBoxPlansScreen, SurpriseBoxHistoryScreen
│   │   ├── profile/             # ProfileScreen, AddressesScreen
│   │   ├── notifications/       # NotificationCenterScreen
│   │   └── rating/              # RateDeliveryScreen
│   ├── models/                  # Classes Dart (miroir des DTOs API)
│   ├── repositories/            # Couche d'acces API
│   ├── providers/               # Riverpod providers (ou BLoC)
│   └── widgets/                 # Widgets reutilisables
├── assets/
├── android/
├── ios/
└── pubspec.yaml
```

## Fonctionnalites (identiques au frontend web)
1. **Auth** : inscription / connexion
2. **Catalogue** : parcourir par categorie, rechercher, filtrer par zone
3. **Panier & Commande** : ajouter au panier, payer via Stripe (CB/Bancontact/3D Secure)
4. **Suivi livraison temps reel** : carte avec position GPS du livreur (SignalR, MAJ toutes les 30s)
5. **Abonnement recurrent** : plans Mensuel/Trimestriel/Semestriel/Annuel
6. **Colis Surprise** : forfaits Decouverte (30EUR), Classique (50EUR), Premium (80EUR)
7. **Historique commandes** : liste, detail, statuts
8. **Notifications push** : FCM natives (iOS/Android)
9. **Evaluation** : noter livraison (1-5 etoiles)
10. **Profil** : adresses, preferences

## Regles metier cote mobile
- **Deadline 17h** : avertissement visuel si l'heure approche
- **Zone** : detecter la localisation GPS du client pour filtrer le catalogue par zone
- **Push notifications** : demander la permission au premier lancement
- **Mode hors-ligne** : cache du catalogue pour navigation offline, sync au retour
- **Prix** : afficher prix barre + prix -50%

## Conventions
- Langue du code : anglais
- Nommage : snake_case pour les fichiers (convention Dart/Flutter)
- PascalCase pour les classes, camelCase pour les variables
- Un widget par fichier
- Separation claire : UI (screens/widgets) / logique (providers/repositories)
- Responsive : supporter phones et tablettes
