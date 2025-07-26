import 'package:flutter/material.dart';
import 'package:reco_restaurant_app/Widgets/customButton.dart';
import 'package:reco_restaurant_app/loginPage.dart';

class Recopage extends StatelessWidget {
  Recopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffb155),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 300,
              width: 300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reco Restaurant",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),

          Text(
            'Delicious Meals,Delivered Fast ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 30),

          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent
              ),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get Started' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_right_alt , color: Colors.white, size:30,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
