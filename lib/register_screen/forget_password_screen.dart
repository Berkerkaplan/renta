import 'package:flutter/material.dart';
import 'package:renta/register_screen/forgot_password_entry_screen.dart';
import 'package:renta/widgets/custom_bottom_button.dart';



class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? selectedCountryCode;

  // Örnek olarak birkaç ülke kodunu ekliyorum. Gerçek uygulamada tüm ülke kodlarınızın bir listesine ihtiyacınız olacak.
  final List<String> countryCodes = ['+90', '+1', '+44', '+49', '+33'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifremi Unuttum'),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Şifrenizi yenilemek istiyorsanız lütfen cep telefonu numaranızı girin.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    value: selectedCountryCode,
                    decoration: InputDecoration(
                      labelText: 'Ülke Kodu',
                      border: OutlineInputBorder(),
                    ),
                    items: countryCodes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountryCode = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10), // Alanlar arası boşluk
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cep Telefonu Numarası',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Burası CustomBottomButton'unuz için ayrılmıştır
          ],
        ),
      ),
      bottomSheet: CustomBottomButton(
        text: 'Devam Et',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordEntryScreen()));
          // CustomBottomButton'unuzun tıklama işlevi burada
        },
      ),
    );
  }
}
