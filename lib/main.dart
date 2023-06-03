import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:havayot/presentation/app_component.dart';
import 'package:havayot/presentation/routes.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

import 'data/l10n/l10n.dart';

void Function(dynamic e)? showError;

void main() async {
  var version = Platform.version;
  if (kDebugMode) {
    print('dart version $version');
  }

  runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding
        .ensureInitialized(); // should be called inside runZonedGuarded for error handling to work

    FlutterError.onError = (details) {
      if (kDebugMode) {
        print('error caught by FlutterError.onError');
      }
    };

    runApp(Havayot(
      appComponent: await createAppComponent(),
    ));
  }, (error, stack) {
    showError?.call(error);
  });
}

void mainErrorHandler(dynamic e, StackTrace s, {bool showErrorInUI = true}) {
  if (kDebugMode) {
    print(e);
    print(s);
  }
  if (showErrorInUI) {
    showError?.call(e);
  }
}

class Havayot extends StatefulWidget {
  final AppComponent appComponent;

  const Havayot({super.key, required this.appComponent});

  @override
  State<Havayot> createState() => HavayotState();
}

class HavayotState extends State<Havayot> with WidgetsBindingObserver {
  static Future<void> get appInitialization => _appInitializationCompleter.future;
  static final Completer<void> _appInitializationCompleter = Completer<void>();
  static final navigatorGlobalKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _appInitializationCompleter.complete();
      // FlutterNativeSplash.remove(); // remove splash screen after initialization completed
    });

    WidgetsBinding.instance.addObserver(this);

    showError = (e) {
      final context = navigatorGlobalKey.currentContext;
      if (context == null) return;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        throw StateError('not handled yet');
      });
    };
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = createHvThemeData(context);
    return MaterialApp(
      navigatorKey: navigatorGlobalKey,
      onGenerateRoute: (settings) => onGenerateRoute(widget.appComponent, settings),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: L10n.defaultLocale,
      supportedLocales: L10n.supportedLocales,
      theme: () {
        final materialTheme = ThemeData(
          primaryColor: theme.primary,
          scaffoldBackgroundColor: theme.primary,
          typography: Typography.material2018(platform: defaultTargetPlatform),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //fontFamily: themeData.defaultFontFamily,
        );
        return materialTheme.copyWith(
          colorScheme: materialTheme.colorScheme
              .copyWith(primary: theme.primary, secondary: theme.primary.withOpacity(0.1)),
          iconTheme: IconThemeData(
            color: theme.white1,
          ),
        );
      }(),
      // TODO: implement splash with logo
      home: Container(),
      builder: (context, child) {
        return HvTheme(
          data: theme,
          child: BotToastInit()(context, child!),
        );
      },
    );
  }
}
