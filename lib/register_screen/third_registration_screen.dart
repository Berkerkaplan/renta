import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renta/register_screen/verification_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThirdRegistrationScreen(),
    );
  }
}

class ThirdRegistrationScreen extends StatefulWidget {
  @override
  _ThirdRegistrationScreenState createState() =>
      _ThirdRegistrationScreenState();
}

class _ThirdRegistrationScreenState extends State<ThirdRegistrationScreen> {
  int currentPage = 3; // Since the page number in your image is 3
  // Define a list of country codes for the dropdown
  final List<String> countryCodes = [
    '+90',
    '+383',
    '+1',
    '+44',
    '+91',
    '+81',
    '+61',
    '+49'
  ];

// This will hold the selected country code
  String selectedCountryCode = '+90';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          // Top bar area
          Container(
            color: Colors.orange,
            //margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                            // Geri gitme işlevi
                          },
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            // Geri gitme işlevi
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Üye Ol',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 300,
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        borderRadius: BorderRadius.circular(40),
                        value: currentPage / 4,
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                      ),
                    ),
                    Text(
                      '$currentPage/4',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Form area
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-posta Adresi',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    // Add your own email validation logic
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Lütfen geçerli bir e-posta adresi girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Ülke Kodu',
                          border: OutlineInputBorder(),
                        ),
                        value: selectedCountryCode, // default value
                        items: countryCodes.map((String code) {
                          return DropdownMenuItem<String>(
                            value: code,
                            child: Text(code),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Update the UI
                          setState(() {
                            selectedCountryCode = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Cep Telefonu Numarası',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          // Add your own phone number validation logic
                          if (value == null || value.isEmpty) {
                            return 'Lütfen bir telefon numarası girin';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: true, // Use this to hide password
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    // Add your own password validation logic
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bir şifre girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: true, // Use this to hide password confirmation
                  decoration: InputDecoration(
                    labelText: 'Şifre Tekrarı',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    // Add your own password confirmation validation logic
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi tekrar girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Renta ULAŞIM ÇÖZÜMLERİ ANONİM ŞİRKETİ MÜŞTERİLERİN KİŞİSEL VERİLERİNİN KORUNMASI VE İŞLENMESİ AÇIK RIZA METNİ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                CheckboxListTile(
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'GARENTA ULAŞIM ÇÖZÜMLERİ ANONİM ŞİRKETİ TİCARİ ELEKTRONİK İLETİ ONAY METNİ',
                          style: TextStyle(color: Colors.orangeAccent.shade700,fontSize: 14),
                        ),
                        TextSpan(
                          text: '\'belirtilen kapsamda kişisel verilerimin, kampanya iletişimi yapılması, ürün ve hizmetlerin pazarlama '
                              'süreçlerinin planlanması ve icrası, ürün ve hizmetlerin satış ve pazarlaması için pazar araştırması faaliyetlerinin planlanması ve icrası, '
                              'şirketin sunduğu ürün ve hizmetlere bağlılık oluşturulması ve arttırılması süreçlerinin planlanması ve icrası, Şirketimiz tarafından '
                              'sunulan ürün ve hizmetlerin ihtiyaçlarıma ve alışkanlıklarıma göre özelleştirilmesi ile bana özel kampanyalar ve imkanlar oluşturulması '
                              'amaçlarıyla işlenmesini ve bu kapsamda iletişim bilgilerime veya mobil bildirim yöntemi ile uygulamalar üzerinden Şirketimizin Garenta '
                              'markası altında sunduğu ürün ve hizmetlere ilişkin olarak reklam, promosyon, kampanya, anlık bildirimleri (push notification) ve benzeri ticari '
                              'elektronik ileti gönderilmesini ve bu amaçla sınırlı olarak Şirket\'in hizmet aldığı üçüncü kişilerle paylaşılmasını kabul ediyor musunuz?',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  value: false,
                  onChanged: (bool? newValue) {
                    // Update the state to reflect the new value for the checkbox
                    setState(() {
                      // Handle the new value
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                Text(
                  'Renta ULAŞIM ÇÖZÜMLERİ ANONİM ŞİRKETİ MÜŞTERİLERİN KİŞİSEL VERİLERİNİN KORUNMASI VE İŞLENMESİ AÇIK RIZA METNİ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[

                         TextSpan(
                         text:  'Yukarıdaki formda belirtmiş olduğum iletişim bilgilerime veya mobil bildirim yöntemi ile '
                              'uygulamalar üzerinden Açık Rıza metninde belirtilen çerçevede ve amaçlar ile Şirketimizin '
                              'Garenta markası altında sunduğu ürün ve hizmetlere ilişkin olarak her türlü elektronik '
                              'iletişim aracı veya mobil uygulama vasıtası ile reklam, promosyon, kampanya, pazar araştırması '
                              'anketleri ve diğer müşteri memnuniyeti uygulamaları, bilgilendirmeleri, anlık bildirimleri (push '
                              'notification) ve benzeri ticari elektronik ileti gönderilmesini ve tarafınız ile iletişime geçilmesini '
                              'kabul ediyor musunuz?', style: TextStyle(color: Colors.black, fontSize: 14),

                        ),
                      ],),

                  ),
                  value: false,
                  onChanged: (bool? newValue) {
                    // Handle change
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: RichText(
                    text: TextSpan(
                      text: 'Üyelik Sözleşmesi\'',
                      style: TextStyle(color: Colors.orange,fontSize: 14),
                      children: [
                        TextSpan(text: 'ni okudum, kabul ediyorum.',style: TextStyle(color: Colors.black,fontSize: 14)),
                      ]
                    ),
                  ),
                  value: false,
                  onChanged: (bool? newValue) {
                    // Handle change
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              //backgroundColor: Colors.white70, // background
              //foregroundColor: Colors.purple, // foreground
              ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => VerificationScreen()));
            // Handle continue action
          },
          child: Text('Devam Et'),
        ),
      ),
    );
  }
}
