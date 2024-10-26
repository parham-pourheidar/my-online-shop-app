import 'package:flutter/material.dart';
import 'package:mystore/home.dart';
import 'settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  List _items = [];
  int totalPrice = 0;

  int _selectedIndex = 2;

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

  Future<List> getCartItems () async {
    _items = [];
    final SharedPreferences instance = await SharedPreferences.getInstance();
    List<String>? keys = instance.getStringList('itemskeys');
    String item;
    for (item in keys!){
      List<String>? product = instance.getStringList(item);
      _items.add(product);
    }
    return _items;
  }

  Widget generateItems(BuildContext context, List product, int index){
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
        elevation: 15,
        shadowColor: Colors.black,
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: 160,
              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(product[0], style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontFamily: 'Irs',
                    fontWeight: FontWeight.w700,
                  ),),
                  Row(
                    children: [
                      Text('تومان ', style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontFamily: 'Irs',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(dividePrice(product[2]), style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontFamily: 'Irs',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 17,
            ),
            Container(
              width: 110,
              height: 110,
              child: Image.network(product[1], fit: BoxFit.fill,),
            ),
            SizedBox(
              width: 23,
            ),
            Center(
              child: IconButton(onPressed: () async {
                final SharedPreferences instance = await SharedPreferences.getInstance();
                var keys = instance.getStringList('itemskeys');
                keys!.removeAt(index);
                await instance.setStringList('itemskeys', keys);
                setState((){
                });
              }, icon: Icon(Icons.delete, size: 30, color: Colors.blueGrey,)),
            )
          ],
        ),
      ),
    );
  }


  Widget MainUI(BuildContext context)  {

      return FutureBuilder(future: getCartItems(), builder: (BuildContext context, snapshot){
        if (snapshot.data == null){
          return Center(child: Text('سبد خرید شما خالی است', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, fontFamily: 'Irs', color: Colors.blueGrey),));
        }
        else{
          return Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 70),
                  child: ListView(
                    children: List.generate(snapshot.data!.length, (int index){
                      // String price = snapshot.data![index][2];
                      // int intPrice = int.parse(price);
                      // totalPrice += intPrice;
                      return generateItems(context, snapshot.data![index], index);
                    }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.blueGrey,
                    height: 70,
                    width: double.infinity,
                    child: InkWell(
                      onTap: (){
                        launchUrl(Uri.parse('https://bmi.ir/fa/services/254/'));
                      },
                      child: Center(child: Text('ادامه فرایند خرید', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Irs',
                        fontWeight: FontWeight.w700,
                      ),)),),
                  ),
                )
              ]
          );
        }
            // Text(totalPrice.toString())

      });

     // return Column(
     //   children: List.generate(productList!.length, (int index){return Text(productList[index]);}),
     // );

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      else if (_selectedIndex == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
      }
    });
  }
}




String dividePrice(String price){
  if(price.length>6) {
    return '${price.substring(0, price.length - 6)},${price.substring(
        price.length - 6, price.length - 3)},${price.substring(
        price.length - 3)}';
  }
  else{
    return '${price.substring(0, price.length - 3)},${price.substring(
        price.length - 3)}';}



}


