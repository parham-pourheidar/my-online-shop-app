import 'package:flutter/material.dart';
import 'package:mystore/signup.dart';
import 'login.dart';

class Selector extends StatefulWidget {
  const Selector({super.key});

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
              Text(
                'خوش آمدید',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Irs'),
              ),
              SizedBox(height: 40),
              Image.asset(
                'assets/images/welcome.gif',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'ورود',
                  style: TextStyle(
                      color: Colors.white, fontSize: 22, fontFamily: 'Irs'),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: Size(330, 60),
                  backgroundColor: Colors.blueGrey,
                  elevation: 10,
                  shadowColor: Colors.black,
                ),
              ),
              SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text(
                  'ثبت نام',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 22,
                    fontFamily: 'Irs',
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: Size(330, 60),
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
