import 'dart:convert';
import 'package:hive/hive.dart';

part 'spell.g.dart';

List<Spell> spellFromJson(String str) => List<Spell>.from(json.decode(str).map((x) => Spell.fromJson(x)));

String spellToJson(List<Spell> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class Spell extends HiveObject {
    @HiveField(0)
    String? spell;

    @HiveField(1)
    String? use;

    @HiveField(2)
    int? index;

    Spell({
        this.spell,
        this.use,
        this.index,
    });

    factory Spell.fromJson(Map<String, dynamic> json) => Spell(
        spell: json["spell"],
        use: json["use"],
        index: json["index"],
    );

    Map<String, dynamic> toJson() => {
        "spell": spell,
        "use": use,
        "index": index,
    };
}
