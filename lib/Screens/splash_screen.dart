import 'package:flutter/material.dart';
import 'package:soil_health_monitoring_app/Screens/login_screen.dart';
import 'package:soil_health_monitoring_app/Screens/signup_screen.dart';
import 'package:soil_health_monitoring_app/Widgets/elevated_button.dart';

class Splashscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:Center( 
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Soil Health Monitor",style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.teal),),
          SizedBox(height: 30,),
          CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage("assets/soil_health.png",)),
          SizedBox(height: 30,),
          Elevatedbutton(text: "Click to Login", 
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Login()));
          },),
          SizedBox(height: 10,),
          Elevatedbutton(text: "Click to Signup",onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Signup()));
          },),
        ],
        ),
    ),
    );
  }
  }
