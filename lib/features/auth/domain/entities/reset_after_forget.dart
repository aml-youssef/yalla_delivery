class ResetAfterForget {
    ResetAfterForget({
        required this.success,
        required this.msgs,
    });

    bool success;
    Msgs msgs;


    Map<String, dynamic> toMap() => {
        "success": success,
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
