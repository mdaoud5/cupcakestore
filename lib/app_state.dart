import 'package:flutter/material.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _productTotal = 0;
  double get productTotal => _productTotal;
  set productTotal(double value) {
    _productTotal = value;
  }

  List<CartItemTypeStruct> _cartItemList = [];
  List<CartItemTypeStruct> get cartItemList => _cartItemList;
  set cartItemList(List<CartItemTypeStruct> value) {
    _cartItemList = value;
  }

  void addToCartItemList(CartItemTypeStruct value) {
    _cartItemList.add(value);
  }

  void removeFromCartItemList(CartItemTypeStruct value) {
    _cartItemList.remove(value);
  }

  void removeAtIndexFromCartItemList(int index) {
    _cartItemList.removeAt(index);
  }

  void updateCartItemListAtIndex(
    int index,
    CartItemTypeStruct Function(CartItemTypeStruct) updateFn,
  ) {
    _cartItemList[index] = updateFn(_cartItemList[index]);
  }

  void insertAtIndexInCartItemList(int index, CartItemTypeStruct value) {
    _cartItemList.insert(index, value);
  }

  double _taxaDeIntrega = 12;
  double get taxaDeIntrega => _taxaDeIntrega;
  set taxaDeIntrega(double value) {
    _taxaDeIntrega = value;
  }

  double _cupomValue = 0;
  double get cupomValue => _cupomValue;
  set cupomValue(double value) {
    _cupomValue = value;
  }

  double _total = 0;
  double get total => _total;
  set total(double value) {
    _total = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
