import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar Cleaning System',
      home: WelcomePage(),
    );
  }
}

// ======================
// WELCOME PAGE
// ======================

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/solar_bg.png'),
      fit: BoxFit.cover,
    ),
  ),
        width: double.infinity,
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           Transform.translate(
  offset: Offset(0, -40),

  child: Image.asset(
    'assets/images/images.jpg',
    height: 120,
  ),
),

           
            Text(
              'AUTOMATIC SOLAR PANEL CLEANING SYSTEM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'IoT Based Smart Cleaning and Monitoring',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 234, 224, 224),
              ),
            ),

            SizedBox(height: 50),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(),
                  ),
                );
              },

              child: Text(
                'ENTER SYSTEM',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================
// DASHBOARD PAGE
// ======================

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  String systemStatus = "System Idle";

  List<String> history = [
    "Cleaning completed - 10:00 AM",
    "Dust detected - 09:45 AM",
    "System started - 09:00 AM",
  ];

  void startCleaning() {
    setState(() {
      systemStatus = "Cleaning Started";

      history.insert(
        0,
        "Cleaning started - ${DateTime.now()}",
      );
    });
  }

  void stopCleaning() {
    setState(() {
      systemStatus = "Cleaning Stopped";

      history.insert(
        0,
        "Cleaning stopped - ${DateTime.now()}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('SOLAR CLEANING DASHBOARD'),
         backgroundColor: const Color.fromARGB(255, 212, 226, 236)
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // OVERVIEW CARD

            Card(
              elevation: 5,

              child: Padding(
                padding: EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      'SYSTEM OVERVIEW',

                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 10),
                        Text('Camera Status: Active'),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.water_drop),
                        SizedBox(width: 10),
                        Text('Pump Status: Ready'),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 10),
                        Text('Motor Status: Ready'),
                      ],
                    ),

                    SizedBox(height: 20),

                    Text(
                      'CURRENT STATUS: $systemStatus',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 4, 4, 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // BUTTONS

            Text(
              'SYSTEM CONTROL',

              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 224, 227, 235),

                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),

                  onPressed: startCleaning,

                  child: Text(
                    'START',
                    style: TextStyle(fontSize: 15),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 224, 227, 235),

                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),

                  onPressed: stopCleaning,

                  child: Text(
                    'STOP',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            // HISTORY

            Text(
              'CLEANING HISTORY',

              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 300,

              child: ListView.builder(
                itemCount: history.length,

                itemBuilder: (context, index) {

                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.history),
                      title: Text(history[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}