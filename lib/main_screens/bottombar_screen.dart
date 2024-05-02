import 'package:flutter/material.dart';
import 'package:renta/main_screens/home_screen.dart';
import 'package:renta/profile_screens/profile_screen.dart';
import 'package:renta/reservation_screens/reservation_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _currentIndex = 0; // Geçerli seçili tab'ı tutan index
  final PanelController _panelController = PanelController();
  final List<Widget> _pages = []; // Sayfa listesi burada oluşturulacak
  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomeScreen(), // Ana sayfa widget'ı

      PlaceholderWidget('Search'),
      ReservationsScreen(), // Diğer sayfalar için placeholder

      ProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Hoş geldiniz',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.orange,
      //   elevation: 0, // AppBar altındaki gölgeyi kaldırır
      // ),
      body: _pages[_currentIndex], // Aktif tab'ın içeriğini göster
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Aktif olan tab index'i
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Rezervasyonlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hesabım',
          ),
        ],
      ),
    );
  }
}

// Ana Sayfa için ayrı bir widget oluşturuldu
class HomePage extends StatelessWidget {
  final PanelController panelController;

  HomePage({Key? key, required this.panelController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ana sayfa içeriği buraya eklenecek
    return SlidingUpPanel(
      controller: panelController,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      panel: Center(child: Text('Panel içeriği')),
      body: Center(child: Text('Ana Sayfa')),
    );
  }
}

// Diğer sayfalar için yer tutucu widget
class PlaceholderWidget extends StatelessWidget {
  final String text;

  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
