import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reco_restaurant_app/Widgets/customButton.dart';
import 'package:reco_restaurant_app/Widgets/customtextfeild.dart';
import 'package:reco_restaurant_app/loginPage.dart';
import 'package:reco_restaurant_app/menu.dart';


class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    } catch (e) {
      showDialog(
        barrierColor: Colors.black.withOpacity( 0.7),
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Register Error' , style: TextStyle(color: Colors.red),),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK' , style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
color: Color(0xFFffb155)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fastfood_rounded, size: 100, color: Colors.white),
            SizedBox(height: 50),

            CustomTextField(
              hintText: 'Email',
              icon: Icons.email,
              controller: emailController,
              obscureText: false,
            ),
            CustomTextField(
              hintText: 'Password',
              icon: Icons.lock,
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Register',
              onPressed: () => signUp(context), color: Colors.redAccent, textColor: Colors.white,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}