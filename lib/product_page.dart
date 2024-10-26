import 'package:flutter/material.dart';
import 'Product.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatelessWidget {

  Product _product;
  ProductPage(this._product);

  void showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(
        duration: Duration(seconds: 3),
        closeIconColor: Colors.white,
        showCloseIcon: true,
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Irs',
            ),
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'اطلاعات محصول',
                  style: TextStyle(
                      fontSize: 22, fontFamily: 'Irs', color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              body: ProductDescriptionUI(context),
            );
          }
      ),
    );
  }
  Widget ProductDescriptionUI(context){
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 12),
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width/2,
              child: Image.network(_product.image, fit: BoxFit.fill,),
            ),
            SizedBox(height: 15),
            Container(
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Card(
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(child:Text(_product.name, textAlign: TextAlign.center, style: TextStyle(
                    fontSize: 23, fontFamily: 'Irs', color: Colors.blueGrey, fontWeight: FontWeight.w800),
                ),),),
              ),
            SizedBox(height: 15),
            Container(
              height: 180,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Card(
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(child:Text(_product.description, style: TextStyle(
                    fontSize: 19, fontFamily: 'Irs', color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),),),
            ),
            SizedBox(height: 15),
            Container(
              height: 70,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Card(
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('تومان ', style: TextStyle(
                      fontSize: 22, fontFamily: 'Irs', color: Colors.blueGrey, fontWeight: FontWeight.w600),
                  ),Text(dividePrice(_product.price.toString()), style: TextStyle(
                      fontSize: 22, fontFamily: 'Irs', color: Colors.blueGrey, fontWeight: FontWeight.w600),
                  ),
                ],)),),
            ),
            SizedBox(height: 24,),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, fixedSize: Size(200, 55)),
                  onPressed: () async {
                    final SharedPreferences sp_instance = await SharedPreferences.getInstance();
                    var keys = await sp_instance.getStringList('itemskeys');
                    keys == null ? keys = [_product.id] : keys.add(_product.id);
                    await sp_instance.setStringList('itemskeys', keys);
                    await sp_instance.setStringList(_product.id, [_product.name, _product.image, _product.price.toString()]);
                    showSnackBar(context, 'محصول با موفقیت به سبد خرید اضافه شد');
                  },
                  child: Text('افزودن به سبد خرید', style: TextStyle(
                  fontSize: 19, fontFamily: 'Irs', color: Colors.white, fontWeight: FontWeight.w600),)),
            )
          ],
        ),
      ),
    );
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