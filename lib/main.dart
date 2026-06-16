import 'package:flutter/services.dart';

import 'constants/app_imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  PrefManager.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      child: OKToast(
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ),
    );
  }
}