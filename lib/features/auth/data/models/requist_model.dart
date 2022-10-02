import '../../domain/entities/requist.dart';

class RequistModel extends Requist {
  RequistModel({required super.newrequest});
  factory RequistModel.fromMap(Map<String, dynamic> json) => RequistModel(
        newrequest: NewRequistModel.fromMap(json["newrequest"]),
      );
}

class NewRequistModel extends Newrequest {
  NewRequistModel({
    required super.status,
    required super.id,
    required super.username,
    required super.age,
    required super.address,
    required super.phone,
    required super.motoType,
    required super.v,
  });

  factory NewRequistModel.fromMap(Map<String, dynamic> json) => NewRequistModel(
        status: json["status"],
        id: json["_id"],
        username: json["username"],
        age: json["age"],
        address: json["address"],
        phone: json["phone"],
        motoType: json["motoType"],
        v: json["__v"],
      );

}
