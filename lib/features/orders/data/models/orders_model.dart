import 'package:yalla_delivery/features/orders/domain/entities/orders.dart';

// class OrdersModel extends Orders {
//   OrdersModel({
//     required super.msg,
//     required super.order,
//     required super.reason,
//   });
//   factory OrdersModel.fromMap(Map<String, dynamic> json) => OrdersModel(
//         msg: json["msg"],
//         order: OrderModel.fromMap(json["order"]),
//         reason: json["reason"],
//       ); 
// }

class OrderModel extends Order {
  OrderModel({
    required super.state,
    required super.products,
    required super.type,
    required super.seen,
    required super.date,
    required super.id,
    required super.status,
    required super.resturantId,
    required super.total,
    required super.totalQuantity,
    required super.clientId,
    required super.orderCount,
    required super.deliveryCoast,
    required super.address,
    required super.phone,
    required super.location,
    required super.refusedOrder,
    required super.v,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        state: json["state"],
        products:
            List<Product>.from(json["products"].map((x) => ProductModel.fromMap(x))),
        type: json["type"],
        seen: json["seen"],
        date: json["date"],
        id: json["_id"],
        status: json["status"],
        resturantId: json["resturantId"],
        total: json["total"],
        totalQuantity: json["totalQuantity"],
        clientId: json["clientId"],
        orderCount: json["orderCount"],
        deliveryCoast: json["delivery_coast"],
        address: json["address"],
        phone: json["phone"],
        location: LocationModle.fromMap(json["location"]),
        refusedOrder: List<RefusedOrder>.from(
            json["refusedOrder"].map((x) => RefusedOrder.fromMap(x))),
        v: json["__v"],
      );
}

class LocationModle extends Location{
  LocationModle({required super.lang, required super.lat});
  factory LocationModle.fromMap(Map<String, dynamic> json) => LocationModle(
        lang: json["lang"],
        lat: json["lat"],
      );

}


class ProductModel extends Product{
  ProductModel({required super.id, required super.quantity});
    factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        quantity: json["quantity"],
      );

}

