import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cnode/constants/style.dart';
import 'package:flutter_cnode/routes/routes.dart';
import 'package:flutter_cnode/utils/global.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [],
    child: MyApp(),
  ));

  if (Platform.isAndroid) {
    const style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: RefreshConfiguration(
        hideFooterWhenNotFull: true,
        enableScrollWhenRefreshCompleted: true,
        child: MaterialApp(
          title: 'CNode',
          color: Colors.red,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            platform: TargetPlatform.iOS,
            // accentColor: CNColors.primary,
            // unselectedWidgetColor: CNColors.textLight,
            // primaryColor: CNColors.primary,
            // textTheme: TextTheme(body1: CRMText.normalText),
            // cursorColor: CNColors.primary,
            // dividerColor: CNColors.borderLight,
            // scaffoldBackgroundColor: CNColors.commonBg,
            // buttonTheme: ButtonThemeData(
            //     buttonColor: CNColors.primary, focusColor: CNColors.primary)
          ),
          // darkTheme: ,
          navigatorKey: Global.rootNavigatorKey,
          initialRoute: RouteName.home,
          onGenerateRoute: Routes.generateRoute,
          navigatorObservers: [BotToastNavigatorObserver()],
          localizationsDelegates: [
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US'),
          ],
          locale: Locale('zh', 'CH'),
        ),
      ),
    );
  }
}
