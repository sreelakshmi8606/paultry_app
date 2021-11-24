// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class FarmDataModel {
  String? FarmName;
  String? location;
  int ? capacity;
  String? attenderLedger;
  String? currentBatchId;
  DateTime? currentDate;
  DateTime? lastPickupDate;
  String ? FarmId;
FarmDataModel.empty();
  FarmDataModel(
      {required this.FarmName,
      required this.location,
      required this.capacity,
      required this.attenderLedger,
      required this.currentBatchId,
      required this.currentDate,
      required this.lastPickupDate,
      required this.FarmId
      });
  FarmDataModel copyWith({
    String? FarmName,
    String? location,
    int? capacity,
    String? attenderLedger,
    String? currentBatchId,
    DateTime? currentDate,
    DateTime? lastPickupDate,
    String ? FarmId,
  }) {
    return FarmDataModel(
      FarmName: FarmName ?? this.FarmName,
      location: location ?? this.location,
      capacity: capacity ?? this.capacity,
      attenderLedger: attenderLedger ?? this.attenderLedger,
      currentBatchId: currentBatchId ?? this.currentBatchId,
      currentDate: currentDate ?? this.currentDate,
      lastPickupDate: lastPickupDate ?? this.lastPickupDate,
      FarmId: FarmId??this.FarmId
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FarmName': FarmName,
      'location': location,
      'capacity': capacity,
      'attenderLedger': attenderLedger,
      'currentBatchId': currentBatchId,
      'currentDate': currentDate.toString(),
      'lastPickupDate': lastPickupDate?.millisecondsSinceEpoch,
      'FarmId':FarmId,
    };
  }

  factory FarmDataModel.fromMap(Map<String, dynamic> map) {
    return FarmDataModel(
      FarmName: map['FarmName'],
      location: map['location'],
      capacity: map['capacity'],
      attenderLedger: map['attenderLedger'],
      currentBatchId: map['currentBatchId'],
      currentDate: map['currentDate'],
      lastPickupDate: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['lastPickupDate'] ?? '0') * 1000),

      FarmId: map['FarmId']
    );
  }

  String toJson() => json.encode(toMap());

  factory FarmDataModel.fromJson(String source) =>
      FarmDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FarmDataModel('
        'FarmName: $FarmName, '
        'location: $location,'
        'capacity: $capacity, '
        'attenderLedger: $attenderLedger,'
        'currentBatchId: $currentBatchId,'
        'currentDate: $currentDate,'
        'lastPickupDate: $lastPickupDate,'
        'FarmId: $FarmId,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FarmDataModel &&
        other.FarmName == FarmName &&
        other.location == location &&
        other.capacity == capacity &&
        other.attenderLedger == attenderLedger &&
        other.currentBatchId == currentBatchId &&
        other.currentDate == currentDate &&
        other.lastPickupDate == lastPickupDate&&
    other.FarmId==FarmId;
  }

  @override
  int get hashCode {
    return FarmName.hashCode ^
        location.hashCode ^
        capacity.hashCode ^
        attenderLedger.hashCode ^
        currentBatchId.hashCode ^
        currentDate.hashCode ^
        lastPickupDate.hashCode^
    FarmId.hashCode;
  }
}
