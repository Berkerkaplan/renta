import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:renta/login_screens/login_sceen.dart';
import 'package:renta/main_screens/cars_screen.dart';
import 'package:renta/profile_screens/contact_info_screen.dart';
import 'package:renta/profile_screens/contact_us_screen.dart';
import 'package:renta/profile_screens/profile_details_screen.dart';
import 'package:renta/profile_screens/rent_conditions_screen.dart';
import 'package:renta/register_screen/first_register_screen.dart';

import '../notications.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationEnabled = false;
  final NotificationService notificationService =
      NotificationService(); // Ensure NotificationService is correctly defined

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Profilim', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        actions: [
          _buildLanguageSelectionButton(),
        ],
      ),
      body: ListView(
        children: [
          _buildHeader(),
          BuildMenuTile(icon: Icons.person, title: 'Profilim', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileDetailScreen()));
          }),
          SizedBox(height: 12),
          BuildMenuTile(
              icon: Icons.error_outline, title: 'Şikayetlerim', onTap: () {}),
          SizedBox(height: 12),
          BuildMenuTile(
              icon: Icons.description,
              title: 'Kiralama Koşulları',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => RentalConditionsScreen()));
              }),
          SizedBox(height: 12),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.black),
            title: Text('Bildirim Ayarlarım'),
            trailing: _buildNotificationToggle(),
            onTap: () {},
          ),
          SizedBox(height: 12),
          BuildMenuTile(
              icon: Icons.list,
              title: 'Şube Listesi',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BranchSelectionScreen()));
              }),
          SizedBox(height: 12),
          BuildMenuTile(
              icon: Icons.phone,
              title: 'İletişim',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ContactInfoScreen()));
              }),
          SizedBox(height: 12),
          BuildMenuTile(
              icon: Icons.message,
              title: 'Bize Yazın',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ContactScreen()));
              }),
          ListTile(
            title: Center(child: Text('Touch In Soft. Version 0.0.01 (21.04)')),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.orange,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Misafir Kullanıcı',
              style: TextStyle(fontSize: 24, color: Colors.white)),
          Text('Renta\'ya hoş geldiniz!',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Text('Giriş Yap'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange),
              ),
              SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistrationScreen()));
                },
                child: Text('Üye Ol'),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Bildirim açma/kapama düğmesi
  Widget _buildNotificationToggle() {
    return Switch(
      value: isNotificationEnabled,
      onChanged: (value) {
        setState(() {
          isNotificationEnabled = value;
        });
        if (value) {
          notificationService.showNotification(); // Bildirim göster
        }
      },
    );
  }

  Widget _buildLanguageSelectionButton() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.language),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(value: 'tr', child: Text('Türkçe')),
        PopupMenuItem(value: 'en', child: Text('İngilizce')),
        PopupMenuItem(value: 'sq', child: Text('Arnavutça')),
      ],
      onSelected: (String value) {
        _changeAppLanguage(Locale(value, ''));
      },
    );
  }

  void _changeAppLanguage(Locale locale) {
    final GlobalKey<NavigatorState>? navigatorKey =
        Navigator.of(context).widget.key as GlobalKey<NavigatorState>?;
    if (navigatorKey != null) {
      final newApp = MaterialApp(
        key: navigatorKey,
        title: 'Your App Title',
        locale: locale,
        supportedLocales: [
          Locale('tr', ''),
          Locale('en', ''),
          Locale('sq', '')
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      );
      setState(() {
        navigatorKey.currentState!.pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
}

class BuildMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const BuildMenuTile(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: onTap,
    );
  }
}
