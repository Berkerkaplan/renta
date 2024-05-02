import 'package:flutter/material.dart';
import 'package:renta/login_screens/login_sceen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PanelController _panelController = PanelController();
  List<String> turkiyeSehirleri = [
    'İstanbul', 'Ankara', 'İzmir', 'Adana', // ... Diğer şehirler eklenmeli
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          children: <Widget>[
            CurvedWidget(child: buildTopButton()),
            buildScrollableSection(title: 'Kampanyalar', itemsCount: 10),
            buildScrollableSection(
                title: 'Yakınımızdaki Şubeler', itemsCount: 5),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Rezervasyonlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Kampanyalar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hesabım',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget buildTopButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
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
        Container(
          height: 250.0,
          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(image: NetworkImage('url'))
          ),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemsCount,
            itemBuilder: (BuildContext context, int index) {
              return Card(

                child: Column(
                  children: <Widget>[
                    Image.network(
                      'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      width: 250,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Text('$title $index')
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildPanel() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
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



/* ----------*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kampanya Detayı',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: CampaignDetailScreen(),
    );
  }
}

class CampaignDetailScreen extends StatefulWidget {
  @override
  _CampaignDetailScreenState createState() => _CampaignDetailScreenState();
}

class _CampaignDetailScreenState extends State<CampaignDetailScreen> {
  bool _isCampaignInfoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kampanya Detayı'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Image.network('https://via.placeholder.com/400x200', fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Fiat Egea Dizel, Manuel 4 Gün Üzerine %44 İndirimli!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('*Stoklarla Sınırlı!'),
          ),
          ListTile(
            title: Text('Kampanya Bilgileri'),
            trailing: Icon(_isCampaignInfoVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onTap: () {
              setState(() {
                _isCampaignInfoVisible = !_isCampaignInfoVisible;
              });
            },
          ),
          Visibility(
            visible: _isCampaignInfoVisible,
            child: Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: [
                  Text('Kiralama Tarihi: 15 Nisan 2024 - 12 Haziran 2024'),
                  Text('Kampanya Elazığ ve Malatya şubelerimiz hariç tüm şubelerimizde geçerlidir.'),
                  // Diğer kampanya bilgilerini buraya ekleyin.
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Devam Et butonunun işlevi
              },
              child: Text('Devam Et'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class DateAndTimePickerScreen extends StatefulWidget {
  @override
  _DateAndTimePickerScreenState createState() =>
      _DateAndTimePickerScreenState();
}

class _DateAndTimePickerScreenState extends State<DateAndTimePickerScreen> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now().add(Duration(days: 2));
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? selectedStartDate : selectedEndDate,
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          selectedStartDate = picked;
        } else {
          selectedEndDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarih ve Saat Seçimi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _DateTile(
                      title: 'Alış Tarihi',
                      date: selectedStartDate,
                      icon: Icons.calendar_today,
                      onTap: () => _selectDate(context, true),
                    ),
                  ),
                  VerticalDivider(color: Colors.orange, thickness: 1),
                  Expanded(
                    child: _DateTile(
                      title: 'Teslim Tarihi',
                      date: selectedEndDate,
                      icon: Icons.calendar_today,
                      onTap: () => _selectDate(context, false),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _TimeTile(
                      title: 'Alış Saati',
                      time: selectedTime,
                      icon: Icons.access_time,
                      onTap: () => _selectTime(context),
                    ),
                  ),
                  VerticalDivider(color: Colors.orange, thickness: 1),
                  Expanded(
                    child: _TimeTile(
                      title: 'Teslim Saati',
                      time: selectedTime,
                      icon: Icons.access_time,
                      onTap: () => _selectTime(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              child: CalendarDatePicker(
                initialDate: selectedStartDate,
                firstDate: DateTime.now().subtract(Duration(days: 1)),
                lastDate: DateTime(2025),
                onDateChanged: (date) {
                  setState(() {
                    if (selectedStartDate.isBefore(selectedEndDate)) {
                      selectedStartDate = date;
                    } else {
                      selectedEndDate = date.add(Duration(days: 1));
                    }
                  });
                },
                selectableDayPredicate: (DateTime date) {
                  return date.isAfter(DateTime.now().subtract(Duration(days: 1)));
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
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

class _DateTile extends StatelessWidget {
  final String title;
  final DateTime date;
  final IconData icon;
  final VoidCallback onTap;

  const _DateTile({
    Key? key,
    required this.title,
    required this.date,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${date.day}/${date.month}/${date.year}'),
      leading: Icon(icon, color: Colors.orange),
      onTap: onTap,
    );
  }
}

class _TimeTile extends StatelessWidget {
  final String title;
  final TimeOfDay time;
  final IconData icon;
  final VoidCallback onTap;

  const _TimeTile({
    Key? key,
    required this.title,
    required this.time,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${time.hour}:${time.minute}'),
      leading: Icon(icon, color: Colors.orange),
      onTap: onTap,
    );
  }
}




class CarRentalScreen extends StatefulWidget {
  @override
  _CarRentalScreenState createState() => _CarRentalScreenState();
}

final String carImage =
    'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
final bool notificationButton = false;
class _CarRentalScreenState extends State<CarRentalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Geri butonunun fonksiyonu
          },
        ),
        title: const Column(
          children: [
            Text(
              'Adana Havalimanı - Adana Havalimanı',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              '15 Mayıs 18:00 - 17 Mayıs 18:00',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // Çarpı butonunun fonksiyonu
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Sırala butonu fonksiyonu
                  },
                  child: const Text('Sırala'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Filtrele butonu fonksiyonu
                  },
                  child: const Text('Filtrele'),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Sadece Kampanyalıları Göster'),
            value: notificationButton,
            onChanged: (bool value) {
              setState(() {
                value = !notificationButton;
              });
              // Switch'in durumunu değiştiren fonksiyon
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Araç listesi uzunluğu
              itemBuilder: (context, index) {
                return const CarListItem(); // Araç listesi elemanı widget'ı
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CarListItem extends StatelessWidget {
  const CarListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(48), // Image radius
                child: Image.network(carImage, fit: BoxFit.fill),
              ),
            ),

            // Araç resmi
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('EKONOMİ  ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('|  X Grubu'),
                      ],
                    ),
                    Text('FORD TOURNEO COURIER'),
                    Text('Manuel | Dizel'),
                    SizedBox(
                      height: 16,
                    ),
                    IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ŞİMDİ ÖDE'),
                                Text('2105.34 TL',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('OFİSTE ÖDE'),
                                Text('3395.72 TL',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profilim'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          _buildHeader(),
          _buildMenuTile(Icons.person, 'Profilim'),
          SizedBox(height: 12,),
          _buildMenuTile(Icons.error_outline, 'Şikayetlerim'),
          SizedBox(height: 12,),

          _buildMenuTile(Icons.description, 'Kiralama Koşulları'),
          SizedBox(height: 12,),

          _buildMenuTile(Icons.notifications, 'Bildirim Ayarlarım'),
          SizedBox(height: 12,),

          _buildMenuTile(Icons.list, 'Şube Listesi'),
          SizedBox(height: 12,),

          _buildMenuTile(Icons.phone, 'İletişim'),
          SizedBox(height: 12,),

          _buildMenuTile(Icons.message, 'Bize Yazın'),
          ListTile(
            title: Center(child: Text('Touch In Soft. Version 0.0.01 (21.04)')),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Misafir Kullanıcı',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              'Renta\'ya hoş geldiniz!',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                    // Giriş Yap butonu işlevi
                  },
                  child: Text('Giriş Yap'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.orange),
                ),
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));

                    // Üye Ol butonu işlevi
                  },
                  child: Text('Üye Ol'),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildMenuTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () {
        // Menü öğesi tıklandığında işlev
      },
    );
  }
}
