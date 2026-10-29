import 'package:flutter/material.dart';
import 'stock_scanner.dart';
import 'bills_tracker.dart';
import 'pos_udhaar.dart';

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
        title: Text('Waqar Ali Communication & Electronics', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.blueGrey.shade200)),
              child: Column(
                children: [
                  Icon(Icons.storefront, size: 45, color: Colors.blueGrey.shade900),
                  SizedBox(height: 8),
                  Text('Waqar Ali Communication Dashboard', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text('WhatsApp: 0304-0235115', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(context, Icons.qr_code_scanner, 'POS & Print Sale', Colors.green, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => POSAndUdhaarScreen()));
                  }),
                  _buildMenuCard(context, Icons.inventory, 'Stock (Photo & Barcode)', Colors.orange, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StockScannerScreen()));
                  }),
                  _buildMenuCard(context, Icons.account_balance_wallet, 'Sale & Udhaar Book', Colors.red, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => POSAndUdhaarScreen()));
                  }),
                  _buildMenuCard(context, Icons.receipt_long, 'Utility Bills Tracker', Colors.blue, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UtilityBillsScreen()));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, IconData icon, String title, Color color, VoidCallback onTapAction) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTapAction,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 28, backgroundColor: color.withOpacity(0.1), child: Icon(icon, size: 32, color: color)),
            SizedBox(height: 12),
            Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}import 'package:flutter/material.dart';
import 'stock_scanner.dart'; // Naye scanner file ko link kiya
                  _buildMenuCard(context, Icons.qr_code_scanner, 'POS & Print Sale', Colors.green, () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('POS Mode Open')));
                  }),
                  // Is Card par click karte hi StockScannerScreen khulegi
                  _buildMenuCard(context, Icons.inventory, 'Stock (Photo & Barcode)', Colors.orange, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StockScannerScreen()),
                    );
                  }),
                  _buildMenuCard(context, Icons.account_balance_wallet, 'Sale & Udhaar Book', Colors.red, () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Udhaar Book Open')));
                  }),
                  _buildMenuCard(context, Icons.receipt_long, 'Utility Bills Tracker', Colors.blue, () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bills Mode Open')));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, IconData icon, String title, Color color, VoidCallback onTapAction) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTapAction,
