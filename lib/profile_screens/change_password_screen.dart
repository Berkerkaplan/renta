import 'package:flutter/material.dart';
import 'package:renta/widgets/custom_bottom_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Şifre Değiştir',
      home: ChangePasswordScreen(),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Değiştir'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _oldPasswordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: 'Eski Şifreniz',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: 'Yeni Şifre',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmNewPasswordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: 'Yeni Şifre Tekrari',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: CustomBottomButton(
        text: 'Şifremi Güncelle',
        onTap: () {
          _changePassword();
        },
      ),
    );
  }

  void _changePassword() {
    // Add your password change logic here
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text == _confirmNewPasswordController.text) {
        print('Password successfully changed!');
        // Implement the logic to change the password in your backend
      } else {
        print('Passwords do not match!');
        // Show an error message
      }
    }
  }
}
