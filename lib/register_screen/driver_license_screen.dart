import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renta/register_screen/third_registration_screen.dart';
import 'package:renta/widgets/custom_bottom_button.dart';

class DriverLicensePage extends StatefulWidget {
  @override
  _DriverLicensePageState createState() => _DriverLicensePageState();
}

class _DriverLicensePageState extends State<DriverLicensePage> {
  final _formKey = GlobalKey<FormState>();
  String licenseNumber = '';
  String licenseClass = '';
  String licenseIssuePlace = '';
  String licenseIssueDate = '';
  int currentPage = 2; // Bu sayfa 2/4 olarak ayarlandı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            //margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(16.0),
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
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);

                            // İptal işlevi veya uygulamadan çıkış
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white,),
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
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ehliyet Numarası',
                      hintText: 'Ehliyet Numaranızı Girin',
                    ),
                    onSaved: (value) {
                      licenseNumber = value ?? '';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ehliyet Sınıfı',
                      hintText: 'Ehliyet Sınıfınızı Seçin',
                    ),
                    onTap: () {
                      // Burada ehliyet sınıfını seçmek için bir modal açılabilir
                    },
                    onSaved: (value) {
                      licenseClass = value ?? '';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ehliyet Alış Yeri',
                      hintText: 'Ehliyetinizi Nereden Aldınız?',
                    ),
                    onSaved: (value) {
                      licenseIssuePlace = value ?? '';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ehliyet Veriliş Tarihi',
                      hintText: 'GG/AA/YYYY',
                    ),
                    onSaved: (value) {
                      licenseIssueDate = value ?? '';
                    },
                  ),
                  // ...
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: CustomBottomButton(
        text: 'Devam Et',

        onTap: () {
          
          Navigator.push(context, MaterialPageRoute(builder: (_) => ThirdRegistrationScreen()));
        },
      ),
    );
  }
}
