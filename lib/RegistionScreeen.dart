import 'package:e_gold/LoginScreen.dart';
import 'package:flutter/material.dart';

// Import your home screen

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  bool _termsAccepted = false;
  String _gender = '';
  String _country = 'USA'; // Default selected country
  List<String> _countries = ['USA', 'Canada', 'Mexico']; // Example countries

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value!,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value!,
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                  value: _country,
                  onChanged: (newValue) {
                    setState(() {
                      _country = newValue!;
                    });
                  },
                  items: _countries.map((country) {
                    return DropdownMenuItem(
                      child: Text(
                        country,
                        style: TextStyle(color: Colors.red),
                      ),
                      value: country,
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ListTile(
                      title: const Text('Male'),
                      leading: Radio<String>(
                        value: 'Male',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            print(value);
                            _gender = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Female'),
                      leading: Radio<String>(
                        value: 'Female',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            print(value);
                            _gender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                CheckboxListTile(
                  title: Text('I accept the terms and conditions'),
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    if (_formKey.currentState!.validate() &&
        _termsAccepted &&
        _gender.isNotEmpty) {
      _formKey.currentState!.save();
      // Perform registration logic with _username, _email, _password, _country, and _gender
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen.noparam()),
      );
    } else if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You must accept the terms and conditions'),
        backgroundColor: Colors.red,
        showCloseIcon: true,
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
        duration: Duration(seconds: 30),
      ));
    } else if (_gender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your gender')),
      );
    }
  }
}
