class Forgetpw {
    Forgetpw({
        required this.success,
        required this.token,
        required this.msgs,
    });

    bool success;
    String token;
    Msgs msgs;

    Map<String, dynamic> toMap() => {
        "success": success,
        "token": token,
        "msgs": msgs.toMap(),
    };
}

class Msgs {
    Msgs({
        required this.ar,
        required this.eng,
        required this.kur,
    });

    String ar;
    String eng;
    String kur;

    Map<String, dynamic> toMap() => {
        "ar": ar,
        "eng": eng,
        "kur": kur,
    };
}
