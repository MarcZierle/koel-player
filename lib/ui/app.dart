import 'package:app/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/providers.dart';
import 'package:app/router.dart';
import 'package:app/ui/screens/screens.dart';
import 'package:app/ui/theme_data.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Material(
        color: Colors.transparent,
        child: Consumer<ThemeProvider>( // rebuild when theme changes
          builder: (context, theme, _) => GradientDecoratedContainer(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: themeData(context),
              initialRoute: InitialScreen.routeName,
              routes: AppRouter.routes,
            ),
          ),
        ));
  }
}
