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

List<ProductsRecord> chooseList(
  List<ProductsRecord> allProductList,
  List<ProductsRecord> searchList,
) {
  return searchList.length > 0 ? searchList : allProductList;
}

int getDay(DateTime date) {
  return date.day;
}

int getYear(DateTime date) {
  return date.year;
}

String getMonth(DateTime date) {
  // return the month as string from date
  return DateFormat('MMMM').format(date);
}

Color getColor(String status) {
  switch (status) {
    case "Preparação":
      return Color(0xFFFFF9E9);
    case "Cancelado":
      return Color(0xFFFEF0F1);
    case "Finalizado":
      return Color(0xFFE7FFF1);
    default:
      return Color(0xFFFFF9E9);
  }
}

Color getColorStatus(String status) {
  switch (status) {
    case "Preparação":
      return Color(0xFF8F7010);
    case "Cancelado":
      return Color(0xFFF4444B);
    case "Finalizado":
      return Color(0xFF08C755);
    default:
      return Color(0xFF8F7010);
  }
}
