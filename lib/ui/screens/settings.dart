import 'package:app/main.dart';
import 'package:app/constants/constants.dart';
import 'package:app/router.dart';
import 'package:app/utils/preferences.dart' as preferences;
import 'package:app/providers/providers.dart';
import 'package:app/ui/screens/screens.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  final AppRouter router;

  const SettingsScreen({Key? key})
      : router = const AppRouter(),
        super(key: key);

  void _showDialog(
      {required BuildContext context,
      required String title,
      required String textCancel,
      required String textConfirm,
      VoidCallback? onConfirm}) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(textCancel),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: Text(textConfirm),
              isDestructiveAction: true,
              onPressed: onConfirm,
            ),
          ],
        );
      },
    );
  }

  void logout(BuildContext context) {
    _showDialog(
      context: context,
      title: 'Log out?',
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      onConfirm: () async {
        await context.read<AuthProvider>().logout();
        await audioHandler.cleanUpUponLogout();
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamedAndRemoveUntil(LoginScreen.routeName, (_) => false);
      },
    );
  }

  void clearDownloads(BuildContext context) {
    final downloads = context.read<DownloadProvider>();
    _showDialog(
        context: context,
        title: 'Clear downloads?',
        textCancel: 'Cancel',
        textConfirm: 'Confirm',
        onConfirm: () {
          downloads.clear();
          Navigator.pop(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = ListTile.divideTiles(
      context: context,
      tiles: <Widget>[
        SettingsMenuItem(
          icon: CupertinoIcons.delete,
          label: 'Clear downloads',
          onTap: () => clearDownloads(context),
        ),
        SettingsMenuItem(
          icon: CupertinoIcons.xmark,
          label: 'Log out',
          onTap: () => logout(context),
        ),
      ],
    ).toList();

    return Scaffold(
      body: CupertinoTheme(
        data: CupertinoThemeData(primaryColor: Colors.white),
        child: GradientDecoratedContainer(
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                backgroundColor: preferences.themeColors.screenHeaderBackground,
                largeTitle: const LargeTitle(text: 'Settings'),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(menuItems),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.hPadding,
                  24,
                  AppDimensions.hPadding,
                  0,
                ),
                sliver: SliverToBoxAdapter(
                  child: const Heading5(text: 'Theme'),
                ),
              ),
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.hPadding,
                    0,
                    AppDimensions.hPadding,
                    12,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'It is advisable to restart Koel to ensure the full application of the theme change.',
                      style: TextStyle(color: preferences.themeColors.text),
                    ),
                  )),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    ListTile.divideTiles(
                      context: context,
                      tiles: <Widget>[
                        SettingsMenuItem(
                          icon: CupertinoIcons.paintbrush,
                          label: 'Select a theme',
                          onTap: () => router.showThemePickerSheet(context),
                        ),
                      ],
                    ).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsMenuItem extends StatelessWidget {
  final dynamic icon;
  final String label;
  final void Function() onTap;

  const SettingsMenuItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  })  : assert(
          icon is IconData || icon is Widget,
          'icon must be of either IconData or Widget type.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.hPadding,
          ),
          horizontalTitleGap: 0,
          leading: icon is IconData ? Icon(icon, color: Colors.white54) : icon,
          title: Text(label, style: const TextStyle(fontSize: 20)),
        ),
        onTap: onTap,
      ),
    );
  }
}
