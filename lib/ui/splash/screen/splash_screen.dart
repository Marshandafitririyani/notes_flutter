import 'package:flutter/material.dart';
import 'package:notes_flutter/ui/home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomeScreen();
      }));
    });
    return Scaffold(
body: Container(
  alignment: Alignment.center,
  width: double.infinity,
  height: double.infinity,
  color: Colors.deepPurple,
  child: SafeArea(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/img_splash_note.png'),
          Text('Jot Down anything you want to achieve, today or in the future', textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),)

        ],
      ),
    ),
  ),

),
    );
  }
}
