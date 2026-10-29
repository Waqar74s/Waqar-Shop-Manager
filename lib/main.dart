import 'package:flutter/material.dart';

void main() {
  runApp(WaqarShopManagerApp());
}

class WaqarShopManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waqar Ali Communication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blueGrey.shade900,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Waqar Ali Communication & Electronics',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Branded Welcome Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueGrey.shade200),
              ),
              child: Column(
                children: [
                  Icon(Icons.verified_user, size: 40, color: Colors.blueGrey.shade900),
                  SizedBox(height: 8),
                  Text(
                    'Welcome to Shop Dashboard',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade900),
                  ),
                  Text('Contact: 0304-0235115', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            // Grid Menu for Core Features
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(context, Icons.qr_code_scanner, 'POS & Print Sale', Colors.green, 'POS Mode Open'),
                  _buildMenuCard(context, Icons.inventory, 'Stock (Photo & Barcode)', Colors.orange, 'Stock Mode Open'),
                  _buildMenuCard(context, Icons.account_balance_wallet, 'Sale & Udhaar Book', Colors.red, 'Udhaar Book Open'),
                  _buildMenuCard(context, Icons.receipt_long, 'Utility Bills Tracker', Colors.blue, 'Bills Mode Open'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, IconData icon, String title, Color color, String debugMessage) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(debugMessage), duration: Duration(seconds: 1)),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 35, color: color),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade900),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
