import 'package:bloc/bloc.dart';

class SettingsLanguageCubit extends Cubit<bool> {
  SettingsLanguageCubit() : super(false);

  void toggleLanguageOptions() {
    emit(!state);
  }
}