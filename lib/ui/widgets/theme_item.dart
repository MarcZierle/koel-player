import 'package:app/constants/constants.dart';
import 'package:app/utils/preferences.dart' as preferences;
import 'package:app/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ThemeItem extends StatelessWidget {
  final String themeKey;
  final int index;

  final double radius = 8;

  const ThemeItem({Key? key, required this.themeKey, this.index = 0})
      : super(key: key);

  DecorationImage? _getBackgroundImage(AppColors theme) {
    if (theme.backgroundImage == null) {
      return null;
    }
    return DecorationImage(
      image: theme.backgroundImage!,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Gradient? _getGradient(AppColors theme) {
    if (theme.backgroundImage != null || theme.backgroundColor == null) {
      return null;
    }
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [theme.backgroundColor!, theme.backgroundColor!],
    );
  }

  BoxBorder? _getBorder(AppColors theme) {
    bool isSelected = preferences.theme == themeKey;

    if (isSelected) {
      return Border.all(
        color: theme.text.withOpacity(0.5),
        width: 2,
      );
    }

    return Border.all(
      color: theme.text.withOpacity(0.25),
      width: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppColors theme = colorThemes[themeKey] ?? colorThemes['default']!;

    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: InkWell(
        splashColor: preferences.themeColors.highlight.withOpacity(0.7),
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
            decoration: BoxDecoration(
              image: _getBackgroundImage(theme),
              gradient: _getGradient(theme),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              border: _getBorder(theme),
            ),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: index % 2 == 0
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: <Text>[
                  Text(
                    theme.displayName,
                    style: TextStyle(
                        color: theme.text,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    theme.description,
                    style: TextStyle(color: theme.text, fontSize: 14),
                  )
                ])),
        onTap: () {
          preferences.theme = themeKey;
          context.read<ThemeProvider>().colors = theme;
          Navigator.pop(context);
        },
      ),
    );
  }
}
