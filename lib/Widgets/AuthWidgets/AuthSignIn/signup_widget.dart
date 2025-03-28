import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc_Cubit/AuthCubit/auth_cubit.dart';
import '../../../Bloc_Cubit/AuthCubit/auth_state.dart';
import '../animated_text_widget.dart';

class SingUpWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SingUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return SingleChildScrollView( // Aggiunto SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Center(child: const AnimatedTextWidget()),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                        fontSize: theme.textTheme.labelLarge?.fontSize),
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  obscureText: cubit.obscureText,
                  onChanged: (value) => cubit.updatePasswordRequirements(value),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                        fontSize: theme.textTheme.labelLarge?.fontSize),
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    suffixIcon: IconButton(
                      icon: Icon(cubit.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => cubit.toggleObscureText(),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password must contain:'.tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '- At least 1 uppercase letter'.tr(),
                      style: TextStyle(
                          color: cubit.hasUppercase ? Colors.green : Colors.black),
                    ),
                    Text(
                      '- At least 1 number'.tr(),
                      style: TextStyle(
                          color: cubit.hasNumber ? Colors.green : Colors.black),
                    ),
                    Text(
                      '- At least 1 special character'.tr(),
                      style: TextStyle(
                          color: cubit.hasSpecialChar ? Colors.green : Colors.black),
                    ),
                    Text(
                      '- Minimum 10 characters'.tr(),
                      style: TextStyle(
                          color: cubit.hasMinLength ? Colors.green : Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (cubit.hasUppercase &&
                        cubit.hasNumber &&
                        cubit.hasSpecialChar &&
                        cubit.hasMinLength) {
                      context.read<AuthCubit>().register(
                        emailController.text,
                        passwordController.text,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text('Password does not meet requirements.')),
                      );
                    }
                  },
                  style: theme.elevatedButtonTheme.style,
                  child: Text('Sign up').tr(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}