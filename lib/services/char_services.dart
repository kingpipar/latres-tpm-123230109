import 'package:http/http.dart' as http;
import '../models/char.dart';

class CharServices {
  static const String _baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  static Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$_baseUrl/characters'));
    if (response.statusCode == 200) {
      return characterFromJson(response.body);
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
