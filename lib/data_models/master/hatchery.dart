// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class HatcheryDataModel {
  String ? FarmId;
  String? name;
  int? capacity;
  String? location;
  String? attenderLedger;
  String? currentBatchId;
  DateTime? currentDate;
  DateTime? lastPickupDate;


  HatcheryDataModel(
      {required this.FarmId,
        required this.name,
      required this.capacity,
      required this.location,
      required this.attenderLedger,
      required this.currentBatchId,
      required this.currentDate,
      required this.lastPickupDate,
      });
      HatcheryDataModel.empty();
  HatcheryDataModel copyWith({
    String? FarmId,
    String? name,
    int? capacity,
    String? location,
    String? attenderLedger,
    String? currentBatchId,
    DateTime? currentDate,
    DateTime? lastPickupDate,

  }) {
    return HatcheryDataModel(
      FarmId: FarmId??this.FarmId,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      location: location ?? this.location,
      attenderLedger: attenderLedger ?? this.attenderLedger,
      currentBatchId: currentBatchId ?? this.currentBatchId,
      currentDate: currentDate ?? this.currentDate,
      lastPickupDate: lastPickupDate ?? this.lastPickupDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FarmId':FarmId,
      'name': name,
      'capacity': capacity,
      'location': location,
      'attenderLedger': attenderLedger,
      'currentBatchId': currentBatchId,
      'currentDate': currentDate.toString(),
      'lastPickupDate': lastPickupDate.toString(),
    };
  }

  factory HatcheryDataModel.fromMap(Map<String, dynamic> map) {
    return HatcheryDataModel(
      FarmId: map['FarmId'],
      name: map['name'],
      capacity: map['capacity'],
      location: map['location'],
      attenderLedger: map['attenderLedger'],
      currentBatchId: map['currentBatchId'],
      currentDate: map['currentDate'],
      lastPickupDate: map['lastPickupDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HatcheryDataModel.fromJson(String source) =>
      HatcheryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HatcheryDataModel('
        'FarmId:$FarmId,'
        'name: $name, '
        'capacity: $capacity, '
        'location: $location,'
        'attenderLedger: $attenderLedger,'
        'currentBatchId: $currentBatchId,'
        'currentDate: $currentDate,'
        'lastPickupDate: $lastPickupDate,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HatcheryDataModel &&
        other.FarmId==FarmId &&
        other.name == name &&
        other.capacity == capacity &&
        other.location == location &&
        other.attenderLedger == attenderLedger &&
        other.currentBatchId == currentBatchId &&
        other.currentDate == currentDate &&
        other.lastPickupDate == lastPickupDate;
  }

  @override
  int get hashCode {
    return FarmId.hashCode^
      name.hashCode ^
        capacity.hashCode ^
        location.hashCode ^
        attenderLedger.hashCode ^
        currentBatchId.hashCode ^
        currentDate.hashCode ^
        lastPickupDate.hashCode;
  }
}

