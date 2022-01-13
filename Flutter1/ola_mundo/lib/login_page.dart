// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body(){
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                height: 200,
                width: 200,
                child:// Image.network("https://image.shutterstock.com/shutterstock/photos/1312503191/display_1500/stock-photo-sexy-lady-in-mini-bikini-big-boobs-1312503191.jpg")
                  Image.asset('assets/img/logo.jpg')
              ),
              Container(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                ),
              ),
              Container(
                height: 4,
              ),
              ElevatedButton(
                onPressed: () {
                  if (email == "j" && password == "123") {
                    print("shoe");
                   /* Navigator.of(context).pushReplacement(//or simplesmente push a depender da ocasiao
                      MaterialPageRoute(builder: (context) => HomePage())
                    );*/
                    Navigator.of(context).pushReplacementNamed('/home');//or pushNamed a  depender da ocasiao
                  } else {
                    print("noa");
                  }
                },
                child: Text('Entrar'),
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/img/log.jpg",
                fit: BoxFit.cover,)
            ),
            Container(color: Colors.black.withOpacity(0.3),),
            _body()
          ],
        )
      )
    );
  }
}
