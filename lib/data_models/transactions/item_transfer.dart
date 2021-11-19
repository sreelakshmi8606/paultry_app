// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class ItemTransferDataModel {
  // LIST OF	     ITEM ID	STR
  //              QUANTITY	NUM
  //              ITEM NAME	STR
  //                    UOM	INT
  DateTime date;
  String farm;
  String BatchId;
  List<String> itemId;
  List<num> Quantity;
  List<String> itemname;
  List<int> Uom;

  ItemTransferDataModel({
    required this.date,
    required this.farm,
    required this.BatchId,
    required this.itemId,
    required this.Quantity,
    required this.itemname,
    required this.Uom,
  });

  // List <dynamic> itemId;
  // List<dynamic> Quantity;
  // List<dynamic> itemname;
  // List<dynamic> Uom;

  ItemTransferDataModel copyWith({
    DateTime? date,
    String? farm,
    String? BatchId,
    List<String>? itemId,
    List<num>? Quantity,
    List<String>? itemname,
    List<int>? Uom,
  }) {
    return ItemTransferDataModel(
      date: date ?? this.date,
      farm: farm ?? this.farm,
      BatchId: BatchId ?? this.BatchId,
      itemId: itemId ?? this.itemId,
      Quantity: Quantity ?? this.Quantity,
      itemname: itemname ?? this.itemname,
      Uom: Uom ?? this.Uom,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date?.millisecondsSinceEpoch.toString(),
      'farm': farm,
      'BatchId': BatchId,
      'itemId': itemId,
      'Quantity': Quantity,
      'itemname': itemname,
      'Uom': Uom,
    };
  }

  factory ItemTransferDataModel.fromMap(Map<String, dynamic> map) {
    return ItemTransferDataModel(
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['date'] ?? '0') * 1000),
      farm: map['farm'],
      BatchId: map['BatchId'],
      itemId: List<String>.from(map['itemId']),
      Quantity: List<num>.from(map['Quantity']),
      itemname: List<String>.from(map['itemname']),
      Uom: List<int>.from(map['Uom']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemTransferDataModel.fromJson(String source) =>
      ItemTransferDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemTransferDataModel('
        'date: $date, '
        'farm: $farm, '
        'BatchId: $BatchId,'
        'itemId: $itemId,'
        'Quantity: $Quantity,'
        'itemname: $itemname,'
        'Uom:$Uom,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemTransferDataModel &&
        other.date == date &&
        other.farm == farm &&
        other.BatchId == BatchId &&
        other.itemId == itemId &&
        other.Quantity == Quantity &&
        other.itemname == itemname &&
        other.Uom == Uom;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        farm.hashCode ^
        BatchId.hashCode ^
        itemId.hashCode ^
        Quantity.hashCode ^
        itemname.hashCode ^
        Uom.hashCode;
  }
}
