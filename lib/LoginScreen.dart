import 'package:e_gold/Admin.dart';
import 'package:e_gold/Glassmarphishm.dart';
import 'package:e_gold/RegistionScreeen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';
// Import your home screen

class LoginScreen extends StatefulWidget {
  String? name;
  String? age;

  LoginScreen(this.name, this.age);
  LoginScreen.noparam();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool isVisible=false;

 bool isAdmin=false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          GlassmorphicContainer(

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                          print("on   savve $value");
                        },
                        onChanged: (val) {
                          print("on   change $val");
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isVisible=!isVisible;
                                });
                              },
                                child: isVisible?Icon(Icons.visibility):Icon(Icons.visibility_off_sharp))),
                        obscureText: isVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value!,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            value: isAdmin,
                            onChanged: (value) {
                              setState(() {
                                isAdmin = value!;
                              });
                            },
                          ),
                          Text('isAdmin',style: TextStyle(color: Colors.black,fontSize: 20),),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _login,
                        child: Text('Login'),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: Text('Forgot Password?'),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()),
                          );
                        },
                        child: Text('Don\'t have an account? Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() async{

    SharedPreferences _prefs =await   SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {

      _formKey.currentState!.save();
      // Perform login with _email and _password
      if(isAdmin==true){
        await   _prefs.setBool('isLoggedIn', true);
        await  _prefs.setInt("isAdmin", 0);


        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Admin()),
        );
      }else
        {
          await   _prefs!.setBool('isLoggedIn', true);
          await  _prefs!.setInt("isAdmin", 1);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }

    }
  }
}
