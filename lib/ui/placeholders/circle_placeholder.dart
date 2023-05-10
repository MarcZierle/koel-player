import 'package:app/utils/preferences.dart' as preferences;
import 'package:flutter/cupertino.dart';

class CirclePlaceholder extends StatelessWidget {
  final double size;

  const CirclePlaceholder({
    Key? key,
    this.size = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: preferences.themeColors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
