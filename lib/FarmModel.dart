// ignore_for_file: file_names

import 'dart:convert';

import 'package:hive/hive.dart';

part 'FarmModel.g.dart';

@HiveType(typeId: 0)
class FarmDataModel {
  @HiveField(0)
  String farmname;
  @HiveField(1)
  String location;
  @HiveField(2)
  int capacity;
  @HiveField(3)
  String attenderLedger;
  @HiveField(4)
  String currentBatchId;
  @HiveField(5)
  DateTime currentDate;
  @HiveField(6)
  DateTime pastPickupDate;

  FarmDataModel(this.farmname, this.capacity, this.location,
      this.attenderLedger, this.currentBatchId, this.currentDate,
      this.pastPickupDate,);
//   FarmDataModel.empty();
//   FarmDataModel(
//       {required this.farmname,
//         required this.location,
//         required this.capacity,
//         required this.attenderLedger,
//         required this.currentBatchId,
//         required this.currentDate,
//         required this.pastPickupDate});
//
//   FarmDataModel copyWith({
//     String? farmname,
//     String? location,
//     int? capacity,
//     String? attenderLedger,
//     String? currentBatchId,
//     DateTime? currentDate,
//     DateTime? pastPickupDate,
//   }) {
//     return FarmDataModel(
//       farmname: farmname ?? this.farmname,
//       location: location ?? this.location,
//       capacity: capacity ?? this.capacity,
//       attenderLedger: attenderLedger ?? this.attenderLedger,
//       currentBatchId: currentBatchId ?? this.currentBatchId,
//       currentDate: currentDate ?? this.currentDate,
//       pastPickupDate: pastPickupDate ?? this.pastPickupDate,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'farmname': farmname,
//       'loction': location,
//       'capacity': capacity,
//       'attenderLedger': attenderLedger,
//       'currentBatchId': currentBatchId,
//       'currentDate': currentDate.toString(),
//       'pastPickupDate': pastPickupDate.toString(),
//     };
//   }
//
//   factory FarmDataModel.fromMap(Map<String, dynamic> map) {
//     return FarmDataModel(
//       farmname: map['farmname'],
//       location: map['location'],
//       capacity: map['capacity'],
//       attenderLedger: map['attenderLedger'],
//       currentBatchId: map['currentBatchId'],
//       currentDate: map['currentDate'],
//       pastPickupDate: map['pastPickupDate'],
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory FarmDataModel.fromJson(String source) =>
//       FarmDataModel.fromMap(json.decode(source));
//
//   @override
//   String toString() {
//     return 'FarmDataModel('
//         'farmname: $farmname, '
//         'loction: $location,'
//         'capacity: $capacity, '
//         'attenderLedger: $attenderLedger,'
//         'currentBatchId: $currentBatchId,'
//         'currentDate: $currentDate,'
//         'pastPickupDate: $pastPickupDate,'
//         ')';
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//
//     return other is FarmDataModel &&
//         other.farmname == farmname &&
//         other.location == location &&
//         other.capacity == capacity &&
//         other.attenderLedger == attenderLedger &&
//         other.currentBatchId == currentBatchId &&
//         other.currentDate == currentDate &&
//         other.pastPickupDate == pastPickupDate;
//   }
//
//   @override
//   int get hashCode {
//     return farmname.hashCode ^
//     location.hashCode ^
//     capacity.hashCode ^
//     attenderLedger.hashCode ^
//     currentBatchId.hashCode ^
//     currentDate.hashCode ^
//     pastPickupDate.hashCode;
//   }
// }
//
//
}