import 'package:flutter/material.dart';
import 'package:mystore/shopping_cart.dart';
import 'home.dart';
import 'PrivacyPolicy.dart';
import 'TermsOfUse.dart';
import 'ContactUs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'selector.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  int _selectedIndex = 0;

  static const text_style = TextStyle(
    color: Colors.blueGrey,
    fontSize: 21,
    fontFamily: 'Irs',
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'فروشگاه من',
            style: text_style,
          ),
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: MainUI(context),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 22,
          selectedIconTheme: IconThemeData(size: 30),
          selectedItemColor: Colors.blueGrey,
          selectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Irs'),
          unselectedFontSize: 18,
          unselectedIconTheme: IconThemeData(size: 26),
          unselectedItemColor: Colors.black38,
          unselectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Irs'),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 20,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'تنظیمات'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'صفحه اصلی'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: 'سبد خرید'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }


  Widget MainUI(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 13,),
        Container(
          width: double.infinity,
          height: 70,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border(top: BorderSide(color: Colors.grey, width: 1.8),
              bottom: BorderSide(color: Colors.grey, width: 1.8),
              left: BorderSide(color: Colors.grey, width: 1.8),
              right: BorderSide(color: Colors.grey, width: 1.8),)


          ),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyPolicy(),));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                child: Text('حریم خصوصی', style: TextStyle(color: Colors.blueGrey, fontSize: 23, fontWeight: FontWeight.w500, fontFamily: 'Irs'),),
              ),
            ),
          ),
        ),
        SizedBox(height: 14,),
        Container(
          width: double.infinity,
          height: 70,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border(top: BorderSide(color: Colors.grey, width: 1.8),
                bottom: BorderSide(color: Colors.grey, width: 1.8),
                left: BorderSide(color: Colors.grey, width: 1.8),
                right: BorderSide(color: Colors.grey, width: 1.8),)


          ),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsOfUse()));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                child: Text('شرایط استفاده', style: TextStyle(color: Colors.blueGrey, fontSize: 23, fontWeight: FontWeight.w500, fontFamily: 'Irs'),),
              ),
            ),
          ),
        ),
        SizedBox(height: 14,),
        Container(
          width: double.infinity,
          height: 70,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border(top: BorderSide(color: Colors.grey, width: 1.8),
                bottom: BorderSide(color: Colors.grey, width: 1.8),
                left: BorderSide(color: Colors.grey, width: 1.8),
                right: BorderSide(color: Colors.grey, width: 1.8),)


          ),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUs()));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                child: Text('تماس با ما', style: TextStyle(color: Colors.blueGrey, fontSize: 23, fontWeight: FontWeight.w500, fontFamily: 'Irs'),),
              ),
            ),
          ),
        ),
        SizedBox(height: 14,),
        Container(
          width: double.infinity,
          height: 80,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border(top: BorderSide(color: Colors.grey, width: 1.8),
                bottom: BorderSide(color: Colors.grey, width: 1.8),
                left: BorderSide(color: Colors.grey, width: 1.8),
                right: BorderSide(color: Colors.grey, width: 1.8),)


          ),
          child: InkWell(
            onTap: (){
              showDialog(context: context, builder: (context){
                return SimpleDialog(
                  shadowColor: Colors.grey,
                  elevation: 8,
                  backgroundColor: Colors.white70,
                  title: Text('آیا از خروج از حساب کاربری خود اطمینان دارید؟', style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: 'Irs' , fontWeight: FontWeight.w600),),
                  children: [
                    InkWell(
                        onTap: () async {
                          SharedPreferences instance = await SharedPreferences.getInstance();
                          await instance.setBool('is_logged_in', false);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Selector()));
                        },
                        child: Text('خروج', textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent, fontSize: 23, fontFamily: 'Irs' , fontWeight: FontWeight.w800))),
                    SizedBox(height: 13,),
                    InkWell(
                        onTap: (){Navigator.of(context).pop();},
                        child: Text('انصراف', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 21, fontFamily: 'Irs' , fontWeight: FontWeight.w600)))],);
              });
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                child: Text('خروج از حساب کاربری', style: TextStyle(color: Colors.redAccent, fontSize: 23, fontWeight: FontWeight.w500, fontFamily: 'Irs'),),
              ),
            ),
          ),
        ),
      ],
    );

  }

  void _onItemTapped(int index) async{
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      else if (_selectedIndex == 2){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
      }
    });
  }
}