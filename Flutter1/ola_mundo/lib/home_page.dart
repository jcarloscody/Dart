import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}






class HomePageState extends State<HomePage> {
  int counter = 0;
  bool isDartTheme = false;

  @override
  Widget build(BuildContext context) {
    /*return Container(
      child: Center(
          child: GestureDetector(
        child: Text('fluterando $counter'),
        onTap: () {
          setState(() {
            counter++;
          });
          
          print(counter);
        },
      )),
    );*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [CustomSwitcher()],
      ),
      /*body: Center(
          child: GestureDetector(
        child: Text('fluterando $counter'),
        onTap: () {
          setState(() {
            counter++;
          });

          print(counter);
        },)
      ),*/
      body: Container(
        height: double.infinity,
        width: double.infinity,
        /*child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
                Text("Contador $counter"),
                Container(height: 30,),
                CustomSwitcher(),
                Container(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    CustomSwitcher(),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.black,
                    ),
                    CustomSwitcher(),
                  ],
                )
            ],
        ),*/
        child: ListView( //ListView tem scroll
            scrollDirection: Axis.vertical,
            children: [ 
                Text("Contador $counter"),
                Container(height: 30,),
                CustomSwitcher(),
                CustomSwitcher(),
                CustomSwitcher(),CustomSwitcher(),
                CustomSwitcher(),
                CustomSwitcher(),
                CustomSwitcher(),
                CustomSwitcher(),

                Container(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    CustomSwitcher(),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.black,
                    ),
                    CustomSwitcher(),
                  ],
                )
            ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          /*setState(() {
            // counter++;
            isDartTheme = !isDartTheme;
          });*/
           AppController.instance.changeTheme();
        },
      ),
    );
  }
}


class CustomSwitcher extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Switch(
          value: AppController.instance.isDartTheme,
          onChanged: (value) {
            AppController.instance.changeTheme();
          },
        );
  }
}