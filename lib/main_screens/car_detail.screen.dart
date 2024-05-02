import 'package:flutter/material.dart';
import 'package:renta/main_screens/extra_service_screen.dart';

class CarListPage extends StatelessWidget {
  final List<Car> cars = [
    Car(
      carImage: "https://link.to.image",
      carType: "EKONOMI",
      carGroup: "X Grubu",
      carName: "FORD TOURNEO COURIER...",
      transmissionType: "Manuel",
      fuelType: "Dizel",
      priceNow: "2105.34 TL",
      priceAtOffice: "3395.72 TL",
    ),
    // Add more cars to the list as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Car'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return ListTile(
            title: Text(car.carName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CarDetailScreen(car: car)),
              );
            },
          );
        },
      ),
    );
  }
}

class CarDetailScreen extends StatefulWidget {
  final Car car;

  CarDetailScreen({required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  bool isPayNowSelected = true;

  final features = [
    {'name': 'Otomatik', 'icon': Icons.speed},
    {'name': 'Elektrikli', 'icon': Icons.bolt},
    {'name': 'Klima', 'icon': Icons.ac_unit},
    {'name': 'Kapı:5', 'icon': Icons.car_rental_outlined},
    {'name': 'Bluetooth', 'icon': Icons.bluetooth},
    // ... Add more features as necessary
  ];

  // Initially, 'Şimdi Öde' is selected
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        // Adjust the padding as needed
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // This will contain the column to the minimum size
          children: [
            Row(
              children: [
                PaymentOptionButton(
                  text: 'ŞİMDİ ÖDE ${widget.car.priceNow}',
                  isSelected: isPayNowSelected,
                  onTap: () {
                    setState(() {
                      isPayNowSelected = true;
                    });
                    // Handle 'Şimdi Öde' action
                  },
                ),
                PaymentOptionButton(
                  text: 'OFİSTE ÖDE ${widget.car.priceAtOffice}',
                  isSelected: !isPayNowSelected,
                  onTap: () {
                    setState(() {
                      isPayNowSelected = false;
                    });
                    // Handle 'Ofiste Öde' action
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RentNowButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ExtraServicesScreen()));
              // Handle 'Hemen Kirala' action
            }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          widget.car.carName,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.car.carImage,
              fit: BoxFit.cover,
              height: 200, // Example height, adjust as needed
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.car.carName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 100, // Adjust the height as necessary
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: features.length,
                      itemBuilder: (context, index) {
                        return Container(

                          width: 100, // Adjust the width as necessary
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(features[index]['icon'] as IconData),
                                Text(features[index]['name'] as String),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ExpansionTile(
                    title: Text('Kiralama Koşulları'),
                    children: _buildRentalConditions(widget.car),
                  ),
                  SizedBox(height: 20),

                  // Text('ŞİMDİ ÖDE: ${car.priceNow}', style: TextStyle(fontSize: 20, color: Colors.orange)),
                  // SizedBox(height: 4),
                  // Text('OFİSTE ÖDE: ${car.priceAtOffice}', style: TextStyle(fontSize: 20, color: Colors.grey)),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRentalConditions(Car car) {
    // Define your rental conditions here
    var conditions = [
      'Min. sürücü yaşı: 23',
      'Min. genç sürücü yaşı: 21',
      'Min. ehliyet yılı: 2',
      'Min. genç sürücü ehliyet yılı: 1',
      'Günlük teminat tutarı: 3000 TL',
      'Aylık teminat tutarı: 3000 TL',
      'Günlük Km: 500',
      'Aylık Km: 3000',
      // ... add more conditions as needed
    ];

    return conditions.map((condition) {
      return ListTile(
        leading: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: Colors.purpleAccent.shade400, // Color for the bullet
            shape: BoxShape.circle,
          ),
        ),
        title: Text(condition),
      );
    }).toList();
  }

// List<Widget> _buildRentalConditions(Car car) {
//   // Assuming these fields exist on the Car model
//   return [
//     ListTile(title: Text('Min. sürücü yaşı: 23'),leading: CircleAvatar(radius: 5,),),
//     ListTile(title: Text('Min. genç sürücü yaşı: 21')),
//     ListTile(title: Text('Min. ehliyet yılı: 2')),
//     ListTile(title: Text('Min. genç sürücü ehliyet yılı: 1')),
//     ListTile(title: Text('Günlük teminat tutarı: 3000 TL')),
//     ListTile(title: Text('Aylık teminat tutarı: 3000 TL')),
//     ListTile(title: Text('Günlük Km: 500')),
//     ListTile(title: Text('Aylık Km: 3000')),
//     // ... add more conditions as needed
//   ];
// }
}

class Car {
  final String carImage;
  final String carType;
  final String carGroup;
  final String carName;
  final String transmissionType;
  final String fuelType;
  final String priceNow;
  final String priceAtOffice;

  Car({
    required this.carImage,
    required this.carType,
    required this.carGroup,
    required this.carName,
    required this.transmissionType,
    required this.fuelType,
    required this.priceNow,
    required this.priceAtOffice,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carImage: json['carImage'] as String,
      carType: json['carType'] as String,
      carGroup: json['carGroup'] as String,
      carName: json['carName'] as String,
      transmissionType: json['transmissionType'] as String,
      fuelType: json['fuelType'] as String,
      priceNow: json['priceNow'] as String,
      priceAtOffice: json['priceAtOffice'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carImage': carImage,
      'carType': carType,
      'carGroup': carGroup,
      'carName': carName,
      'transmissionType': transmissionType,
      'fuelType': fuelType,
      'priceNow': priceNow,
      'priceAtOffice': priceAtOffice,
    };
  }
}

class PaymentOptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class RentNowButton extends StatelessWidget {
  final VoidCallback onTap;

  const RentNowButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity * 0.75,
        padding: EdgeInsets.all(10),
        child: Text(
          'HEMEN KİRALA',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
