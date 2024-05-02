import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renta/login_screens/login_sceen.dart';
import 'package:renta/register_screen/driver_license_screen.dart';
import 'package:renta/widgets/custom_bottom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Üyelik Formu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Burada daha fazla state değişkeni ekleyebilirsiniz.
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String surname = '';
  String tcIdentity = '';
  String birthDate = '';
  String gender = '';
  bool isTurkishCitizen = true; // Varsayılan olarak Türk vatandaşı seçili
  int currentPage = 1;
  int totalPage = 4;

  @override
  Widget build(BuildContext context) {
    // AppBar'ın yüksekliği ekranın %25'i olacak şekilde hesaplanır
    double appBarHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(appBarHeight),
      //   child: AppBar(
      //     backgroundColor: Colors.orange,
      //
      //     title: Text('Üye Ol'),
      //     bottom: PreferredSize(
      //       preferredSize: Size.fromHeight(30),
      //       child: Padding(
      //         padding: EdgeInsets.only(bottom: 8.0),
      //         child: LinearProgressIndicator(
      //           value: currentPage / 4,
      //           backgroundColor: Colors.white70,
      //           valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white,),
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
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                    title: const Text('T.C. Vatandaşı'),
                                    leading: Radio<bool>(
                                      value: true,
                                      groupValue: isTurkishCitizen,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isTurkishCitizen = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text('Diğer'),
                                    leading: Radio<bool>(
                                      value: false,
                                      groupValue: isTurkishCitizen,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isTurkishCitizen = value!;
                                        });
                                      },
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
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16.0),
                      children: <Widget>[
                        SwitchListTile(
                          title: const Text('T.C. Vatandaşı'),
                          value: isTurkishCitizen,
                          onChanged: (bool value) {
                            setState(() {
                              isTurkishCitizen = value;
                            });
                          },
                        ),
                        if (isTurkishCitizen)
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'T.C. Kimlik Numarası'),
                            onSaved: (value) {
                              tcIdentity = value ?? '';
                            },
                          ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Adınız'),
                          onSaved: (value) {
                            name = value ?? '';
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Soyadınız'),
                          onSaved: (value) {
                            surname = value ?? '';
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Doğum Tarihiniz',
                            hintText: 'GG/AA/YYYY',
                          ),
                          onSaved: (value) {
                            birthDate = value ?? '';
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('Cinsiyet',
                              style: TextStyle(fontSize: 16.0)),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              CheckboxListTile(
                                title: const Text('Erkek'),
                                value: gender == 'Erkek',
                                onChanged: (bool? value) {
                                  setState(() {
                                    gender = 'Erkek';
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: const Text('Kadın'),
                                value: gender == 'Kadın',
                                onChanged: (bool? value) {
                                  setState(() {
                                    gender = 'Kadın';
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: const Text('Belirtmek İstemiyorum'),
                                value: gender == '',
                                onChanged: (bool? value) {
                                  setState(() {
                                    gender = '';
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ...
                  //Spacer(), // Bu widget, 'Devam Et' butonunu altta tutar.
                ],
              ),
            ),
          ),
          SizedBox(height: 100,),
        ],
      ),
      bottomSheet: CustomBottomButton(
        text: 'Devam Et',
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => DriverLicensePage()));
        },
      ),
    );
  }
}

//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Üyelik Formu',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: RegistrationScreen(),
//     );
//   }
// }
//
// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '';
//   String surname = '';
//   String tcIdentity = '';
//   String birthDate = '';
//   String gender = '';
//   bool isTurkishCitizen = true; // Varsayılan olarak Türk vatandaşı seçili
//   int currentPage = 1;
//   int totalPage = 4;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100.0), // Burada AppBar'ın yüksekliğini ayarlayabiliriz.
//         child: AppBar(
//           title: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Üye Ol'),
//               SizedBox(height: 10),
//               LinearProgressIndicator(
//                 value: currentPage / totalPage,
//                 backgroundColor: Colors.white,
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
//               ),
//             ],
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.all(16.0),
//                 children: <Widget>[
//                   SwitchListTile(
//                     title: const Text('T.C. Vatandaşı'),
//                     value: isTurkishCitizen,
//                     onChanged: (bool value) {
//                       setState(() {
//                         isTurkishCitizen = value;
//                       });
//                     },
//                   ),
//                   if (isTurkishCitizen)
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'T.C. Kimlik Numarası'),
//                       onSaved: (value) {
//                         tcIdentity = value ?? '';
//                       },
//                     ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Adınız'),
//                     onSaved: (value) {
//                       name = value ?? '';
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Soyadınız'),
//                     onSaved: (value) {
//                       surname = value ?? '';
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Doğum Tarihiniz',
//                       hintText: 'GG/AA/YYYY',
//                     ),
//                     onSaved: (value) {
//                       birthDate = value ?? '';
//                     },
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8.0),
//                     child: Text('Cinsiyet', style: TextStyle(fontSize: 16.0)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         CheckboxListTile(
//                           title: const Text('Erkek'),
//                           value: gender == 'Erkek',
//                           onChanged: (bool? value) {
//                             setState(() {
//                               gender = 'Erkek';
//                             });
//                           },
//                         ),
//                         CheckboxListTile(
//                           title: const Text('Kadın'),
//                           value: gender == 'Kadın',
//                           onChanged: (bool? value) {
//                             setState(() {
//                               gender = 'Kadın';
//                             });
//                           },
//                         ),
//                         CheckboxListTile(
//                           title: const Text('Belirtmek İstemiyorum'),
//                           value: gender == '',
//                           onChanged: (bool? value) {
//                             setState(() {
//                               gender = '';
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//               width: double.infinity,
//               child: ElevatedButton(
//                 child: Text('Devam Et'),
//                 onPressed: () {
//                   // Formu kaydetmek ve bir sonraki sayfaya geçiş yapmak için:
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState?.save();
//                     if (currentPage < totalPage) {
//                       setState(() {
//                         currentPage++;
//                       });
//                       // Burada bir sonraki sayfaya geçiş yapabiliriz.
//                     }
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
