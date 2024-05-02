import 'package:flutter/material.dart';
import 'package:renta/widgets/custom_bottom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bize Ulaşın',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _topicController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bize Ulaşın'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Size daha iyi bir hizmet verebilmemiz için lütfen istenen bilgileri eksiksiz doldurunuz.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Adınız*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Soyadınız*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Konu için DropdownButton veya benzeri bir widget kullanılabilir
            TextFormField(
              controller: _topicController,
              decoration: InputDecoration(
                labelText: 'Konu*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Açıklama*',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            OutlinedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Döküman Ekle'),
              onPressed: () {
                // Döküman ekleme işlevi burada olacak
              },
            ),
            SizedBox(height: 20),
            RichText( 
              text: TextSpan(
                text: 'Tarafimiza ilettiginiz kigisel verileriniz ',
                style: TextStyle(color: Colors.black,fontSize: 16),

                children: [
                  TextSpan(
                    text: 'Renta Ulasim Cözümleri Anonim Sirketi Müsteri Aydinlatma Metni',
                    style: TextStyle(color: Colors.orange)
                  ),
                  TextSpan(
                    text: '\'nde belirtildigi sekilde islenebilecektir.'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: CustomBottomButton(
        onTap: () {},
        text: 'Gönder',
      ),
    );
  }
}
