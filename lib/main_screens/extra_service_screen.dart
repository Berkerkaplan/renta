import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renta/main_screens/address_selection_screen.dart';
import 'package:renta/widgets/custom_bottom_button.dart';



class ExtraService {
  String name;
  double dailyPrice;
  int days;
  bool isSelected;

  ExtraService({
    required this.name,
    required this.dailyPrice,
    required this.days,
    this.isSelected = false,
  });

  double get totalPrice => dailyPrice * days;
}

class ExtraServicesScreen extends StatefulWidget {
  @override
  _ExtraServicesScreenState createState() => _ExtraServicesScreenState();
}

class _ExtraServicesScreenState extends State<ExtraServicesScreen> {
  List<ExtraService> services = [
    ExtraService(
        name: 'Süper Maksimum Güvence Plus', dailyPrice: 339.00, days: 2),
    ExtraService(name: 'Süper Maksimum Güvence', dailyPrice: 289.00, days: 2),
    ExtraService(name: 'Maksimum Güvence', dailyPrice: 239.00, days: 2),
    ExtraService(name: 'Süper Mini Hasar Plus', dailyPrice: 269.00, days: 2),
  ];
  final String carImage = 'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';


  double get totalPrice =>
      services.where((s) => s.isSelected).fold(0.0, (a, b) => a + b.totalPrice);

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
        title: Text('Ek Hizmetler'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: services.length,
              separatorBuilder: (_, __) => Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                final service = services[index];
                return ListTile(
                  title: Text(service.name),
                  subtitle: Text('${service.dailyPrice} TL / günlük'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                            '${service.totalPrice} TL / ${service.days} gün'),
                      ),
                      Checkbox(
                        value: service.isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            service.isSelected = value!;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
      bottomSheet:Padding(
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
                  Text('Toplam: ${totalPrice.toStringAsFixed(2)} TL'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (_) => AddressSelectionScreen()));
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
