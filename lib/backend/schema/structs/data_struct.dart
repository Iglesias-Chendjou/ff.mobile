// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    String? title,
    String? image,
    String? priceOld,
    String? priceNew,
    String? sale,
    String? tag1,
    Color? tag1Color,
    String? description,
    double? oldPrice,
    double? newPrice,
    int? id,
  })  : _title = title,
        _image = image,
        _priceOld = priceOld,
        _priceNew = priceNew,
        _sale = sale,
        _tag1 = tag1,
        _tag1Color = tag1Color,
        _description = description,
        _oldPrice = oldPrice,
        _newPrice = newPrice,
        _id = id;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "priceOld" field.
  String? _priceOld;
  String get priceOld => _priceOld ?? '';
  set priceOld(String? val) => _priceOld = val;

  bool hasPriceOld() => _priceOld != null;

  // "priceNew" field.
  String? _priceNew;
  String get priceNew => _priceNew ?? '';
  set priceNew(String? val) => _priceNew = val;

  bool hasPriceNew() => _priceNew != null;

  // "sale" field.
  String? _sale;
  String get sale => _sale ?? '';
  set sale(String? val) => _sale = val;

  bool hasSale() => _sale != null;

  // "tag1" field.
  String? _tag1;
  String get tag1 => _tag1 ?? '';
  set tag1(String? val) => _tag1 = val;

  bool hasTag1() => _tag1 != null;

  // "tag1Color" field.
  Color? _tag1Color;
  Color? get tag1Color => _tag1Color;
  set tag1Color(Color? val) => _tag1Color = val;

  bool hasTag1Color() => _tag1Color != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "OldPrice" field.
  double? _oldPrice;
  double get oldPrice => _oldPrice ?? 0.0;
  set oldPrice(double? val) => _oldPrice = val;

  void incrementOldPrice(double amount) => oldPrice = oldPrice + amount;

  bool hasOldPrice() => _oldPrice != null;

  // "NewPrice" field.
  double? _newPrice;
  double get newPrice => _newPrice ?? 0.0;
  set newPrice(double? val) => _newPrice = val;

  void incrementNewPrice(double amount) => newPrice = newPrice + amount;

  bool hasNewPrice() => _newPrice != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        title: data['title'] as String?,
        image: data['image'] as String?,
        priceOld: data['priceOld'] as String?,
        priceNew: data['priceNew'] as String?,
        sale: data['sale'] as String?,
        tag1: data['tag1'] as String?,
        tag1Color: getSchemaColor(data['tag1Color']),
        description: data['description'] as String?,
        oldPrice: castToType<double>(data['OldPrice']),
        newPrice: castToType<double>(data['NewPrice']),
        id: castToType<int>(data['id']),
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'image': _image,
        'priceOld': _priceOld,
        'priceNew': _priceNew,
        'sale': _sale,
        'tag1': _tag1,
        'tag1Color': _tag1Color,
        'description': _description,
        'OldPrice': _oldPrice,
        'NewPrice': _newPrice,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'priceOld': serializeParam(
          _priceOld,
          ParamType.String,
        ),
        'priceNew': serializeParam(
          _priceNew,
          ParamType.String,
        ),
        'sale': serializeParam(
          _sale,
          ParamType.String,
        ),
        'tag1': serializeParam(
          _tag1,
          ParamType.String,
        ),
        'tag1Color': serializeParam(
          _tag1Color,
          ParamType.Color,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'OldPrice': serializeParam(
          _oldPrice,
          ParamType.double,
        ),
        'NewPrice': serializeParam(
          _newPrice,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        priceOld: deserializeParam(
          data['priceOld'],
          ParamType.String,
          false,
        ),
        priceNew: deserializeParam(
          data['priceNew'],
          ParamType.String,
          false,
        ),
        sale: deserializeParam(
          data['sale'],
          ParamType.String,
          false,
        ),
        tag1: deserializeParam(
          data['tag1'],
          ParamType.String,
          false,
        ),
        tag1Color: deserializeParam(
          data['tag1Color'],
          ParamType.Color,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        oldPrice: deserializeParam(
          data['OldPrice'],
          ParamType.double,
          false,
        ),
        newPrice: deserializeParam(
          data['NewPrice'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        title == other.title &&
        image == other.image &&
        priceOld == other.priceOld &&
        priceNew == other.priceNew &&
        sale == other.sale &&
        tag1 == other.tag1 &&
        tag1Color == other.tag1Color &&
        description == other.description &&
        oldPrice == other.oldPrice &&
        newPrice == other.newPrice &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        image,
        priceOld,
        priceNew,
        sale,
        tag1,
        tag1Color,
        description,
        oldPrice,
        newPrice,
        id
      ]);
}

DataStruct createDataStruct({
  String? title,
  String? image,
  String? priceOld,
  String? priceNew,
  String? sale,
  String? tag1,
  Color? tag1Color,
  String? description,
  double? oldPrice,
  double? newPrice,
  int? id,
}) =>
    DataStruct(
      title: title,
      image: image,
      priceOld: priceOld,
      priceNew: priceNew,
      sale: sale,
      tag1: tag1,
      tag1Color: tag1Color,
      description: description,
      oldPrice: oldPrice,
      newPrice: newPrice,
      id: id,
    );
