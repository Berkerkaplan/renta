import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:renta/profile_screens/address_detail_screen.dart';
import 'package:renta/profile_screens/change_password_screen.dart';
import 'package:renta/profile_screens/license_info_screen.dart';
import 'package:renta/profile_screens/member_info_screen.dart'; // Cupertino icons için

class ProfileDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profilim'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black),
              title: Text('Üyelik Bilgileri'),
              trailing: Icon(Icons.arrow_forward_ios,size: 18,),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => PersonalInfoScreen()));

                // Üyelik bilgileri sayfasına yönlendirme
              },
            ),
            Divider(),
            ListTile(
              tileColor: Colors.white70,
              leading: Icon(Icons.drive_eta, color: Colors.black),
              title: Text('Ehliyet Bilgileri'),
              trailing: Icon(Icons.arrow_forward_ios,size: 18,),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => LicenseInfoScreen()));

                // Ehliyet bilgileri sayfasına yönlendirme
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.black),
              title: Text('Adreslerim'),
              trailing: Icon(Icons.arrow_forward_ios,size: 18,),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => AddressScreen()));

                // Adreslerim sayfasına yönlendirme
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock_outline, color: Colors.black),
              title: Text('Şifre Değiştir'),
              trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => ChangePasswordScreen()));

                // Şifre değiştirme sayfasına yönlendirme
              },
            ),
            Divider(),
            TextButton(
              style: ButtonStyle(alignment: Alignment.bottomLeft),
              child: Text('Hesabı sil', style: TextStyle(color: Colors.orangeAccent.shade100,fontSize: 16)),
              onPressed: () {
                // Hesap silme işlemi
              },
            ),
          ],
        ),
      ),
    );
  }
}
