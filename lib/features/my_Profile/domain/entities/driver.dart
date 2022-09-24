import 'package:equatable/equatable.dart';


class Driver extends Equatable {
  Driver({
    required this.location,
    required this.state,
    required this.isOnline,
    required this.hasOrder,
    required this.requiredMoney,
    required this.img,
    required this.id,
    required this.username,
    required this.phone,
    required this.email,
    required this.password,
    required this.idNum,
    required this.homeNum,
    required this.strNum,
    required this.locationNum,
    required this.address,
    required this.motoType,
    required this.nationalityFace,
    required this.nationalityBack,
    required this.locationFace,
    required this.locationBack,
    required this.refusedOrder,
    required this.orders,
    required this.v,
  });

  Location location;
  bool state;
  String isOnline;
  String hasOrder;
  int requiredMoney;
  dynamic img;
  String id;
  String username;
  String phone;
  String email;
  String password;
  String idNum;
  String homeNum;
  String strNum;
  String locationNum;
  String address;
  String motoType;
  String nationalityFace;
  String nationalityBack;
  String locationFace;
  String locationBack;
  List<dynamic> refusedOrder;
  List<dynamic> orders;
  int v;

  Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "state": state,
        "is_online": isOnline,
        "has_order": hasOrder,
        "required_money": requiredMoney,
        "img": img,
        "_id": id,
        "username": username,
        "phone": phone,
        "email": email,
        "password": password,
        "idNum": idNum,
        "homeNum": homeNum,
        "strNum": strNum,
        "locationNum": locationNum,
        "address": address,
        "motoType": motoType,
        "nationalityFace": nationalityFace,
        "nationalityBack": nationalityBack,
        "locationFace": locationFace,
        "locationBack": locationBack,
        "refusedOrder": List<dynamic>.from(refusedOrder.map((x) => x)),
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "__v": v,
      };


  @override
  List<Object?> get props => [
        location,
        state,
        isOnline,
        hasOrder,
        requiredMoney,
        img,
        id,
        username,
        phone,
        email,
        password,
        idNum,
        homeNum,
        strNum,
        location,
        address,
        motoType,
        nationalityFace,
        nationalityBack,
        locationFace,
        locationBack,
        refusedOrder,
        orders,
        v,
      ];
}

class Location extends Equatable {
  Location({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  Map<String, dynamic> toMap() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };


  @override
  List<Object?> get props => [
        type,
        coordinates,
      ];
}