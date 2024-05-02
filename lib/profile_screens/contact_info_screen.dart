import 'package:flutter/material.dart';



class ContactInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İletişim'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Image.asset('assets/images/communication_image_one.png')), // SVG dosyası ekleyin
            SizedBox(height: 20),
            Text(
              'Çağrı Merkezi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Sorularınız, memnuniyetiniz, öneri ve görüşleriniz için, 7 gün 24 saat e-posta aracılığı ile veya 08:00 - 00:00 arası çağrı merkezimizden bize ulaşabilirsiniz.',
            ),
            SelectableText(
              '+383 49 421553',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            SelectableText(
              'crm@renta.com.tr',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Center(child: Image.asset('assets/images/communication_image_second.png')), // SVG dosyası ekleyin
            SizedBox(height: 20),
            Text(
              '7/24 Rezervasyon Merkezi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Size özel fiyatlandırma ve çözümler ile zengin marka ve en yeni model araç kiralama teklifleri için 08:00 - 00:00 arası, tüm Türkiye’de hizmet veren "Rezervasyon Merkezi" hattımızı arayabilir veya e-posta gönderebilirsiniz.',
            ),
            SelectableText(
              '+383 49 421553',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),

            //Third Area
            SelectableText(
              'crm@renta.com.tr',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Center(child: Image.asset('assets/images/communication_image_second.png')), // SVG dosyası ekleyin
            SizedBox(height: 20),
            Text(
              '7/24 Acil Yardım Hattı',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Aracinizla bir kaza geçirmeniz, aracin calinmasi, arzalanmasi, lastik patlamasi ve her türlü acil yardima ihtiya duydugunuz durumda, 7 gün 24 saat, tümTürkiye\'de hizmet veren \"Acil Yardim\" hattimizi arayabilirsiniz.',
            ),
            SelectableText(
              '+383 49 421553',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),

            //Fourth Area
            SelectableText(
              'crm@renta.com.tr',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Center(child: Image.asset('assets/images/communication_image_one.png')), // SVG dosyası ekleyin
            SizedBox(height: 20),
            Text(
              'Genel Müdürlük',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Renta Ulasim Çözümleri A.S. Renta Agim Ramadani above the Extreme Pizza / Kosova Prishtine',
            ),
            SelectableText(
              '+383 49 421553',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
