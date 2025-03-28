import 'package:cloud_firestore/cloud_firestore.dart';

class ThemePreferenceService {
  final CollectionReference _accountsCollection = FirebaseFirestore.instance.collection('Accounts');

  // Save the selected theme for the current user only if it's not default
  Future<void> saveThemePreference(String userId, String theme) async {
    if (theme != 'default') {
      try {
        await _accountsCollection.doc(userId).update({
          'theme': theme,
        });
      } catch (e) {
        print('Errore nel salvare il tema: $e');

        // If the document doesn't exist, create it with the theme
        try {
          await _accountsCollection.doc(userId).set({
            'itemIds': [],
            'theme': theme,
          });
        } catch (createError) {
          print('Errore nella creazione dell\'account con tema: $createError');
        }
      }
    }
  }

  // Retrieve the saved theme for the current user
  Future<String?> getThemePreference(String userId) async {
    try {
      DocumentSnapshot doc = await _accountsCollection.doc(userId).get();
      if (doc.exists && doc.data() != null) {
        return doc.get('theme');
      }
      return null;
    } catch (e) {
      print('Errore nel recuperare il tema: $e');
      return null;
    }
  }

  // Clear theme preference
  Future<void> clearThemePreference(String userId) async {
    try {
      await _accountsCollection.doc(userId).update({
        'theme': FieldValue.delete(),
      });
    } catch (e) {
      print('Errore nella cancellazione del tema: $e');
    }
  }
}