import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renta/main_screens/campaign_details_screen.dart';
import 'package:renta/main_screens/find_cars_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PanelController _panelController = PanelController();
  List<String> turkiyeSehirleri = [
    'İstanbul', 'Ankara', 'İzmir', 'Adana', // ... Diğer şehirler eklenmeli
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Hoş geldiniz',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        elevation: 0, // AppBar altındaki gölgeyi kaldırır
      ),
      body: SlidingUpPanel(
        controller: _panelController,
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        panel: buildPanel(),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CurvedWidget(child: buildTopButton()),
            buildScrollableSection(title: 'Kampanyalar', itemsCount: 10),
            buildScrollableSection(
                title: 'Yakınımızdaki Şubeler', itemsCount: 5),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Ana Sayfa',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.receipt),
      //       label: 'Rezervasyonlar',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.campaign),
      //       label: 'Kampanyalar',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Hesabım',
      //     ),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      // ),
    );
  }

  Widget buildTopButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => FindCarsScreen()));
          // Butona basınca yapılacak işlemler
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          'Araç Bul & Araç Kirala',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildScrollableSection(
      {required String title, required int itemsCount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(title, style: TextStyle(fontSize: 20.0)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  _panelController.isPanelOpen
                      ? _panelController.close()
                      : _panelController.open();
                },
                child: Text('Tümü'),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => CampaignDetailScreen()));
          },
          child: Container(
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              //image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))
            ),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: itemsCount,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))),
                  width: MediaQuery.of(context).size.width * .8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // Image.network(
                      //   width: 250,
                      //   'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      //   height: 200,
                      //   fit: BoxFit.cover,
                      // ),
                      Text(
                        '$title $index',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              'Şehir Seç',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Şehir Ara',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onChanged: (value) {
              // Şehir arama işlemi
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: turkiyeSehirleri.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(turkiyeSehirleri[index]),
                  onTap: () {
                    // Şehir seçildiğinde yapılacak işlem
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedWidget extends StatelessWidget {
  final Widget child;

  CurvedWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
