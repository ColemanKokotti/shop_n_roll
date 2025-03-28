import 'package:cloud_firestore/cloud_firestore.dart';

class LanguagePreferenceService {
  final CollectionReference _userPreferencesCollection =
  FirebaseFirestore.instance.collection('UserLanguagePreferences');

  // Save user's language preference only if it's not default (English)
  Future<void> saveLanguagePreference(String userId, String languageCode) async {
    if (languageCode != 'en') {
      try {
        await _userPreferencesCollection.doc(userId).set({
          'languageCode': languageCode,
        }, SetOptions(merge: true));
      } catch (e) {
        print('Error saving language preference: $e');
      }
    }
  }

  // Retrieve user's language preference
  Future<String?> getLanguagePreference(String userId) async {
    try {
      DocumentSnapshot doc = await _userPreferencesCollection.doc(userId).get();

      if (doc.exists && doc.data() != null) {
        return (doc.data() as Map<String, dynamic>)['languageCode'];
      }

      return null;
    } catch (e) {
      print('Error retrieving language preference: $e');
      return null;
    }
  }

  // Remove language preference on logout
  Future<void> clearLanguagePreference(String userId) async {
    try {
      await _userPreferencesCollection.doc(userId).delete();
    } catch (e) {
      print('Error clearing language preference: $e');
    }
  }
}