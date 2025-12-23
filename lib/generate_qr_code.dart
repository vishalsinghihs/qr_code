import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {

  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generate QR Code'), backgroundColor: Colors.amber,),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlController.text.isNotEmpty)...[
               QrImageView(data: urlController.text, size: 200,),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.only(left: 8, right:8),


                  color: Colors.white,
                  child: TextField(controller: urlController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Enter data to generate QR code',
                ),
                ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  setState(() {
                    
                  });
                }, child: const Text('Generate QR Code')),
                const SizedBox(height: 20),

                // ✅ Only show QR after input
                if (urlController.text.isNotEmpty)
                  QrImageView(
                    data: urlController.text,
                    size: 200,
                    backgroundColor: Colors.white,
                  ),
              ]
            ],
          ),
        )
      ),
    );
  }
}