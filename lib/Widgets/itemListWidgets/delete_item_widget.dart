import 'package:flutter/material.dart';
import '../../Bloc_Cubit/ItemListCubit/item_list_cubit.dart';
import '../../FireBase/account_service.dart';
import '../../FireBase/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<bool> showDeleteConfirmationDialog(BuildContext context, String itemId,ItemListCubit itemListCubit) async {
  final theme = Theme.of(context);
  final AuthService authService = AuthService(FirebaseAuth.instance);
  final AccountService accountService = AccountService();

  bool confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.appBarTheme.backgroundColor,
          title: Text('Conferma eliminazione', textAlign: TextAlign.center),
          titleTextStyle: TextStyle(color: theme.textTheme.labelLarge?.color, fontSize: 30),
          content: Text('Sei sicuro di voler eliminare questo elemento?', style: TextStyle(color: theme.textTheme.labelLarge?.color)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  style: TextButton.styleFrom(backgroundColor: theme.secondaryHeaderColor),
                  child: Text('Annulla', style: TextStyle(color: theme.textTheme.labelLarge?.color, fontSize: 15)),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () async {
                    await itemListCubit.deleteItem(itemId);
                    Navigator.of(context).pop(true);
                  },
                  style: TextButton.styleFrom(backgroundColor: theme.secondaryHeaderColor),
                  child: Text('Elimina', style: TextStyle(color: theme.textTheme.labelLarge?.color, fontSize: 15)),
                ),
              ],
            ),
          ],
        );
      }
  ) ?? false;

  return confirmed;
}