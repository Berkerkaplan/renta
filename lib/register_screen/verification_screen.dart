import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renta/main_screens/bottombar_screen.dart';
import 'package:renta/main_screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerificationScreen(),
    );
  }
}

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  String verificationCode = '';
  int remainingAttempts = 5;
  Timer? _timer;
  int _start = 117;
  int currentPage = 4; // Since the page number in your image is 3


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.orange,
            //margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                            // Geri gitme işlevi
                          },
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            // Geri gitme işlevi
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Üye Ol',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 300,
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        borderRadius: BorderRadius.circular(40),
                        value: currentPage / 4,
                        backgroundColor: Colors.white,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                      ),
                    ),
                    Text(
                      '$currentPage/4',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lütfen +90 (534) 641 21 11 numaralı cep telefonuna mesaj olarak gönderdiğimiz doğrulama kodunu aşağıya girin.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Doğrulama Kodu',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  verificationCode = value ?? '';
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Kalan hatalı giriş hakkınız: $remainingAttempts'),
          SizedBox(height: 20),
          Text('$_start sn'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Logic to resend the code
                },
                child: Text(
                  'Kod ulaşmadı mı?',
                  style: TextStyle(color: Colors.orange.shade400),
                ),
              ),
              Container(
                height: 20, // Match to your TextButton height if needed
                child: VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Logic to resend the code
                },
                child: Text(
                  'Tekrar Gönder',
                  style: TextStyle(color: Colors.orange.shade400),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            //backgroundColor: Colors.deepOrange, // background color
            //foregroundColor: Colors.white, // foreground color
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => BottomBarScreen()));
              // Perform the submission of the code
            }
          },
          child: Text('Devam Et'),
        ),
      ),
    );
  }
}
