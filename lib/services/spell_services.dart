import 'package:http/http.dart' as http;
import '../models/spell.dart';

class SpellServices {
  static const String _baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  static Future<List<Spell>> fetchSpells() async {
    final response = await http.get(Uri.parse('$_baseUrl/spells'));
    if (response.statusCode == 200) {
      return spellFromJson(response.body);
    } else {
      throw Exception('Failed to load spells');
    }
  }
}
