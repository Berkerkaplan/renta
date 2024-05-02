import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renta/widgets/custom_bottom_button.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  String? _country;
  String? _city;
  String? _district;
  bool _useAsBillingAddress = false;

  final List<String> _countries = ['Türkiye', 'ABD', 'Almanya'];
  final Map<String, List<String>> _cities = {
    'Türkiye': ['İstanbul', 'Ankara', 'İzmir'],
    'ABD': ['New York', 'Los Angeles', 'Chicago'],
    'Almanya': ['Berlin', 'Münih', 'Hamburg']
  };
  final Map<String, List<String>> _districts = {
    'İstanbul': ['Kadıköy', 'Beşiktaş', 'Üsküdar'],
    'Ankara': ['Çankaya', 'Keçiören', 'Yenimahalle'],
    'İzmir': ['Karşıyaka', 'Bornova', 'Konak']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adreslerim'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Adres Tanımı',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Adres',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ListTile(
                title: Text('Ülke'),
                subtitle: Text(_country ?? 'Ülke seçiniz'),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: () => _selectCountry(),
              ),
              ListTile(
                title: Text('Şehir'),
                subtitle: Text(_city ?? 'Şehir seçiniz'),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: _country != null ? () => _selectCity() : null,
              ),
              ListTile(
                title: Text('İlçe'),
                subtitle: Text(_district ?? 'İlçe seçiniz'),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: _city != null ? () => _selectDistrict() : null,
              ),
              SwitchListTile(
                title: Text('Fatura adresi olarak kullan'),
                value: _useAsBillingAddress,
                onChanged: (bool value) {
                  setState(() {
                    _useAsBillingAddress = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: CustomBottomButton(
        text: 'Kaydet',
        onTap: () {
          _submitForm();
        },
      ),
    );
  }

  void _selectCountry() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Ülke Ara',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onChanged: (value) {
                  // Search functionality goes here
                },
              ),
            ),
            Divider(),

            ListView(
              shrinkWrap: true,
              children: _countries.map((String country) {
                return ListTile(
                  title: Text(country),
                  onTap: () {
                    setState(() {
                      _country = country;
                      _city = null; // Reset city on country change
                      _district = null; // Reset district on country change
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  void _selectCity() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Şehir Ara',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onChanged: (value) {
                  // Search functionality goes here
                },
              ),
            ),
            Divider(),

            ListView(
              shrinkWrap: true,
              children: _cities[_country]!.map((String city) {
                return ListTile(
                  title: Text(city),
                  onTap: () {
                    setState(() {
                      _city = city;
                      _district = null; // Reset district on city change
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  void _selectDistrict() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'İlçe Ara',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onChanged: (value) {
                  // Search functionality goes here
                },
              ),
            ),
            Divider(),
            ListView(
              shrinkWrap: true,
              children: _districts[_city]!.map((String district) {
                return ListTile(
                  title: Text(district),
                  onTap: () {
                    setState(() {
                      _district = district;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save the form data
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form submitted successfully')));
    }
  }
}
