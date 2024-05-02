import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ödeme Bilgileri',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: PaymentOfficeScreen(),
    );
  }
}

class PaymentOfficeScreen extends StatefulWidget {
  @override
  _PaymentOfficeScreenState createState() => _PaymentOfficeScreenState();
}

class _PaymentOfficeScreenState extends State<PaymentOfficeScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme Bilgileri'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.orange[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ödeme Yöntemi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('OFİSTE ÖDE',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    'Ödeme, aracı kiralayan şahıs tarafından aracı şubeden teslim alırken kredi kartı ile tahsil edilecektir.'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text('İndirim Kodu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(
              '* Kampanya kodu girerek, size özel indirimli fiyatları daha da avantajlı hale getirebilirsiniz.'),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // İndirim kodu ekleme işlevi
            },
            child: Text('İndirim Kodu Ekle'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
          ),
          CheckboxListTile(
            title: Text("Kiralam Sözleşmesi'ni okudum, kabul ediyorum."),
            value: isAgreed,
            onChanged: (bool? newValue) {
              setState(() {
                isAgreed = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Toplam: 2825.74 TL',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: isAgreed
                    ? () {
                        // Rezervasyon oluşturma işlevi
                      }
                    : null,
                child: Text('Rezervasyon Oluştur'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Toplam: 2825.74 TL',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: isAgreed
                ? () {
                    // Rezervasyon oluşturma işlevi
                  }
                : null,
            child: Text('Rezervasyon Oluştur'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
