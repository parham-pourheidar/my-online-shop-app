import 'package:flutter/material.dart';
import 'package:mystore/selector.dart';
import 'package:mystore/signup.dart';
import 'splash.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool is_pass_obscure = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'ورود',
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Irs', color: Colors.blueGrey),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Selector()));
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            body: LoginUI(),
          );
        }
      ),
    );
  }
}

class LoginUI extends StatefulWidget {
  LoginUI({super.key});

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

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool is_pass_obscure = true;

  TextEditingController username_controller = TextEditingController();

  TextEditingController pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              height: 300,
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
                            style: LoginUI.text_style,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(95, 0, 40, 0),
                        child: TextField(
                          controller: username_controller,
                          textAlign: TextAlign.center,
                          style: LoginUI.input_style,
                          decoration: InputDecoration(
                            hintText: 'شماره موبایل',
                            hintStyle: LoginUI.hint_style,
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
                            style: LoginUI.text_style,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: TextField(
                          obscureText: is_pass_obscure,
                          controller: pass_controller,
                          textAlign: TextAlign.center,
                          style: LoginUI.input_style,
                          decoration: InputDecoration(
                            icon: IconButton(onPressed: (){setState(() {
                              is_pass_obscure = !is_pass_obscure;
                            });}, icon: is_pass_obscure ? Icon(Icons.visibility, color: Colors.blueGrey,) : Icon(Icons.visibility_off, color: Colors.blueGrey,)),
                            hintText: 'کلمه عبور',
                            hintStyle: LoginUI.hint_style,
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
              onPressed: () {
                loginRequest(context, username_controller.text, pass_controller.text);
              },
              child: Text(
                'ورود',
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
            SizedBox(height: 35),
            InkWell(
              child: Text(
                'حساب کاربری ندارم',
                style: LoginUI.text_style,
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
              },
            )
          ],
        ),
      ),
    );
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

  void loginRequest(
      BuildContext context, String username, String pass) async {
    if (username == '') {
      showSnackBar(context, 'نام کاربری را وارد کنید');
    } else if (pass == '') {
      showSnackBar(context, 'کلمه عبور را وارد کنید');
    } else if (pass.length < 8) {
      showSnackBar(context, 'کلمه عبور باید حداقل ۸ کاراکتر داشته باشد');
    } else {
      final data =
      await supabase.from('users').select().eq('username', username);
      if (data.isEmpty) {
        showSnackBar(context, 'این نام کاربری وجود ندارد');
      } else {
        if (data[0]['pass'] == pass){
          SharedPreferences instance = await SharedPreferences.getInstance();
          await instance.setBool('is_logged_in', true);
          showSnackBar(context, 'ورود شما با موفقیت انجام شد');
          Future.delayed(const Duration(milliseconds: 1300), () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
          });

        }
        else{
          showSnackBar(context, 'کلمه عبور اشتباه است');
        }
      }
    }
  }
}
