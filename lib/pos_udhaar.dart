import 'package:flutter/material.dart';

class POSAndUdhaarScreen extends StatefulWidget {
  @override
  _POSAndUdhaarScreenState createState() => _POSAndUdhaarScreenState();
}

class _POSAndUdhaarScreenState extends State<POSAndUdhaarScreen> {
  List<Map<String, dynamic>> cartItems = [
    {'name': 'Tecno Camon 20 Pro Glass', 'price': 350, 'qty': 2},
    {'name': 'Fast Mobile Charger 18W', 'price': 850, 'qty': 1},
  ];

  double get totalAmount => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['qty']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POS Billing & Receipts'), backgroundColor: Colors.blueGrey.shade900),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)),
                child: Column(
                  children: [
                    Text('WAQAR ALI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1.5)),
                    Text('COMMUNICATION & ELECTRONICS', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                    Text('Contact: 0304-0235115', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    Divider(thickness: 1.5, height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('${item['qty']}x ${item['name']}'), Text('Rs. ${item['price'] * item['qty']}')],
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOTAL BILL:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('Rs. ${totalAmount.toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green)),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text('— Payment Received —', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.print, color: Colors.white),
                    label: Text('Print Thermal Bill', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Printing receipt via Bluetooth...'))),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.menu_book, color: Colors.white),
                    label: Text('Save to Udhaar', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved to Customer Khata Book!'))),
                  ),
                ),
              ],
