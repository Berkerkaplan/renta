import 'package:flutter/material.dart';
import 'package:renta/main_screens/payment_office_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ödeme Bilgileri',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: PaymentInfoScreen(),
    );
  }
}

class PaymentInfoScreen extends StatefulWidget {
  @override
  _PaymentInfoScreenState createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  bool isAgreed = false;
  final String carImage = 'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';


  void _showBottomSheet() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text("Özet",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      carImage,
                      width: 75,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ekonomi | Z Grubu",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("RENAULT CLIO JOY 1.0 SCE 65 BG ya da benzeri",maxLines: 2,),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              ExpansionTile(
                title: Text("Rezervasyon Bilgileri"),
                children: <Widget>[
                  ListTile(
                    title: Text("Araç Kiralama süresi 2 gün"),
                    subtitle:
                    Text("Ankara Kuzu Effect AVM\n02 Mayıs 2024 16:45"),
                  ),
                  ListTile(
                    title: Text("Teslim Bilgisi"),
                    subtitle:
                    Text("Ankara Kuzu Effect AVM\n04 Mayıs 2024 16:45"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Ödeme Bilgileri"),
                children: <Widget>[
                  ListTile(
                    title: Text("Kiralama Ücreti"),
                    subtitle: Text("1978.02 TL"),
                  ),
                  ListTile(
                    title: Text("Ek Hizmet Ücreti"),
                    subtitle: Text("0.00 TL"),
                  ),
                  ListTile(
                    title: Text("Toplam"),
                    subtitle: Text("1978.02 TL"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


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
          ListTile(
            title: Text('Ödeme Yöntemi'),
            trailing: IconButton(
              icon: Icon(Icons.add, color: Colors.orange),
              onPressed: () {
                // Kredi kartı ekleme sayfasına yönlendir
              },
            ),
          ),
          Divider(),
          Text('İndirim Kodu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('* Kampanya kodu girerek, size özel indirimli fiyatları daha da avantajlı hale getirebilirsiniz.'),
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
              Text('Toplam: 1978.02 TL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: isAgreed ? () {
                  // Ödeme işlemine devam et
                } : null,
                child: Text('Ödeme Yap'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: _showBottomSheet,
              child: Row(
                children: [
                  Icon(Icons.arrow_upward, size: 24),
                  SizedBox(width: 8),
                  Text('Toplam: 1978 TL'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => PaymentOfficeScreen()));
                // Navigate to the next screen
              },
              child: Text('Devam Et'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(100, 50),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


