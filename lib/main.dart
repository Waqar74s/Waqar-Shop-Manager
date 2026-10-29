import 'package:flutter/material.dart';
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
