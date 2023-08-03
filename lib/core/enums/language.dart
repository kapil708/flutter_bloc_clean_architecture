import 'dart:ui';

import '../assets/image_assets.dart';

enum Language {
  english(Locale('en', 'US'), ImageAssets.english, 'English'),
  indonesia(Locale('id', 'ID'), ImageAssets.indonesia, 'Indonesia');

  const Language(this.value, this.image, this.text);

  final Locale value;
  final String image;
  final String text;
}
