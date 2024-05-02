import 'package:flutter/material.dart';
import 'package:renta/profile_screens/address_form_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adreslerim',
      home: AddressScreen(),
    );
  }
}

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adreslerim'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Material(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.orange,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Kayıtlı Adreslerim'),
                Tab(text: 'Fatura Adreslerim'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 80, color: Colors.grey),
                    Text('Henüz kayıtlı adresiniz bulunmamaktadır.')
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, size: 80, color: Colors.grey),
                      Text('Fatura Adresleriniz burada listelenecek.'),
                    ]),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddressForm()));
          // Ekleme işlevi burada yapılacak
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
