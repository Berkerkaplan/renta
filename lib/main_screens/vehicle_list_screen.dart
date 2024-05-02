import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:renta/main_screens/car_detail.screen.dart';
import 'package:renta/test.dart';

class RentACarScreen extends StatefulWidget {
  @override
  _RentACarScreenState createState() => _RentACarScreenState();
}

class _RentACarScreenState extends State<RentACarScreen> {
  bool isNotificationsEnabled = false; // Durum kontrolü için değişken

  void _toggleNotifications(bool value) {
    setState(() {
      isNotificationsEnabled = value;
    });
  }

  final String carImage =
      'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90oy1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  final List<Car> cars = [
    Car(
      carImage:
          "https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90oy1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      carType: "EKONOMI",
      carGroup: "X Grubu",
      carName:
          "FORD TOURNEO COURIER 1.5L TDCI 100PS JOURNEY TITANIUM PL EU6.2 ya da benzeri",
      transmissionType: "Manuel",
      fuelType: "Dizel",
      priceNow: "2105.34 TL",
      priceAtOffice: "3395.72 TL",
    ),
    Car(
      carImage:
      "https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90oy1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      carType: "EKONOMI",
      carGroup: "X Grubu",
      carName:
      "FORD TOURNEO COURIER 1.5L TDCI 100PS JOURNEY TITANIUM PL EU6.2 ya da benzeri",
      transmissionType: "Manuel",
      fuelType: "Dizel",
      priceNow: "2105.34 TL",
      priceAtOffice: "3395.72 TL",
    ),
    Car(
      carImage:
      "https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90oy1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      carType: "EKONOMI",
      carGroup: "X Grubu",
      carName:
      "FORD TOURNEO COURIER 1.5L TDCI 100PS JOURNEY TITANIUM PL EU6.2 ya da benzeri",
      transmissionType: "Manuel",
      fuelType: "Dizel",
      priceNow: "2105.34 TL",
      priceAtOffice: "3395.72 TL",
    ),
    Car(
      carImage:
      "https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90oy1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      carType: "EKONOMI",
      carGroup: "X Grubu",
      carName:
      "FORD TOURNEO COURIER 1.5L TDCI 100PS JOURNEY TITANIUM PL EU6.2 ya da benzeri",
      transmissionType: "Manuel",
      fuelType: "Dizel",
      priceNow: "2105.34 TL",
      priceAtOffice: "3395.72 TL",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Adana Havalimanı - Adana Havalimanı'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showSortOptions(context, (String selectedSort) {
                      // TODO: Burada seçilen sıralama değeriyle bir işlem yap
                      print('Seçilen sıralama: $selectedSort');
                    });
                  },
                  child: Text('Sıralama Seçenekleri'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showFilterOptions(context);
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => _showFilterOptions(context)));
                  },
                  child: const Text('Filtrele'),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Sadece Kampanyalıları Göster'),
            value: isNotificationsEnabled,
            onChanged: _toggleNotifications,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              // This should be the length of your cars list
              itemBuilder: (context, index) {
                final car = cars[index]; // Get the car at the current index
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CarDetailScreen(
                                  car: car,
                                )));
                  },
                  child: CarListItem(
                    carImage: car.carImage,
                    carType: car.carType,
                    carGroup: car.carGroup,
                    carName: car.carName,
                    transmissionType: car.transmissionType,
                    fuelType: car.fuelType,
                    priceNow: car.priceNow,
                    priceAtOffice: car.priceAtOffice,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Bu fonksiyon, ElevatedButton'ın onPressed callback'i içinde çağrılacak.
void _showSortOptions(BuildContext context, Function(String) onSortSelected) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return FractionallySizedBox(
        heightFactor: 0.7, // Ekranın 1/3'ü kadar yükseklik.
        child: SortOptions(
          onSelected: (selectedSort) {
            Navigator.of(context).pop(); // Bottom sheet'i kapat
            onSortSelected(selectedSort); // Seçilen değeri dışarıya ilet
          },
        ),
      );
    },
  );
}

class SortOptions extends StatefulWidget {
  final Function(String) onSelected;

  SortOptions({required this.onSelected});

  @override
  _SortOptionsState createState() => _SortOptionsState();
}

class _SortOptionsState extends State<SortOptions> {
  String? _selectedSort; // Seçilen sıralama değeri

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 50, // Çizginin genişliği
              height: 6, // Çizginin yüksekliği
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 10), // Çizgi ile başlık arası boşluk

          Center(
            child: Text(
              'Sırala',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10), // Çizgi ile başlık arası boşluk
          Divider(thickness: 2), // Başlık altı ayırıcı
          Expanded(
            child: ListView(
              children: [
                _buildRadioTile('Artan Fiyata Göre'),
                _buildRadioTile('Azalan Fiyata Göre'),
                _buildRadioTile('Kampanya Öncelikli'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // Butona sağdan ve soldan padding veriyoruz
            child: ElevatedButton(
              onPressed: () {
                if (_selectedSort != null) {
                  widget.onSelected(
                      _selectedSort!); // Seçilen değeri dışarıya ilet
                  print(_selectedSort); // Konsolda seçilen değeri yazdır
                  Navigator.of(context).pop(); // Bottom sheet'i kapat
                }
              },
              child: Text('Sırala'),
              style: ElevatedButton.styleFrom(
                minimumSize:
                    Size(double.infinity, 36), // Butonun boyutunu ayarlıyoruz
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedSort = title; // Seçilen değeri güncelle
        });
        print(title); // Konsolda seçilen değeri yazdır
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Radio<String>(
              value: title,
              groupValue: _selectedSort,
              onChanged: (String? value) {
                setState(() {
                  _selectedSort = value; // Seçilen değeri güncelle
                });
                print(value); // Konsolda seçilen değeri yazdır
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showFilterOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext bc) {
      return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity, // Genişlik tam ekran.
        height: MediaQuery.of(context).size.height *
            0.45, // Yükseklik ekranın 1/3'ü.
        child: FilterOptions(),
      );
    },
  );
}

class FilterOptions extends StatefulWidget {
  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  Map<String, bool> _filterValues = {
    'Dizel': false,
    'Benzinli': false,
    'LPG': false,
    'Elektrikli': false,
    'Manuel': false,
    'Otomatik': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
      // Üstten ve alttan boşluk
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 50, // Çizginin genişliği
              height: 6, // Çizginin yüksekliği
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 20), // Çizgi ile başlık arası boşluk
          Text('Filtrele',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          const SizedBox(height: 10),
          // Başlık ile içerik arası boşluk
          Divider(thickness: 2), // Başlık altı ayırıcı
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ..._buildFilterChips(
                    'Yakıt Tipi', ['Dizel', 'Benzinli', 'LPG', 'Elektrikli']),
                const SizedBox(height: 20), // Filtre kategorileri arası boşluk
                ..._buildFilterChips('Vites Tipi', ['Manuel', 'Otomatik']),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Filtre değerlerini kullanarak bir işlem yap
              print(_filterValues);
            },
            child: const Text('Araçları Göster'),
            style: ElevatedButton.styleFrom(
              minimumSize:
                  Size(double.infinity, 36), // Butonun genişliği tam ekran
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFilterChips(String category, List<String> options) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // Kategori başlığı için yatay boşluk
        child: Text(category, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 10), // Kategori başlığı ile çipler arası boşluk
      Wrap(
        spacing: 8, // Çipler arası yatay boşluk
        children: options.map((String option) {
          return FilterChip(
            label: Text(option),
            selected: _filterValues[option]!,
            onSelected: (bool selected) {
              setState(() {
                _filterValues[option] = selected;
              });
            },
          );
        }).toList(),
      ),
      const SizedBox(height: 20), // Çipler arası dikey boşluk
    ];
  }
}

class CheckContainerModel extends StatefulWidget {
  final String text;
  final Function(bool) onChecked;

  const CheckContainerModel({
    required this.text,
    required this.onChecked,
  });

  @override
  _CheckContainerModelState createState() => _CheckContainerModelState();
}

class _CheckContainerModelState extends State<CheckContainerModel> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChecked(_isChecked);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: _isChecked ? Colors.blue : Colors.grey),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Add these functions to the onPressed callbacks of the respective buttons in your main screen.

// // Placeholder for the Sort Screen
// class SortScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sort Options'),
//       ),
//       body: Center(
//         child: Text('Sorting options here.'),
//       ),
//     );
//   }
// }

// Placeholder for the Filter Screen
// class FilterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Filter Options'),
//       ),
//       body: Center(
//         child: Text('Filter options here.'),
//       ),
//     );
//   }
// }

class CarListItem extends StatelessWidget {
  final String carImage;
  final String carType;
  final String carGroup;
  final String carName;
  final String transmissionType;
  final String fuelType;
  final String priceNow;
  final String priceAtOffice;

  CarListItem({
    required this.carImage,
    required this.carType,
    required this.carGroup,
    required this.carName,
    required this.transmissionType,
    required this.fuelType,
    required this.priceNow,
    required this.priceAtOffice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(carImage)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
            SizedBox(width: 8.0),
            // Add space between image and the rest of the details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(carType,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Container(
                        height: 30,
                        child: VerticalDivider(),
                      ),
                      Text(carGroup, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    carName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(transmissionType, style: TextStyle(fontSize: 16)),
                      Container(
                        height: 20,
                        child: VerticalDivider(),
                      ),
                      Expanded(
                        child: Text(fuelType, style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ŞİMDİ ÖDE',
                                style: TextStyle(color: Colors.orange)),
                            Text(priceNow,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('OFİSTE ÖDE',
                                style: TextStyle(color: Colors.orange)),
                            Text(priceAtOffice,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
