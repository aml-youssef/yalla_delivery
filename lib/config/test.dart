dynamic resturant_refuse_order = {
  "msg": "resturant has refused the order",
  "order": {
    "state": "refused",
    "products": [
      {"_id": "619bac487e924f36b4e4de85", "quantity": 1},
      {"_id": "619bac4d7e924f36b4e4de86", "quantity": 1}
    ],
    "type": "normal",
    "seen": 5,
    "date": "Tue Jul 12 2022 05:05:17 GMT+0200 (توقيت شرق أوروبا الرسمي)",
    "_id": "62cce4ed81c32b4e98e10e8e",
    "status": "new",
    "resturantId": "62ca906e4bab7f1b88c5680a",
    "total": 404,
    "totalQuantity": 2,
    "clientId": "622d0224bbc9c13738780dfe",
    "orderCount": 15,
    "delivery_coast": "100",
    "address": "ammar str",
    "phone": "+20106040",
    "location": {"lang": 22, "lat": 25},
    "refusedOrder": [
      {
        "_id": "62ccea1f4a36d4320c0ea85e",
        "resturantId": "62ca906e4bab7f1b88c5680a",
        "reason": "dont have items"
      },
      {
        "_id": "62ccee3d4582d73bfc3a2748",
        "resturantId": "62ca906e4bab7f1b88c5680a",
        "reason": "dont have items"
      },
      {
        "_id": "633123235431da002330e655",
        "resturantId": "62ca906e4bab7f1b88c5680a",
        "reason": "dont have items"
      }
    ],
    "__v": 0
  },
  "reason": "dont have items"
};






dynamic resturant_accept_order = {
  "msg": "resturant has accept the order",
  "order": {
    "lastErrorObject": {"n": 1, "updatedExisting": true},
    "value": {
      "state": "preparing",
      "products": [
        {"_id": "619bac487e924f36b4e4de85", "quantity": 1},
        {"_id": "619bac4d7e924f36b4e4de86", "quantity": 1}
      ],
      "type": "normal",
      "seen": 1,
      "date":
          "Sat Sep 10 2022 22:07:56 GMT+0200 (Eastern European Standard Time)",
      "_id": "631cee9c6ebe722b88cde97c",
      "resturantId": "6259e944e4323d192c477702",
      "total": 404,
      "totalQuantity": 2,
      "clientId": "622d0224bbc9c13738780dfe",
      "orderCount": 16,
      "delivery_coast": "100",
      "address": "ammar str",
      "phone": "+20106040",
      "location": {"lang": 22, "lat": 25},
      "refusedOrder": [],
      "__v": 0
    },
    "ok": 1,
    "clusterTime": {//$clusterTime
      "clusterTime": "7147532785563992066",
      "signature": {
        "hash": "sbhAHQH6uDb9+KWYW93Jnbn8GsA=",
        "keyId": "7108818199465951236"
      }
    },
    "operationTime": "7147532785563992066"
  }
};
