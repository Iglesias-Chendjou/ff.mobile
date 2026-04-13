// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends BaseStruct {
  CartStruct({
    int? id,
    DataStruct? item,
    int? quantity,
    DateTime? date,
  })  : _id = id,
        _item = item,
        _quantity = quantity,
        _date = date;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "item" field.
  DataStruct? _item;
  DataStruct get item => _item ?? DataStruct();
  set item(DataStruct? val) => _item = val;

  void updateItem(Function(DataStruct) updateFn) {
    updateFn(_item ??= DataStruct());
  }

  bool hasItem() => _item != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        id: castToType<int>(data['id']),
        item: data['item'] is DataStruct
            ? data['item']
            : DataStruct.maybeFromMap(data['item']),
        quantity: castToType<int>(data['quantity']),
        date: data['date'] as DateTime?,
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'item': _item?.toMap(),
        'quantity': _quantity,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'item': serializeParam(
          _item,
          ParamType.DataStruct,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        item: deserializeStructParam(
          data['item'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartStruct &&
        id == other.id &&
        item == other.item &&
        quantity == other.quantity &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([id, item, quantity, date]);
}

CartStruct createCartStruct({
  int? id,
  DataStruct? item,
  int? quantity,
  DateTime? date,
}) =>
    CartStruct(
      id: id,
      item: item ?? DataStruct(),
      quantity: quantity,
      date: date,
    );
