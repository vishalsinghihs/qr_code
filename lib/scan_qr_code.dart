import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = 'Scanned data will be shown here';
  Future<void> scanQrCode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 
        'Cancel', 
        true, 
        ScanMode.QR 
      );

    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      qrResult = scanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code'), backgroundColor: Colors.amber,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Text(qrResult, style: const TextStyle(color: Colors.black),),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: scanQrCode,
              child: const Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
