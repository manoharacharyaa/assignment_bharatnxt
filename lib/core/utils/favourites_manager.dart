import 'package:shared_preferences/shared_preferences.dart';

class FavouritesManager {
  static const _key = 'likedArticle';

  static Future<Set<String>> getLikedIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key)?.toSet() ?? <String>{};
  }

  static Future<void> toggleLikes(String uniqueId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_key) ?? [];

    if (current.contains(uniqueId)) {
      current.remove(uniqueId);
    } else {
      current.add(uniqueId);
    }

    await prefs.setStringList(_key, current);
  }

  static Future<bool> isLiked(String uniqueId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_key) ?? [];
    return current.contains(uniqueId);
  }
}
