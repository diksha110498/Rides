import 'export.dart';

void main() {

  ApiRepository();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        initialRoute: AppPagesView().homeRoute,
        getPages: AppPagesView().appages,
        theme: themeData);
  }
}
