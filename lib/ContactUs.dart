import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'تماس با ما',
                  style: TextStyle(
                      fontSize: 22, fontFamily: 'Irs', color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              body: UI(context),
            );
          }
      ),
    );
  }
  Widget UI(context){
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border(top: BorderSide(color: Colors.grey, width: 1.6),
              bottom: BorderSide(color: Colors.grey, width: 1.6),
              left: BorderSide(color: Colors.grey, width: 1.6),
              right: BorderSide(color: Colors.grey, width: 1.6),)


        ),
        child: Column(
          children: [
              SizedBox(height: 25,),
              Text('شماره تماس:    09025505342', style: TextStyle(fontSize: 26, fontFamily: 'Irs', fontWeight: FontWeight.w700, color: Colors.grey),),
              SizedBox(height: 80,),
              Text('ارتباط از طریق تلگرام', style: TextStyle(fontSize: 26, fontFamily: 'Irs', fontWeight: FontWeight.w700, color: Colors.grey),),
              SizedBox(height: 9,),
              Container(
                width: 330,
                height: 200,
                child: InkWell(
                    onTap: (){
                      launchUrl(Uri.parse('https://t.me/FlutterUser'));
                    },
                    child: Image.asset('assets/images/telegram.jpeg', fit: BoxFit.fill,))),

          ],
        ),
      ),
    );
  }
}