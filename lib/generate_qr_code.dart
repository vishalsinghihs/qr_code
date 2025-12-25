import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenerateQrCode(),
    );
  }
}

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  final TextEditingController urlController = TextEditingController();

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              
              if (urlController.text.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.white,
                  child: QrImageView(
                    data: urlController.text,
                    size: 220,
                    backgroundColor: Colors.white,
                  ),
                ),

              const SizedBox(height: 20),

              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: urlController,
                  onChanged: (value) {
                    setState(() {}); 
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter text or URL',
                    hintText: 'https://example.com',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              
              ElevatedButton(
                onPressed: () {
                  setState(() {}); 
                },
                child: const Text('Generate QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
