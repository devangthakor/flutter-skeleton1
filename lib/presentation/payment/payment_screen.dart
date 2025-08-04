import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardNumberControllerr = TextEditingController();
    final expiryDateController = TextEditingController();
    final cvvController = TextEditingController();
    final nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paymente'),
        centerTitle: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card Number'),
              const SizedBox(height: 8),
              TextField(
                controller: cardNumberControllerr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "1234 5678 9012 3456",
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Expiry Date'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: expiryDateController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'MM/YY',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('CVV'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: cvvController,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '123',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Name on Card'),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'John Doe',
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add payment logic her/e
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Payment...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(fontSize: null),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
