import 'package:flutter/material.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({Key? key}) : super(key: key);

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  final List<Map<String, dynamic>> _bills = [
    {'title': 'SSGC Gas Bill', 'amount': 'Rs. 1,250', 'isPaid': false},
    {'title': 'Electricity Bill', 'amount': 'Rs. 8,400', 'isPaid': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utility Bills'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _bills.length,
        itemBuilder: (context, index) {
          final bill = _bills[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(bill['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Amount: \${bill['amount']}'),
              trailing: IconButton(
                icon: Icon(
                  bill['isPaid'] ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: bill['isPaid'] ? Colors.green : Colors.grey,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _bills[index]['isPaid'] = !_bills[index]['isPaid'];
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
