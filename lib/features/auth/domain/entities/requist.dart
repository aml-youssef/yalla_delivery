class Requist {
    Requist({
        required this.newrequest,
    });

    Newrequest newrequest;


    Map<String, dynamic> toMap() => {
        "newrequest": newrequest.toMap(),
    };
}

class Newrequest {
    Newrequest({
        required this.status,
        required this.id,
        required this.username,
        required this.age,
        required this.address,
        required this.phone,
        required this.motoType,
        required this.v,
    });

    String status;
    String id;
    String username;
    String age;
    String address;
    String phone;
    String motoType;
    int v;


    Map<String, dynamic> toMap() => {
        "status": status,
        "_id": id,
        "username": username,
        "age": age,
        "address": address,
        "phone": phone,
        "motoType": motoType,
        "__v": v,
    };
}
