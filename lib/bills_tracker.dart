import 'package:flutter/material.dart';

class UtilityBillsScreen extends StatefulWidget {
  @override
  _UtilityBillsScreenState createState() => _UtilityBillsScreenState();
}

class _UtilityBillsScreenState extends State<UtilityBillsScreen> {
  List<Map<String, dynamic>> bills = [
    {'type': 'Gas Bill (SSGC)', 'amount': '3,450', 'dueDate': '05 Nov 2026', 'isPaid': false, 'icon': Icons.local_fire_department, 'color': Colors.orange},
    {'type': 'Electricity Bill', 'amount': '12,800', 'dueDate': '10 Nov 2026', 'isPaid': true, 'icon': Icons.electric_bolt, 'color': Colors.amber.shade800},
    {'type': 'StormFiber Internet', 'amount': '2,500', 'dueDate': '02 Nov 2026', 'isPaid': false, 'icon': Icons.wifi, 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    int unpaidCount = bills.where((b) => !b['isPaid']).length;
    return Scaffold(
      appBar: AppBar(title: Text('Utility Bills'), backgroundColor: Colors.blueGrey.shade900),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.blueGrey.shade50, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pending Bills to Pay:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  CircleAvatar(backgroundColor: Colors.red, radius: 14, child: Text('$unpaidCount', style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = bills[index];
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(backgroundColor: bill['color'].withOpacity(0.1), child: Icon(bill['icon'], color: bill['color'])),
                      title: Text(bill['type'], style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Due: ${bill['dueDate']}\nRs. ${bill['amount']}'),
                      trailing: IconButton(
                        icon: Icon(bill['isPaid'] ? Icons.check_circle : Icons.radio_button_unchecked, color: bill['isPaid'] ? Colors.green : Colors.grey, size: 30),
                        onPressed: () => setState(() => bill['isPaid'] = !bill['isPaid']),
                      ),
                    ),
                  );
