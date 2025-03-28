import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Bloc_Cubit/AuthCubit/auth_cubit.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> rememberMeNotifier = ValueNotifier<bool>(false);

  LoginWidget({super.key});

  Future<void> _loadCredentials(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailController.text = prefs.getString('email') ?? '';
    passwordController.text = prefs.getString('password') ?? '';
    rememberMeNotifier.value = prefs.getBool('rememberMe') ?? false;
    context.read<AuthCubit>().setRememberMe(rememberMeNotifier.value);
  }

  Future<void> _saveCredentials(bool rememberMe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      prefs.setString('email', emailController.text);
      prefs.setString('password', passwordController.text);
      prefs.setBool('rememberMe', true);
    } else {
      prefs.remove('email');
      prefs.remove('password');
      prefs.remove('rememberMe');
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadCredentials(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: theme.appBarTheme.foregroundColor, fontSize: theme.textTheme.labelLarge?.fontSize),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: theme.appBarTheme.foregroundColor, fontSize: theme.textTheme.labelLarge?.fontSize),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          Row(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: rememberMeNotifier,
                builder: (context, rememberMe, child) {
                  return Checkbox(
                    value: rememberMe,
                    onChanged: (bool? value) {
                      if (value != null) {
                        rememberMeNotifier.value = value;
                        context.read<AuthCubit>().setRememberMe(value);
                      }
                    },
                  );
                },
              ),
              Text('Remember Me').tr(),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _saveCredentials(rememberMeNotifier.value);
              context.read<AuthCubit>().login(
                emailController.text,
                passwordController.text,
                context,
              );
            },
            style: theme.elevatedButtonTheme.style,
            child: Text('Login').tr(),
          ),
        ],
      ),
    );
  }
}
