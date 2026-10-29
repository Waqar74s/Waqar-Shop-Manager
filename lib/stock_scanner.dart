import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StockScannerScreen extends StatefulWidget {
  @override
  _StockScannerScreenState createState() => _StockScannerScreenState();
}

class _StockScannerScreenState extends State<StockScannerScreen> {
  String scannedBarcode = "No Barcode Scanned Yet";
  File? productIcon;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Mobile Camera se Barcode Scan karne ka function
  void _openBarcodeScanner() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: MobileScanner(
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            if (barcodes.isNotEmpty) {
              setState(() {
                scannedBarcode = barcodes.first.rawValue ?? "Unknown Barcode";
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Barcode Scanned Successfully!')),
              );
            }
          },
        ),
      ),
    );
  }

  // Camera se Product ki Photo click karne ka function
  Future<void> _takeProductPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        productIcon = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Stock Item'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Photo Section
            Center(
              child: GestureDetector(
                onTap: _takeProductPhoto,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blueGrey.shade50,
                  backgroundImage: productIcon != null ? FileImage(productIcon!) : null,
                  child: productIcon == null
                      ? Icon(Icons.add_a_photo, size: 40, color: Colors.blueGrey)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 25),

            // 2. Barcode Scanning Button
            Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.qr_code_scanner, color: Colors.blue),
                title: Text('Product Barcode', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(scannedBarcode, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
                trailing: ElevatedButton(
                  onPressed: _openBarcodeScanner,
                  child: Text('Scan'),
                ),
              ),
            ),
            SizedBox(height: 20),

            // 3. Product Details Form
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Product Name (e.g., Tecno Battery, Charger)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sale Price (Rs.)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // 4. Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade900),
                onPressed: () {
                  // Yahan Firebase Database me data save karne ka logic aayega
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Saving ${_nameController.text} to Stock Book...')),
                  );
                },
                child: Text('Save Item to Inventory', style: TextStyle(color: Colors.white, fontSize: 16)),
