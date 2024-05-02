import 'package:flutter/material.dart';
import 'package:renta/login_screens/login_sceen.dart';


class ReservationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Rezervasyonlar'),
          backgroundColor: Colors.orange,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Aktif'),
              Tab(text: 'Biten'),
              Tab(text: 'İptal'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReservationsContent(),
            ReservationsContent(),
            ReservationsContent(),
          ],
        ),
      ),
    );
  }
}

class ReservationsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on, size: 48.0, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Rezervasyonlarınızı görüntülemek için üye girişi yapmalısınız.',
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: StadiumBorder(),
            ),
            child: Text('Üye Girişi'),
          ),
        ],
      ),
    );
  }
}
