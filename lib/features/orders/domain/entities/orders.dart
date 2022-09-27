// class Orders {
//   Orders({
//     required this.msg,
//     required this.order,
//     required this.reason,
//   });

//   String msg;
//   Order order;
//   String reason;

//     Map<String, dynamic> toMap() => {
//         "msg": msg,
//         "order": order.toMap(),
//         "reason": reason,
//       };
// }

class Order {
  Order({
    required this.state,
    required this.products,
    required this.type,
    required this.seen,
    required this.date,
    required this.id,
    required this.status,
    required this.resturantId,
    required this.total,
    required this.totalQuantity,
    required this.clientId,
    required this.orderCount,
    required this.deliveryCoast,
    required this.address,
    required this.phone,
    required this.location,
    required this.refusedOrder,
    required this.v,
  });

  String state;
  List<Product> products;
  String type;
  int seen;
  String date;
  String id;
  String status;
  String resturantId;
  int total;
  int totalQuantity;
  String clientId;
  int orderCount;
  String deliveryCoast;
  String address;
  String phone;
  Location location;
  List<RefusedOrder> refusedOrder;
  int v;

  Map<String, dynamic> toMap() => {
        "state": state,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "type": type,
        "seen": seen,
        "date": date,
        "_id": id,
        "status": status,
        "resturantId": resturantId,
        "total": total,
        "totalQuantity": totalQuantity,
        "clientId": clientId,
        "orderCount": orderCount,
        "delivery_coast": deliveryCoast,
        "address": address,
        "phone": phone,
        "location": location.toMap(),
        "refusedOrder": List<dynamic>.from(refusedOrder.map((x) => x.toMap())),
        "__v": v,
      };
}

class Location {
  Location({
    required this.lang,
    required this.lat,
  });

  int lang;
  int lat;


  Map<String, dynamic> toMap() => {
        "lang": lang,
        "lat": lat,
      };
}

class Product {
  Product({
    required this.id,
    required this.quantity,
  });

  String id;
  int quantity;


  Map<String, dynamic> toMap() => {
        "_id": id,
        "quantity": quantity,
      };
}

class RefusedOrder {
  RefusedOrder({
    required this.id,
    required this.resturantId,
    required this.reason,
  });

  String id;
  String resturantId;
  String reason;

  factory RefusedOrder.fromMap(Map<String, dynamic> json) => RefusedOrder(
        id: json["_id"],
        resturantId: json["resturantId"],
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "resturantId": resturantId,
        "reason": reason,
      };
}
