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

double sumTotal(
  double fee,
  double productsSum,
  double copum,
) {
  return fee + productsSum - copum;
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

double calcuateDestance(
  LatLng store,
  FFPlace clinetAdress,
) {
  // return the destance between two googlePlaces
  final double lat1 = store.latitude;
  final double lon1 = store.longitude;
  final double lat2 = clinetAdress.latLng.latitude;
  final double lon2 = clinetAdress.latLng.longitude;

  const double p = 0.017453292519943295;
  final double a = 0.5 -
      math.cos((lat2 - lat1) * p) / 2 +
      math.cos(lat1 * p) *
          math.cos(lat2 * p) *
          (1 - math.cos((lon2 - lon1) * p)) /
          2;
  return 12742 * math.asin(math.sqrt(a));
}

double calculateDeleveryFee(
  LatLng store,
  FFPlace adress,
) {
  final double lat1 = store.latitude;
  final double lon1 = store.longitude;
  final double lat2 = adress.latLng.latitude;
  final double lon2 = adress.latLng.longitude;

  const double p = 0.017453292519943295;
  final double a = 0.5 -
      math.cos((lat2 - lat1) * p) / 2 +
      math.cos(lat1 * p) *
          math.cos(lat2 * p) *
          (1 - math.cos((lon2 - lon1) * p)) /
          2;
  final double distance = 12742 * math.asin(math.sqrt(a));

  if (distance < 2) {
    return 5;
  } else {
    return double.parse((5 + 1.5 * distance).toStringAsFixed(2));
  }
}

int orderNumber() {
  // A function read server time and return a sequencial number
  final now = DateTime.now();
  final serverTime = now.millisecondsSinceEpoch;
  return serverTime;
}
