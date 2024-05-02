import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Araç Kiralama Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BranchSelectionScreen(),
    );
  }
}

class BranchSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for the list of branches
    final branches = [
      'Adana Havalimanı',
      'Adıyaman Havalimanı',
      'Afyonkarahisar Park Afyon AVM',
      'Ankara Kuzu Effect AVM',
      'Ankara Next Level AVM',
      'Ankara Antares AVM',
      // Add more branches as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Alış Şubesi'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Şube Ara',
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
          Expanded(
            child: ListView.builder(
              itemCount: branches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(branches[index]),
                  onTap: () {
                    // Handle the branch selection
                    // You might want to navigate to a new page or pop the current one
                    Navigator.pop(context, branches[index]);
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
