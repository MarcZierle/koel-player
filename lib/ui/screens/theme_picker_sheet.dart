import 'dart:io';

import 'package:app/constants/constants.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:app/utils/preferences.dart' as preferences;
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';


class ThemePickerSheet extends StatelessWidget {
  const ThemePickerSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: .5,
            snap: true,
            snapAnimationDuration: const Duration(milliseconds: 100),
            builder: (BuildContext context, ScrollController scrollController) {
              return ClipSmoothRect(
                radius: Platform.isIOS
                    ? SmoothBorderRadius(
                        cornerRadius: 32,
                        cornerSmoothing: .5,
                      )
                    : SmoothBorderRadius.zero,
                child: FrostedGlassBackground(
                    sigma: 40.0,
                    child: SafeArea(
                      child: ListView(
                        controller: scrollController,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              AppDimensions.hPadding,
                              24,
                              AppDimensions.hPadding,
                              0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Select a theme',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CupertinoButton(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: preferences.themeColors.highlight,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          ...colorThemes.keys
                              .toList()
                              .asMap()
                              .entries
                              .map((MapEntry<int, String> entry) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: ThemeItem(
                                      themeKey: entry.value, index: entry.key)))
                              .toList(),
                        ],
                      ),
                    )),
              );
            },
          );
  }
}