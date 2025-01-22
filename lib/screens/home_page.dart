import 'package:flutter/material.dart';
import '../Details/persia_details.dart';
import '../Details/anggora_details.dart';
import '../Details/siam_details.dart';
import '../Details/maine_coon_details.dart';
import '../Details/bengal_details.dart';
import '../Details/sphynx_details.dart';
import 'form.dart'; // 
import 'titipan_saya.dart'; 

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> cats = [
    {'name': 'Persia', 'image': 'assets/images/persia3.png', 'route': 'persia'},
    {
      'name': 'Anggora',
      'image': 'assets/images/persia3.png',
      'route': 'anggora'
    },
    {'name': 'Siam', 'image': 'assets/images/persia3.png', 'route': 'siam'},
    {
      'name': 'Maine Coon',
      'image': 'assets/images/persia3.png',
      'route': 'maine_coon'
    },
    {'name': 'Bengal', 'image': 'assets/images/persia3.png', 'route': 'bengal'},
    {'name': 'Sphynx', 'image': 'assets/images/persia3.png', 'route': 'sphynx'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DataPenitipanPage()),
        );
        break;
      case 2:
        // Pass some data to TitipanSayaPage when navigating
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TitipanSayaPage(data: {'key': 'value'}), // Pass data here
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.black),
                    SizedBox(width: 5),
                    Text("Indonesia"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Jenis Kucing",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: Icon(Icons.tune, color: Colors.orangeAccent),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/banner3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Image.asset(
                              cats[index]['image']!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cats[index]['name']!),
                              TextButton(
                                onPressed: () {
                                  String route = cats[index]['route']!;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        if (route == 'persia') {
                                          return PersiaDetails();
                                        } else if (route == 'anggora') {
                                          return AnggoraDetails();
                                        } else if (route == 'siam') {
                                          return SiamDetails();
                                        } else if (route == 'maine_coon') {
                                          return MaineCoonDetails();
                                        } else if (route == 'bengal') {
                                          return BengalDetails();
                                        } else if (route == 'sphynx') {
                                          return SphynxDetails();
                                        } else {
                                          return PersiaDetails(); // default
                                        }
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  'Details',
                                  style: TextStyle(color: Colors.orangeAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Data',
          ),
        ],
      ),
    );
  }
}
