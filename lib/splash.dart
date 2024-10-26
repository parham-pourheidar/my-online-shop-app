import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystore/home.dart';
import 'package:splash_view/splash_view.dart';
import 'selector.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool is_logged = false;

void main()  async{

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yfewkfukadeznktacmjx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlmZXdrZnVrYWRlem5rdGFjbWp4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg1NTg2NzAsImV4cCI6MjA0NDEzNDY3MH0.imlug-otQhC8tMIGV5EabaLCqj95wvFIScREE_ObFlU',
  );

  SharedPreferences instance = await SharedPreferences.getInstance();
  if (instance.getBool('is_logged_in') == true){
    is_logged = true;
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(
        showStatusBar: true,
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blueGrey]),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white,
        title: const Text(
          'به فروشگاه من خوش آمدید',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontFamily: 'Irs'),
        ),
        done: Done(is_logged ? Home() : Selector(),
            curve: Curves.bounceOut,
            animationDuration: const Duration(milliseconds: 1300)),
      ),
    );
  }
}
