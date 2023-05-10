import 'package:flutter/material.dart';

const colorThemes = {
  'default': AppColors(),
  'dark': DarkColors(),
  'violet': VioletColors(),
  'oak': OakColors(),
  'slate': SlateColors(),
  'madison': MadisonColors(),
  'astronaut': AstronautColors(),
  'chocolate': ChocolateColors(),
  'laura': LauraColors(),
  'dawn': DawnColors(),
  'rose-petals': RosePetalsColors(),
  'purple-waves': PurpleWavesColors(),
  'pop-culture': PopCultureColors(),
  'jungle': JungleColors(),
  'mountains': MountainsColors(),
  'pines': PinesColors(),
  'nemo': NemoColors(),
  'cat': CatColors(),
};

class AppColors {
  const AppColors();

  final String displayName = 'Default';
  final String description = 'The Koel we all know and love.';

  final Color black = const Color(0xFF181818);
  final Color white = const Color(0xFFFFFFFF);
  final Color red = const Color(0xFFBB0054);

  final Color background = const Color(0xFF181818);
  final Color text = const Color.fromRGBO(255, 255, 255, .9);
  final Color highlight = const Color(0xFFF80A95);
  final Color highlightAccent = const Color(0xFFC20C75);

  final Color screenHeaderBackground = const Color.fromRGBO(25, 0, 64, .5);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background.webp');
  final Color? backgroundColor = null;
}

class DarkColors extends AppColors {
  const DarkColors();

  final String displayName = 'Dark';
  final String description = 'A dark theme for Koel.';

  final Color highlight = const Color.fromRGBO(100, 100, 100, 1);
  final Color highlightAccent = const Color.fromRGBO(60, 60, 60, 1);

  final Color screenHeaderBackground = const Color.fromRGBO(25, 25, 25, .5);

  ImageProvider get backgroundImage =>
      AssetImage('assets/images/background-dark.webp');
}

class CatColors extends AppColors {
  const CatColors();

  final String displayName = 'Cat';
  final String description = 'What\'s New Pussycat?';

  final Color highlight = const Color(0xFFd26c37);
  final Color highlightAccent = const Color(0xFFad5527);

  final Color screenHeaderBackground = const Color(0xFF000000);

  ImageProvider get backgroundImage =>
      AssetImage('assets/images/background-cat.webp');
}

class VioletColors extends AppColors {
  const VioletColors();

  final String displayName = 'Violet';
  final String description = '';

  final Color highlight = const Color(0xFFc23de5);
  final Color highlightAccent = const Color(0xFFa81bcd);

  final Color screenHeaderBackground = const Color(0xFF31094e);

  ImageProvider? get backgroundImage => null;
  final Color backgroundColor = const Color(0xFF31094e);
}

class OakColors extends AppColors {
  const OakColors();

  final String displayName = 'Oak';
  final String description = '';

  final Color highlight = const Color(0xFFfd4b67);
  final Color highlightAccent = const Color(0xFFfc0a30);

  final Color screenHeaderBackground = const Color(0xFF560d25);

  ImageProvider? get backgroundImage => null;
  final Color backgroundColor = const Color(0xFF560d25);
}

class SlateColors extends AppColors {
  const SlateColors();

  final String displayName = 'Slate';
  final String description = '';

  final Color highlight = const Color(0xFF6c8b99);
  final Color highlightAccent = const Color(0xFF56707b);

  final Color screenHeaderBackground = const Color(0xFF29434e);

  ImageProvider? get backgroundImage => null;
  final Color backgroundColor = const Color(0xFF29434e);
}

class MadisonColors extends AppColors {
  const MadisonColors();

  final String displayName = 'Madison';
  final String description = '';

  final Color highlight = const Color(0xFFfbab18);
  final Color highlightAccent = const Color(0xFFd88d04);

  final Color screenHeaderBackground = const Color(0xFF0e3463);

  ImageProvider? get backgroundImage => null;
  final Color backgroundColor = const Color(0xFF0e3463);
}

class AstronautColors extends AppColors {
  const AstronautColors();

  final String displayName = 'Astronaut';
  final String description = '';

  final Color highlight = const Color(0xFF7a78dd);
  final Color highlightAccent = const Color(0xFF4442cf);

  final Color screenHeaderBackground = const Color(0xFF2a3074);

  ImageProvider? get backgroundImage => null;
  final Color backgroundColor = const Color(0xFF2a3074);
}

class ChocolateColors extends AppColors {
  const ChocolateColors();

  final String displayName = 'Chocolate';
  final String description = '';

  final Color highlight = const Color(0xFFd96759);
  final Color highlightAccent = const Color(0xFFc73e2e);

  final Color screenHeaderBackground = const Color(0xFF3f2724);

  ImageProvider? get backgroundImage => null;
  final Color backgroundColor = const Color(0xFF3f2724);
}

class LauraColors extends AppColors {
  const LauraColors();

  final String displayName = 'Laura';
  final String description = '';

  final Color highlight = const Color.fromARGB(163, 10, 244, 255);
  final Color highlightAccent = const Color.fromARGB(163, 0, 210, 220);

  final Color screenHeaderBackground = const Color(0xFF126673);

  ImageProvider? get backgroundImage => null;
  final Color backgroundColor = const Color(0xFF126673);
}

class DawnColors extends AppColors {
  const DawnColors();

  final String displayName = 'Dawn';
  final String description = 'Before the Dawn';

  final Color highlight = const Color(0xFFed5135);
  final Color highlightAccent = const Color(0xFFd53113);

  final Color screenHeaderBackground = const Color(0xFF1e2747);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-dawn.webp');
}

class RosePetalsColors extends AppColors {
  const RosePetalsColors();

  final String displayName = 'Rose Petals';
  final String description = '...Has Its Thorns';

  final Color highlight = const Color(0xFFff7d2e);
  final Color highlightAccent = const Color(0xFFf15b00);

  final Color screenHeaderBackground = const Color(0xFF7d083b);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-rose-petals.webp');
}

class PurpleWavesColors extends AppColors {
  const PurpleWavesColors();

  final String displayName = 'Purple Waves';
  final String description = 'Waves of Fortune';

  final Color highlight = const Color(0xFFff7d2e);
  final Color highlightAccent = const Color(0xFFf15b00);

  final Color screenHeaderBackground = const Color(0xFF44115c);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-purple-waves.webp');
}

class PopCultureColors extends AppColors {
  const PopCultureColors();

  final String displayName = 'Pop Culture';
  final String description = '';

  final Color highlight = const Color.fromARGB(230, 234, 208, 110);
  final Color highlightAccent = const Color.fromARGB(230, 225, 189, 50);

  final Color screenHeaderBackground = const Color(0xFFad0937);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-pop-culture.webp');
}

class JungleColors extends AppColors {
  const JungleColors();

  final String displayName = 'Jungle';
  final String description = 'Welcome to the Jungle';

  final Color highlight = const Color(0xFF4f9345);
  final Color highlightAccent = const Color(0xFF3f7637);

  final Color screenHeaderBackground = const Color(0xFF0f0f03);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-jungle.webp');
}

class MountainsColors extends AppColors {
  const MountainsColors();

  final String displayName = 'Mountains';
  final String description = 'Rocky Mountain High';

  final Color highlight = const Color(0xFF6488c3);
  final Color highlightAccent = const Color(0xFF4269a);

  final Color screenHeaderBackground = const Color(0xFF0e2656);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-mountains.webp');
}

class PinesColors extends AppColors {
  const PinesColors();

  final String displayName = 'Pines';
  final String description = 'In the Pines';

  final Color highlight = const Color(0xFF5984b9);
  final Color highlightAccent = const Color(0xFF41699a);

  final Color screenHeaderBackground = const Color(0xFF06090c);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-pines.webp');
}

class NemoColors extends AppColors {
  const NemoColors();

  final String displayName = 'Nemo';
  final String description = '';

  final Color highlight = const Color(0xFF2896b8);
  final Color highlightAccent = const Color(0xFF207893);

  final Color screenHeaderBackground = const Color(0xFF031724);

  ImageProvider? get backgroundImage =>
      AssetImage('assets/images/background-nemo.webp');
}
