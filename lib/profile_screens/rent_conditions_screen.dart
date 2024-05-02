import 'package:flutter/material.dart';


class RentalConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiralama Koşulları'),
      ),
      body: ListView(
        children: [
          _buildExpansionTile(
            title: 'Kullanıcı Bilgisi',
            content: 'Burada kullanıcı bilgisi ile ilgili detaylar yer alacak.',
          ),
          _buildExpansionTile(
            title: 'Kiralama Süresi',
            content: 'Burada kiralama süresi ile ilgili detaylar yer alacak.',
          ),
          // Diğer başlıklarınız için de benzer şekilde ExpansionTile ekleyin.
          // Örneğin:
          _buildExpansionTile(
            title: 'Yakıt',
            content: 'Burada yakıt politikası ile ilgili detaylar yer alacak.',
          ),
          // Ve böyle devam edin...
        ],
      ),
    );
  }

  Widget _buildExpansionTile({required String title, required String content}) {
    return ExpansionTile(
      title: Text(title),
      children: <Widget>[
        ListTile(
          title: Text(content),
        ),
        // İçerik daha detaylı olabilir, örneğin ek bilgiler veya tablolar içerebilir
      ],
    );
  }
}
