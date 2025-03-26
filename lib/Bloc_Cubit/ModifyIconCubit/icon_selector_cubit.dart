import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'icon_selector_state.dart';

class IconSelectorCubit extends Cubit<IconSelectorState> {
  final String documentId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _currentUser;

  IconSelectorCubit({
    required String initialIconName,
    required this.documentId,
    User? currentUser,
  }) :
        _currentUser = currentUser ?? FirebaseAuth.instance.currentUser,
        super(IconSelectorState(currentIconName: initialIconName));

  void updateIcon(String newIconName) async {
    try {
      if (_currentUser == null) {
        emit(state.copyWith(errorMessage: 'Utente non autenticato'));
        return;
      }

      await _firestore
          .collection('users')
          .doc(_currentUser.uid)
          .collection('items')
          .doc(documentId)
          .update({'iconItem': newIconName});

      emit(state.copyWith(currentIconName: newIconName));
    } catch (e) {
      print('Errore durante l\'aggiornamento dell\'icona: $e');
      emit(state.copyWith(errorMessage: 'Errore durante l\'aggiornamento dell\'icona.'));
    }
  }
}