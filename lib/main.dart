import 'constants/app_imports.dart';

void main() {
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
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ),
    );
  }
}