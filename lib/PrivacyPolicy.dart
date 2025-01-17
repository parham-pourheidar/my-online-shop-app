import 'package:flutter/material.dart';
import 'settings.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'حریم شخصی',
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
    return Padding(padding: EdgeInsets.fromLTRB(6, 8, 6, 8),child: Text(theText, style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.w400, fontSize: 17, fontFamily: 'Irs'), textDirection: TextDirection.rtl,),);
  }
}


String theText = '''

فروشگاه آنلاین من با تاکید بر احترامی که برای حریم شخصی کاربران قائل است، برای خرید، ثبت نظر یا استفاده از برخی امکانات وب‌سایت اطلاعاتی را از کاربران درخواست می‌کند تا بتواند خدماتی امن و مطمئن را به کاربران ارائه دهد. برای پردازش و ارسال سفارش، اطلاعاتی مانند آدرس، شماره تلفن و ایمیل مورد نیاز است و از آنجا که کلیه فعالیت‌های فروشگاه من قانونی و مبتنی بر قوانین تجارت الکترونیک صورت می‌گیرد و طی فرایند خرید، فاکتور رسمی و بنا به درخواست مشتریان حقوقی گواهی ارزش افزوده صادر می‌شود، از این رو وارد کردن اطلاعاتی مانند نام و کد ملی برای اشخاص حقیقی یا کد اقتصادی و شناسه ملی برای خریدهای سازمانی لازم است. یادآوری می‌شود آدرس ایمیل و تلفن‌هایی که مشتری در پروفایل خود ثبت می‌کند، تنها آدرس ایمیل و تلفن‌های رسمی و مورد تایید مشتری است و تمام مکاتبات و پاسخ‌های شرکت از طریق آنها صورت می‌گیرد.
بنابراین درج آدرس، ایمیل و شماره تماس‌های همراه و ثابت توسط مشتری، به منزله مورد تایید بودن صحت آنها است و در صورتی که موارد فوق به صورت صحیح یا کامل درج نشده باشد، دیجی‌کالا جهت اطمینان از صحت و قطعیت ثبت سفارش می‌تواند از مشتری، اطلاعات تکمیلی و بیشتری درخواست کند.
مشتریان می‌توانند نام، آدرس و تلفن شخص دیگری را برای تحویل گرفتن سفارش وارد کنند و فروشگاه من تنها برای ارسال همان سفارش، از این اطلاعات استفاده خواهد کرد.

''';