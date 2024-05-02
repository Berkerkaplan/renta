import 'package:flutter/material.dart';
import 'package:renta/main_screens/cars_screen.dart';
import 'package:renta/main_screens/date_and_time_picker_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FindCarsScreen(),
    );
  }
}

class FindCarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
        title: Text('Araç Bul & Kirala'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CarSelectionTile(
                      title: 'Alış Şube',
                      subtitle: 'ŞUBE SEÇİN',
                      icon: Icons.location_on,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.orange,
                    thickness: 2,
                  ),
                  Expanded(
                    child: CarSelectionTile(
                      title: 'Teslim Şube',
                      subtitle: 'ŞUBE SEÇİN',
                      icon: Icons.location_on,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DateSelectionTile(
                      title: 'Alış Tarihi',
                      subtitle: 'TARİH VE SAAT SEÇİN',
                      icon: Icons.calendar_today,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.orange,
                    thickness: 2,
                  ),
                  Expanded(
                    child: DateSelectionTile(
                      title: 'Teslim Tarihi',
                      subtitle: 'TARİH VE SAAT SEÇİN',
                      icon: Icons.calendar_today,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Gelişmiş arama işlemleri
            },
            child: Text('Gelişmiş Arama'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                // Araçları göster işlemleri
              },
              child: Text('Araçları Göster'),
            ),
          ),
        ],
      ),
    );
  }
}

class CarSelectionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CarSelectionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icon, color: Colors.orange),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => BranchSelectionScreen()));
        // Seçim işlemleri
      },
    );
  }
}



class DateSelectionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const DateSelectionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icon, color: Colors.orange),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DateAndTimePickerScreen()));
        // Seçim işlemleri
      },
    );
  }


}