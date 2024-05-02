import 'package:flutter/material.dart';
import 'package:renta/main_screens/date_and_time_picker_screen.dart';



class CampaignDetailScreen extends StatelessWidget {
  final String carImage = 'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kampanya Detayı'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(carImage, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Fiat Egea Dizel, Manuel 4 Gün Üzerine %44 İndirimli!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('*Stoklarla Sınırlı!'),
            ),
            ExpansionTile(
              title: Text('Kampanya Bilgileri'),
              children: <Widget>[
                ListTile(title: Text('Kiralama Tarihi: 15 Nisan 2024 - 12 Haziran 2024')),
                ListTile(title: Text('Kampanya Elazığ ve Malatya şubelerimiz hariç tüm şubelerimizde geçerlidir.')),
                ListTile(title: Text('İndirimli fiyatlar 4-22 gün arası kiralamalar için geçerlidir.')),
                ListTile(title: Text('Ehliyetiniz üzerinde T.C. kimlik numarası bulunması zorunludur.')),
                ListTile(title: Text('Kampanya fiyatı Fiat Egea dizel, manuel benzeri araçlar için geçerlidir.')),
                // Diğer maddeleri de buraya ekleyebilirsiniz.
              ],
            ),
            SizedBox(height: 280),
            //Spacer(),

          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 10,left: 5,right: 5),
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.orange,
            ),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (_) => DateAndTimePickerScreen()));
              // Onay butonunun işlevi
            },
            child: Text('Onayla'),
          ),
        ),
      ),
    ),
    );
  }
}
