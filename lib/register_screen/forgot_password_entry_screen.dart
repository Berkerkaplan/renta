import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renta/main_screens/bottombar_screen.dart';

class ForgotPasswordEntryScreen extends StatefulWidget {
  @override
  _ForgotPasswordEntryScreenState createState() =>
      _ForgotPasswordEntryScreenState();
}

class _ForgotPasswordEntryScreenState extends State<ForgotPasswordEntryScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Şifremi Unuttum'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BottomBarScreen()));
              // Perform the submission of the code
            }
          },
          child: Text('Devam Et'),
        ),
      ),
    );
  }
}
