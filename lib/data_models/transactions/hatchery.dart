import 'dart:convert';

class TransactionHatecheryDataModel {
  String? createBatch;
  DateTime? date;
  String? chooseHatchery;
  num? numberOfeggs;
  String? chickProduced;
  DateTime? pickUpdate;
  String? FarmId;

  TransactionHatecheryDataModel({
    required this.createBatch,
    required this.date,
    required this.chooseHatchery,
    required this.numberOfeggs,
    required this.chickProduced,
     required this.pickUpdate,
    required this.FarmId
  });
  TransactionHatecheryDataModel.empty();

  TransactionHatecheryDataModel copyWith({
    String? createBatch,
    DateTime? date,
    String? chooseHatchery,
    num? numberOfeggs,
    String? chickProduced,
    DateTime? pickUpdate,
    String? FarmId
  }) {
    return TransactionHatecheryDataModel(
      createBatch: createBatch ?? this.createBatch,
       date: date ?? this.date,
      chooseHatchery: chooseHatchery ?? this.chooseHatchery,
      numberOfeggs: numberOfeggs ?? this.numberOfeggs,
      chickProduced: chickProduced ?? this.chickProduced,
       pickUpdate: pickUpdate ?? this.pickUpdate,
      FarmId: FarmId ?? this.FarmId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createBatch': createBatch,
      'date': date?.millisecondsSinceEpoch.toString(),
      'chooseHatchery': chooseHatchery,
      'numberOfeggs': numberOfeggs,
      'chickProduced': chickProduced,
       'pickUpdate': pickUpdate.toString(),
      'FarmId': FarmId,

    };
  }

  factory TransactionHatecheryDataModel.fromMap(Map<String, dynamic> map) {
    return TransactionHatecheryDataModel(
      createBatch: map['createBatch'],
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['date'] ?? '0') * 1000),
      chooseHatchery: map['chooseHatchery'],
      numberOfeggs: map['numberOfeggs'],
      chickProduced: map['chickProduced'],
      pickUpdate: DateTime.fromMillisecondsSinceEpoch(map['pickUpdate']),
      FarmId: map['FarmId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionHatecheryDataModel.fromJson(String source) =>
      TransactionHatecheryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionHatecheryDataModel('
        'createBatch:$createBatch'
        'date: $date, '
        'chooseHatchery: $chooseHatchery, '
        'numberOfeggs: $numberOfeggs,'
        'chickProduced:$chickProduced,'
        'pickUpdate: $pickUpdate,'
        'FarmId: $FarmId,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionHatecheryDataModel &&
        other.createBatch == createBatch &&
        //other.date == date &&
        other.chooseHatchery == chooseHatchery &&
        other.numberOfeggs == numberOfeggs &&
        other.chickProduced == chickProduced&&
        other.FarmId == FarmId;
    //&&
    // other.pickUpdate == pickUpdate;
  }

  @override
  int get hashCode {
    return createBatch.hashCode ^
        // date.hashCode ^
        chooseHatchery.hashCode ^
        numberOfeggs.hashCode ^
        chickProduced.hashCode^
    FarmId.hashCode;
    // pickUpdate.hashCode;
  }
}
