import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool darkMode = false,
  }) : super(const ThemeState(isDarkMode: true));

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }
}
