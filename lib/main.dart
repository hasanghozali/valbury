import 'package:app/const/value_const.dart';
import 'package:app/controller/connection_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/snackbar_atom.dart';
import 'package:app/view/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  Get.put(ConnectionController());
  final ConnectionController connectionController = Get.put(ConnectionController());

  connectionController.onInternetStatusChanged.listen((status) {
    final internetBefore = connectionController.isInternetAvailable.value;
    
    if (!internetBefore && status) {
      SnackBarAtom.green(S().connected);
    } else if (!status) {
      SnackBarAtom.red(S().not_connected);
    }
  });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ValueConst.designSize,
      splitScreenMode: true,
      ensureScreenSize: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: ValueConst.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorAtom.primary),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        useInheritedMediaQuery: true,
        home: const LoginPage(),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.r)),
          child: child!,
        ),
      ),
    );
  }
}
