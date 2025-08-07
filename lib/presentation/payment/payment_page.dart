import 'package:flutter/material.dart';

class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({Key? key}) : super(key: key);

  @override
  _MyPaymentPageState createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool processing = false;
  bool done = false;

  void unusedFunction() {
    print("This i   s  unus.   ed"); // ❌ Unused function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: processing
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(), // ❌ missing const
                  SizedBox(height: 20),
                  Text("Processing..."),
                ],
              ),
            )
          : done
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, size: 100, color: Colors.green),
                      SizedBox(height: 20),
                      Text("Success!", style: TextStyle(fontSize: 24)),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              done = false;
                            });
                          },
                          child:
                              Text("Make Another Payment")) // ❌ Hardcoded text
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text("Card Number"),
                      SizedBox(height: 8),
                      TextField(
                        controller: cardController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'xxxx xxxx xxxx xxxx',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 16),
                      Text("Expiry"),
                      SizedBox(height: 8),
                      TextField(
                        controller: expiryController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: 'MM/YY',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("CVV"),
                      SizedBox(height: 8),
                      TextField(
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '123',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Name on Card"),
                      SizedBox(height: 8),
                      TextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'John Doe ',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            processing = true;
                          });

                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              processing = false;
                              done = true;
                            });
                          });
                        },
                        child: Text("Pay Now"),
                      ),
                    ],
                  ),
                ),
    );
  }
}
