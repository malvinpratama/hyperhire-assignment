import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/configs/configs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  EasyLocalization.ensureInitialized().then(
    (_) {
      runApp(
        RepositoryProvider(
          create: (context) => constructDb(),
          child: EasyLocalization(
            path: AppLocale.path,
            supportedLocales: AppLocale.supportedLocaleList,
            startLocale: AppLocale.startLocale,
            fallbackLocale: AppLocale.fallbackLocale,
            child: const MainApp(),
          ),
        ),
      );
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        if (screenSize.width < screenSize.height) {
          return FontSizeResolvers.width(fontSize, instance);
        } else {
          final scaleRatio = display.devicePixelRatio > 3 ? 360 : (360 * 2.2);
          final scaleWidth = screenSize.width / scaleRatio;

          return fontSize * scaleWidth;
        }
      },
      builder: (context, _) {
        return MaterialApp.router(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
