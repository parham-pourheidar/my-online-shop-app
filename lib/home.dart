import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mystore/Product.dart';
import 'package:mystore/shopping_cart.dart';
import 'settings.dart';
import 'splash.dart';
import 'product_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Product> _items = [];

  int _selectedIndex = 1;

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
        body: MainUI(),
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

  var _future =  supabase.from('products').select();
  Widget MainUI() {
    return FutureBuilder(future: _future, builder: (BuildContext context, snapshot){
      if (snapshot.hasData){
        for (var product in snapshot.data!){
          _items.add(Product(product['id'].toString(), product['name'], product['price'], product['image'], product['description']));
        }
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ImageSlideshow(
                width: double.infinity,
                height: 160,
                initialPage: 0,
                indicatorBackgroundColor: Colors.white,
                indicatorColor: Colors.blueGrey,
                children: [
                  Image.asset(
                    'assets/images/slider_1.jpg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/slider_2.jpg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/slider_3.jpg',
                    fit: BoxFit.fill,
                  ),
                ],
                autoPlayInterval: 5000,
                isLoop: true,
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'پرفروش ترین محصولات',
                        style: text_style,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 385,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: GridView.count(
                    reverse: true,
                    childAspectRatio: 1.15,
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    children: List.generate(_items.length, (int  position){
                      return generateItems(_items[position], context);
                    }),
                  ),
                ),
              ),
              Container(
                height: 130,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.network('https://s6.uupload.ir/files/ban_4_jxpg.jpg', fit: BoxFit.fill,),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 130,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: [
                    Container(
                      height: 130,
                      width: (MediaQuery.of(context).size.width/2)-10,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Image.network('https://s6.uupload.ir/files/ban_5_s0pa.jpg', fit: BoxFit.fill,),
                      ),
                    ),
                    Container(
                      height: 130,
                      width: (MediaQuery.of(context).size.width/2)-10,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Image.network('https://s6.uupload.ir/files/ban_6_9iey.jpg', fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 130,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.network('https://s6.uupload.ir/files/ban_7_b9gw.jpg', fit: BoxFit.fill,),
                ),
              ),
            ],
          ),
        );}
      else{return Center(child: CircularProgressIndicator(color: Colors.blueGrey,));}
    });

  }

  void _onItemTapped(int index) async{
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
      }
      else if (_selectedIndex == 2){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
      }
    });
  }
}

Widget generateItems(Product product, BuildContext context){
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
    elevation: 15,
    shadowColor: Colors.black,
    child: InkWell(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 230,
              height: 210,
              child: Image.network(product.image),
            ),
            SizedBox(height: 10,),
            Container(
              width: 250,
              height: 55,
              child: Text(product.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                fontFamily: 'Irs',
                fontWeight: FontWeight.w500,
              )),
            ),
            Divider(
              height: 10,
              thickness: 1.2,
              indent: 15,
              endIndent: 15,
              color: Colors.blueGrey,
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تومان ', style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontFamily: 'Irs',
                    fontWeight: FontWeight.w400,),),
                Text(dividePrice(product.price.toString()), style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontFamily: 'Irs',
                  fontWeight: FontWeight.w400,),),
              ],
            )
          ],
        ),
      ),
    ),
  );
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