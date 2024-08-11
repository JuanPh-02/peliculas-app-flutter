part of 'theme_cubit_cubit.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}
