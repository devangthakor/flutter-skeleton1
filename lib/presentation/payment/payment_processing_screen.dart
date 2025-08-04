import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() =>
      _payment_screen_state(); // ❌ Wrong naming convention
}

class _payment_screen_state extends State<PaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isProcessing = false;
  bool isSuccess = false;

  String hardCodedStatus = "waiting"; // ❌ Unused variable

  void _processPayment() {
    setState(() {
      isProcessing = true;
    });

    // ❌ Magic number, long callback
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        isProcessing = false;
        isSuccess = true;
      });
    });
  }

  void _reset() {
    setState(() {
      isProcessing = false;
      isSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isProcessing) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Processing your payment...'), // ❌ Hardcoded string
            ],
          ),
        ),
      );
    }

    if (isSuccess) {
      return Scaffold(
        backgroundColor: Colors.green[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 24),
              const Text(
                'Payment Successful!', // ❌ Hardcoded string
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _reset,
                child: const Text('Back to Payment'), // ❌ Hardcoded string
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'), // ❌ Hardcoded string
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // ❌ Magic number
        child: SingleChildScrollView(
          child: Column(
            children: [
              _fieldBuilder('Card Number', cardNumberController,
                  TextInputType.number, '1234 5678 9012 3456'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: _fieldBuilder('Expiry', expiryDateController,
                          TextInputType.datetime, 'MM/YY')),
                  const SizedBox(width: 16),
                  Expanded(
                      child: _fieldBuilder(
                          'CVV', cvvController, TextInputType.number, '123',
                          obscure: true)),
                ],
              ),
              const SizedBox(height: 16),
              _fieldBuilder('Name on Card', nameController, TextInputType.name,
                  'John Doe'),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _processPayment,
                  child: const Text('Pay Now',
                      style: TextStyle(fontSize: 18)), // ❌ Hardcoded string
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldBuilder(String label, TextEditingController controller,
      TextInputType type, String hint,
      {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: type,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
