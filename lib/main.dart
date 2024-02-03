import 'package:flutter/material.dart';
import 'package:notes_flutter/core/di/app_module.dart';
import 'package:notes_flutter/ui/splash/splash_screen.dart';

/*
void main() {
  */
/*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.deepPurple,

  ));*//*

  runApp(const MyApp());
}
*/

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await AppModule.initService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}