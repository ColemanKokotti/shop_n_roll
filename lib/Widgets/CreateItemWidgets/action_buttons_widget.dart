import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Bloc_Cubit/CreateItemCubit/create_item_cubit.dart';
import '../../Bloc_Cubit/CreateItemCubit/create_item_state.dart';
import '../../FireBase/create_item_firebase_storage.dart';
import '../../FireBase/auth_service.dart';

class ActionButtonsWidget extends StatelessWidget {
  final CreateItemCubit cubit;
  final CreateItemState state;

  const ActionButtonsWidget({
    super.key,
    required this.cubit,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            final CreateItemService itemService = CreateItemService(
              AuthService(FirebaseAuth.instance)
            );
            bool success = await itemService.addItemToUser(state);
            if (success) {
              cubit.reset();
              Navigator.of(context).pop();
            } else {
              showErrorDialog(context);
            }
          },
          child: Text(
            'Aggiungi',
            style: TextStyle(color: theme.textTheme.labelLarge?.color, fontSize: 15),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Annulla',
            style: TextStyle(color: theme.textTheme.labelLarge?.color, fontSize: 15),
          ),
        ),
      ],
    );
  }

  void showErrorDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: theme.appBarTheme.backgroundColor,
          title: Center(
            child: Text(
              'Attenzione',
              style: TextStyle(
                color: theme.textTheme.labelLarge?.color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tutti i campi devono essere compilati per la creazione dell\'item.',
              style: TextStyle(
                color: theme.textTheme.labelLarge?.color,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }
}
