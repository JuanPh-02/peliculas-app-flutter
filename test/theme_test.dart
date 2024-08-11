import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:peliculas_prueba/blocs/cubit/theme_cubit_cubit.dart';

void main() {
  group('ThemeCubit', () {
    blocTest<ThemeCubit, ThemeState>(
      'emite [ThemeState(isDarkMode: true)] cuando toggleTheme es llamado',
      build: () => ThemeCubit(),
      act: (cubit) {
        cubit.toggleTheme();
      },
      expect: () => [
        const ThemeState(isDarkMode: false),
      ],
    );
    blocTest<ThemeCubit, ThemeState>(
      'emite [ThemeState(isDarkMode: false)] cuando darkMode del ThemeCubit se envia en false y toggleTheme es llamado',
      build: () => ThemeCubit(darkMode: false),
      act: (cubit) {
        cubit.toggleTheme();
      },
      expect: () => [
        const ThemeState(isDarkMode: true),
      ],
    );

  });
}
