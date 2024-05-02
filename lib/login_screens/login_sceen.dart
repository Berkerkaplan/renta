import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renta/register_screen/first_register_screen.dart';
import 'package:renta/register_screen/forget_password_screen.dart';

import '../main_screens/bottombar_screen.dart';
import '../test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garenta Login Screen',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Renta',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.0), // Boşluk bırakmak için
            TextField(
              decoration: InputDecoration(
                labelText: 'Cep Tel. No / T.C. Kimlik No',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifreniz',
              ),
            ),
            SizedBox(height: 14.0),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordScreen()));
              }, child: Text(textAlign: TextAlign.end, 'Şifremi Unuttum')),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              child: Text('Giriş Yap'),
              onPressed: () {
                // Giriş yapma işlemi
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text('Henüz hesabınız yok mu?'),
            ),
            ElevatedButton(
              child: Text('Üye Ol'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => RegistrationScreen()));

                // Üye olma işlemi
              },
            ),

            ElevatedButton(
              child: Text('Giriş Yapmadan Devam Et'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => BottomBarScreen()));
                // Giriş yapmadan devam etme işlemi
              },
            ),
            // Diğer widget'lar ve düzenlemeler...
          ],
        ),
      ),
    );
  }
}
