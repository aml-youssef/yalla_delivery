import '../../domain/entities/driver.dart';

class DriverModel extends Driver {
  DriverModel({
    required super.location,
    required super.state,
    required super.isOnline,
    required super.hasOrder,
    required super.requiredMoney,
    required super.img,
    required super.id,
    required super.username,
    required super.phone,
    required super.email,
    required super.password,
    required super.idNum,
    required super.homeNum,
    required super.strNum,
    required super.locationNum,
    required super.address,
    required super.motoType,
    required super.nationalityFace,
    required super.nationalityBack,
    required super.locationFace,
    required super.locationBack,
    required super.refusedOrder,
    required super.orders,
    required super.v,
    required super.resetToken,
  });

  DriverModel copyWith({
    Location? location,
    bool? state,
    String? isOnline,
    String? hasOrder,
    int? requiredMoney,
    dynamic img,
    String? id,
    String? username,
    String? phone,
    String? email,
    String? password,
    String? idNum,
    String? homeNum,
    String? strNum,
    String? locationNum,
    String? address,
    String? motoType,
    String? nationalityFace,
    String? nationalityBack,
    String? locationFace,
    String? locationBack,
    List<dynamic>? refusedOrder,
    List<dynamic>? orders,
    int? v,
    dynamic resetToken,
  }) {
    return DriverModel(
      location: location ?? this.location,
      state: state ?? this.state,
      isOnline: isOnline ?? this.isOnline,
      hasOrder: hasOrder ?? this.hasOrder,
      requiredMoney: requiredMoney ?? this.requiredMoney,
      img: img ?? this.img,
      id: id ?? this.id,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      idNum: idNum ?? this.idNum,
      homeNum: homeNum ?? this.homeNum,
      strNum: strNum ?? this.strNum,
      locationNum: locationNum ?? this.locationNum,
      address: address ?? this.address,
      motoType: motoType ?? this.motoType,
      nationalityFace: nationalityFace ?? this.nationalityFace,
      nationalityBack: nationalityBack ?? this.nationalityBack,
      locationFace: locationFace ?? this.locationFace,
      locationBack: locationBack ?? this.locationBack,
      refusedOrder: refusedOrder ?? this.refusedOrder,
      orders: orders ?? this.orders,
      v: v ?? this.v,
      resetToken: resetToken??this.resetToken,
    );
  }

  factory DriverModel.fromMap(Map<String, dynamic> json) => DriverModel(
        location: LocationModel.fromMap(json["location"]),
        state: json["state"],
        isOnline: json["is_online"],
        hasOrder: json["has_order"],
        requiredMoney: json["required_money"],
        img: json["img"],
        id: json["_id"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        idNum: json["idNum"],
        homeNum: json["homeNum"],
        strNum: json["strNum"],
        locationNum: json["locationNum"],
        address: json["address"],
        motoType: json["motoType"],
        nationalityFace: json["nationalityFace"],
        nationalityBack: json["nationalityBack"],
        locationFace: json["locationFace"],
        locationBack: json["locationBack"],
        refusedOrder: List<dynamic>.from(json["refusedOrder"].map((x) => x)),
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        v: json["__v"],
        resetToken: json['resetToken']
      );
}

class LocationModel extends Location {
  LocationModel({required super.type, required super.coordinates});

  LocationModel copyWith({
    String? type,
    List<double>? coordinates,
  }) {
    return LocationModel(
        type: type ?? this.type, coordinates: coordinates ?? this.coordinates);
  }

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );
}
