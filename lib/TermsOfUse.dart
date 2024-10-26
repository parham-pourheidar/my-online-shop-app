import 'package:flutter/material.dart';
import 'settings.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'شرایط استفاده',
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
              body: UI(context)
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

کاربر گرامی لطفاً موارد زیر را جهت استفاده بهینه از خدمات و برنامه‌‏های کاربردی فروشگاه من به دقت ملاحظه فرمایید.
ورود کاربران به وب‏‌سایت فروشگاه من هنگام استفاده از پروفایل شخصی، طرح‏‌های تشویقی، ویدئوهای رسانه تصویری فروشگاه من و سایر خدمات ارائه شده توسط فروشگاه من به معنای آگاه بودن و پذیرفتن شرایط و قوانین و همچنین نحوه استفاده از سرویس‌‏ها و خدمات فروشگاه من است. توجه داشته باشید که ثبت سفارش نیز در هر زمان به معنی پذیرفتن کامل کلیه شرایط و قوانین فروشگاه من از سوی کاربر است. لازم به ذکر است شرایط و قوانین مندرج، جایگزین کلیه توافق‏‌های قبلی محسوب می‏‌شود.
توجه داشته باشید کلیه اصول و رویه‏‌های فروشگاه من منطبق با قوانین جمهوری اسلامی ایران، قانون تجارت الکترونیک و قانون حمایت از حقوق مصرف کننده است و متعاقبا کاربر نیز موظف به رعایت قوانین مرتبط با کاربر است. در صورتی که در قوانین مندرج، رویه‏‌ها و سرویس‏‌های فروشگاه من تغییراتی در آینده ایجاد شود، در همین صفحه منتشر و به روز رسانی می شود و شما توافق می‏‌کنید که استفاده مستمر شما از سایت به معنی پذیرش هرگونه تغییر است.

''';