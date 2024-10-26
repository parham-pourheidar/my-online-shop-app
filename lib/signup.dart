import 'package:flutter/material.dart';
import 'package:mystore/selector.dart';
import 'login.dart';
import 'splash.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const text_style = TextStyle(
    color: Colors.blueGrey,
    fontSize: 21,
    fontFamily: 'Irs',
    fontWeight: FontWeight.w600,
  );
  static const input_style = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: 'Irs',
    fontWeight: FontWeight.w500,
  );
  static const hint_style = TextStyle(
    color: Colors.black45,
    fontSize: 18,
    fontFamily: 'Irs',
  );

  TextEditingController username_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController re_pass_controller = TextEditingController();

  bool is_pass_obscure = true;
  bool is_re_pass_obscure = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'ثبت نام',
              style: TextStyle(
                  fontSize: 22, fontFamily: 'Irs', color: Colors.blueGrey),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Selector()));
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.blueGrey,
              ),
            ),
          ),
          body: SignUpUI(),
        );
      }),
    );
  }

  Widget SignUpUI() {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'فروشگاه آنلاین من',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  fontFamily: 'Irs',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 420,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'نام کاربری',
                              style: text_style,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(95, 0, 40, 0),
                          child: TextField(
                            controller: username_controller,
                            textAlign: TextAlign.center,
                            style: input_style,
                            decoration: InputDecoration(
                              hintText: 'شماره موبایل',
                              hintStyle: hint_style,
                              suffixIcon: Icon(Icons.phone_android),
                            ),
                          ),
                        ),
                        SizedBox(height: 45),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'کلمه عبور',
                              style: text_style,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: TextField(
                            obscureText: is_pass_obscure,
                            controller: pass_controller,
                            textAlign: TextAlign.center,
                            style: input_style,
                            decoration: InputDecoration(
                              icon: IconButton(onPressed: (){setState(() {
                                is_pass_obscure = !is_pass_obscure;
                              });}, icon: is_pass_obscure ? Icon(Icons.visibility, color: Colors.blueGrey,) : Icon(Icons.visibility_off, color: Colors.blueGrey,)),
                              hintText: 'کلمه عبور',
                              hintStyle: hint_style,
                              suffixIcon: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        SizedBox(height: 45),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'تکرار کلمه عبور',
                              style: text_style,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: TextField(
                            obscureText: is_re_pass_obscure,
                            controller: re_pass_controller,
                            textAlign: TextAlign.center,
                            style: input_style,
                            decoration: InputDecoration(
                              icon: IconButton(onPressed: (){setState(() {
                                is_re_pass_obscure = !is_re_pass_obscure;
                              });}, icon: is_re_pass_obscure ? Icon(Icons.visibility, color: Colors.blueGrey,) : Icon(Icons.visibility_off, color: Colors.blueGrey,)),
                              hintText: 'تکرار کلمه عبور',
                              hintStyle: hint_style,
                              suffixIcon: Icon(Icons.lock),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              TextButton(
                onPressed: () async {
                  signupRequest(
                    context,
                    username_controller.text,
                    pass_controller.text,
                    re_pass_controller.text,
                  );
                },
                child: Text(
                  'ثبت نام',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Irs',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    fixedSize: Size(340, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    shadowColor: Colors.black),
              ),
            ],
          ),
        ),
      );
    });
  }

  void signupRequest(
      BuildContext context, String username, String pass, String repass) async {
    if (username == '') {
      showSnackBar(context, 'نام کاربری را وارد کنید');
    } else if (pass == '') {
      showSnackBar(context, 'کلمه عبور را وارد کنید');
    } else if (repass == '') {
      showSnackBar(context, 'تکرار کلمه عبور را وارد کنید');
    } else if (pass.length < 8) {
      showSnackBar(context, 'کلمه عبور باید حداقل ۸ کاراکتر داشته باشد');
    } else if (pass != repass) {
      showSnackBar(context, 'کلمه عبور و تکرار آن یکسان نیستند');
    } else {
      final data =
          await supabase.from('users').select().eq('username', username);
      if (data.isEmpty) {
        showSnackBar(context, 'ثبت نام شما با موفقیت انجام شد');
        await supabase
            .from('users')
            .insert({'username': username, 'pass': pass});
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
      } else {
        showSnackBar(context, 'این نام کاربری قبلا استفاده شده است');
      }
    }
  }

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
}
