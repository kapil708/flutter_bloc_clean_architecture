part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends AppEvent {
  const ChangeLanguage({required this.selectedLanguage});
  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];
}

class ChangeThemeMode extends AppEvent {
  const ChangeThemeMode({required this.selectedThemeMode});
  final AppThemeMode selectedThemeMode;

  @override
  List<Object> get props => [selectedThemeMode];
}

class OnAppInit extends AppEvent {}
