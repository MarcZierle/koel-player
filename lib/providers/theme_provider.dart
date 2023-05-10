import 'package:app/constants/colors.dart';
import 'package:flutter/foundation.dart';

class ThemeProvider with ChangeNotifier {
  AppColors _colors = colorThemes['default']!;

  AppColors get colors => _colors;

  set colors(AppColors colors) {
    _colors = colors;
    notifyListeners();
  }
}
