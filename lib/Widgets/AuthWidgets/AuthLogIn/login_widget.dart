import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc_Cubit/AuthCubit/auth_cubit.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: theme.appBarTheme.foregroundColor,fontSize: theme.textTheme.labelLarge?.fontSize),
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
              labelStyle: TextStyle(color: theme.appBarTheme.foregroundColor,fontSize: theme.textTheme.labelLarge?.fontSize),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().login(
                emailController.text,
                passwordController.text,
              );
            },
            style: theme.elevatedButtonTheme.style,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
