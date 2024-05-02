import 'package:flutter/material.dart';
import 'package:renta/widgets/custom_bottom_button.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  String _gender = "Erkek";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişisel Bilgiler'), // Başlık değiştirildi
        automaticallyImplyLeading: false, // Geri butonu kaldırıldı
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('T.C. Kimlik Numaranız'),
              subtitle: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: '42******50',
                ),
                enabled: false,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Adınız',),
              subtitle: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  labelText: 'Berk',

                ),
                enabled: false,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Soyadınız',),
              subtitle: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  labelText: 'ERKAPLAN',

                ),
                enabled: false,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Doğum Tarihiniz'),
              subtitle: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  labelText: '03/09/1997',
                ),
                enabled: false,
              ),
            ),
            SizedBox(height: 10),
            Text('Cinsiyet'),
            ListTile(
              title: const Text('Erkek'),
              leading: Radio(
                value: 'Erkek',
                groupValue: _gender,
                onChanged: null, // Radio button'u değiştirilemez yapıyoruz
              ),
            ),
            ListTile(
              title: const Text('Kadın'),
              leading: Radio(
                value: 'Kadın',
                groupValue: _gender,
                onChanged: null, // Radio button'u değiştirilemez yapıyoruz
              ),
            ),
            ListTile(
              title: const Text('Belirtmek İstemiyorum'),
              leading: Radio(
                value: 'Belirtmek İstemiyorum',
                groupValue: _gender,
                onChanged: null, // Radio button'u değiştirilemez yapıyoruz
              ),
            ),
            SizedBox(height: 30),

          ],
        ),
      ),
      bottomSheet: CustomBottomButton(
        text: 'Kaydet',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
