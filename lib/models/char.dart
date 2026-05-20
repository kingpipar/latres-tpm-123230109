import 'dart:convert';

List<Character> characterFromJson(String str) => List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String characterToJson(List<Character> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
    String? fullName;
    String? nickname;
    String? hogwartsHouse;
    String? interpretedBy;
    List<String>? children;
    String? image;
    String? birthdate;
    int? index;

    Character({
        this.fullName,
        this.nickname,
        this.hogwartsHouse,
        this.interpretedBy,
        this.children,
        this.image,
        this.birthdate,
        this.index,
    });

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        fullName: json["fullName"],
        nickname: json["nickname"],
        hogwartsHouse: json["hogwartsHouse"],
        interpretedBy: json["interpretedBy"],
        children: json["children"] == null ? [] : List<String>.from(json["children"]!.map((x) => x)),
        image: json["image"],
        birthdate: json["birthdate"],
        index: json["index"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "nickname": nickname,
        "hogwartsHouse": hogwartsHouse,
        "interpretedBy": interpretedBy,
        "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
        "image": image,
        "birthdate": birthdate,
        "index": index,
    };
}
