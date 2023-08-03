part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    Language? selectedLanguage,
    AppThemeMode? selectedThemeMode,
  })  : selectedLanguage = selectedLanguage ?? Language.english,
        selectedThemeMode = selectedThemeMode ?? AppThemeMode.system;

  final Language selectedLanguage;
  final AppThemeMode selectedThemeMode;

  @override
  List<Object> get props => [selectedLanguage, selectedThemeMode];

  AppState copyWith({Language? selectedLanguage, AppThemeMode? selectedThemeMode}) {
    return AppState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedThemeMode: selectedThemeMode ?? this.selectedThemeMode,
    );
  }
}
