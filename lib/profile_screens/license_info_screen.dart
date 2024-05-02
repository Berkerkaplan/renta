import 'package:flutter/material.dart';
import 'package:renta/widgets/custom_bottom_button.dart';



class LicenseInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ehliyet Bilgileri'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(

                initialValue: '074866',
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),


                labelText: 'Ehliyet Numarası',

                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: 'B',
                decoration: InputDecoration(
                  labelText: 'Ehliyet Sınıfı',
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: 'Salihli',
                decoration: InputDecoration(
                  labelText: 'Ehliyet Alış Yeri',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: '31/07/2018',
                decoration: InputDecoration(
                  labelText: 'Ehliyet Veriliş Tarihi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
      bottomSheet: CustomBottomButton(text: 'Güncelle',onTap: () {

    },),
    );
  }
}
