import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isCartItem(
  DocumentReference docRef,
  List<CartItemTypeStruct> cartItemsList,
) {
  for (var item in cartItemsList) {
    if (item.cartItem == docRef) {
      return true;
    }
  }
  return false;
}

double sumCartItems(List<CartItemTypeStruct> cartItems) {
  double sum = 0.0;

  for (CartItemTypeStruct item in cartItems) {
    sum = sum + (item.valorTotal * item.quantity);
  }
  return sum;
}

int? findIndexCart(
  DocumentReference ref,
  List<CartItemTypeStruct> cartList,
) {
  for (var i = 0; i < cartList.length; i++) {
    if (cartList[i].cartItem == ref) {
      return i;
    }
  }
  return null;
}

double? addDliveryFee(
  double fee,
  double productsSum,
) {
  return fee + productsSum;
}
