import 'package:flutter/material.dart';
import 'package:app/utils/preferences.dart' as preferences;

class GradientDecoratedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const GradientDecoratedContainer(
      {Key? key, this.child = const SizedBox.expand(), this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundImage = preferences.themeColors.backgroundImage;
    final backgroundColor = preferences.themeColors.backgroundColor;

    return Container(
      child: child,
      padding: padding,
      decoration: BoxDecoration(
        image: backgroundImage != null
            ? DecorationImage(
                image: preferences.themeColors.backgroundImage!,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              )
            : null,
        gradient: backgroundImage == null && backgroundColor != null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [backgroundColor, backgroundColor],
              )
            : null,
      ),
    );
  }
}
