import 'package:disruptivestudio_test/feature/auth/bloc/auth_bloc.dart';
import 'package:disruptivestudio_test/feature/home/bloc/coins_bloc.dart';
import 'package:disruptivestudio_test/feature/onbording/pages/onbording_page.dart';
import 'package:disruptivestudio_test/flavor.dart';
import 'package:disruptivestudio_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disruptivestudio_test/l10n/l10n.dart';
import 'injection/injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  onGoToRoute(Routes route) {
    String? routeName = AppNavigator.getNameByRoute(route);
    String? currentRouteName = AppNavigator.getCurrentRoute();
    if (routeName != currentRouteName) {
      AppNavigator.push(route);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()),
        BlocProvider(create: (context) => di.sl<CoinsBloc>()..add(CoinsMarketsEvent())),

        
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner:
                Flavor.instance.value == FlavorType.dev ? true : false,
            title: 'disruptive',
            theme: ThemeData(),
            supportedLocales: L10n.all,
            scaffoldMessengerKey: scaffoldMessengerKey,
            navigatorKey: AppNavigator.navigatorKey,
            home: const OnbordingPage(),
            onGenerateRoute: AppNavigator.onGenerateRoute,
          )),
    );
  }
}
