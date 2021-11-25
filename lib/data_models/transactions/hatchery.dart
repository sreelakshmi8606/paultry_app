// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class TransactionHatecheryDataModel {
  String? FarmId;
  String? createBatch;
  DateTime? date;
  String? chooseHatchery;
  num? numberOfeggs;
  String? chickProduced;
  DateTime? pickUpdate;


  TransactionHatecheryDataModel({
    required this.FarmId,
    required this.createBatch,
    required this.date,
    required this.chooseHatchery,
    required this.numberOfeggs,
    required this.chickProduced,
     required this.pickUpdate,

  });
  TransactionHatecheryDataModel.empty();

  TransactionHatecheryDataModel copyWith({
    String? FarmId,
    String? createBatch,
    DateTime? date,
    String? chooseHatchery,
    num? numberOfeggs,
    String? chickProduced,
    DateTime? pickUpdate,
      }) {
    return TransactionHatecheryDataModel(
      FarmId: FarmId ?? this.FarmId,
      createBatch: createBatch ?? this.createBatch,
       date: date ?? this.date,
      chooseHatchery: chooseHatchery ?? this.chooseHatchery,
      numberOfeggs: numberOfeggs ?? this.numberOfeggs,
      chickProduced: chickProduced ?? this.chickProduced,
       pickUpdate: pickUpdate ?? this.pickUpdate,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FarmId': FarmId,
      'createBatch': createBatch,
      'date': date?.millisecondsSinceEpoch,
      'chooseHatchery': chooseHatchery,
      'numberOfeggs': numberOfeggs,
      'chickProduced': chickProduced,
       'pickUpdate': pickUpdate?.millisecondsSinceEpoch,


    };
  }

  factory TransactionHatecheryDataModel.fromMap(Map<String, dynamic> map) {
    return TransactionHatecheryDataModel(
      FarmId: map['FarmId'],
      createBatch: map['createBatch'],
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['date'] ?? '0') * 1000),
      chooseHatchery: map['chooseHatchery'],
      numberOfeggs: map['numberOfeggs'],
      chickProduced: map['chickProduced'],
      pickUpdate: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['pickUpdate'] ?? '0') * 1000),
          );
  }

  String toJson() => json.encode(toMap());

  factory TransactionHatecheryDataModel.fromJson(String source) =>
      TransactionHatecheryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionHatecheryDataModel('
        'FarmId: $FarmId,'
        'createBatch:$createBatch'
        'date: $date, '
        'chooseHatchery: $chooseHatchery, '
        'numberOfeggs: $numberOfeggs,'
        'chickProduced:$chickProduced,'
        'pickUpdate: $pickUpdate,'

        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionHatecheryDataModel &&
        other.FarmId == FarmId&&
        other.createBatch == createBatch &&
        other.date == date &&
        other.chooseHatchery == chooseHatchery &&
        other.numberOfeggs == numberOfeggs &&
        other.chickProduced == chickProduced&&
     other.pickUpdate == pickUpdate;
  }

  @override
  int get hashCode {
    return FarmId.hashCode^
      createBatch.hashCode ^
         date.hashCode ^
        chooseHatchery.hashCode ^
        numberOfeggs.hashCode ^
        chickProduced.hashCode^
     pickUpdate.hashCode;
  }
}
