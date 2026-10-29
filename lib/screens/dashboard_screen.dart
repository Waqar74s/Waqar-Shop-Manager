import 'package:flutter/material.dart';
import 'stock_screen.dart';
import 'bills_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waqar Ali Communication', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header Section showing shop branding placeholder
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.indigo.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.indigo, width: 2),
                    ),
                    child: const Icon(Icons.star, color: Colors.indigo, size: 40), // Stamp logo location
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Waqar Ali Communication', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
                        Text('& Electronics', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        SizedBox(height: 4),
                        Text('WhatsApp: 0304-0235115', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(context, Icons.qr_code_scanner, 'POS Sale & Print', Colors.green, () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('POS Module with Stamp Logo Receipt Printing Template Loaded')));
                  }),
                  _buildMenuCard(context, Icons.inventory, 'Stock Manage\n(Barcode & Photo)', Colors.orange, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StockScreen()));
                  }),
                  _buildMenuCard(context, Icons.account_balance_wallet, 'Daily Sale & Udhaar', Colors.red, () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Udhaar Ledger & Daily Reports Active')));
                  }),
                  _buildMenuCard(context, Icons.receipt_long, 'Utility Bills\nTrack', Colors.blue, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BillsScreen()));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, IconData icon, String title, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
