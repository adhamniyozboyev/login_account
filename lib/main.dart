import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          height: 600,
          width: 400,
          child: Form(
            child: Column(
              children: [
                Text('Login Account',style: TextStyle(fontSize: 40),),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter correct email';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        labelText: 'Email Adress',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Check your password';
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.safety_check),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text('Save password'),
                        value: value1,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
                          setState(() {
                            value1 = !value1;
                          });
                        },
                      ),
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          fixedSize: Size(400, 45)),
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('Logn account')),
                ),
                Text("Don't have an account? sign")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
