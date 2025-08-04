import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isYearly = false;

  // ❌ Unused variable (should be flagged)
  String unusedVariable = "This is not used";

  @override
  Widget build(BuildContext context) {
    final price = isYearly ? '₹999 / year' : '₹99 / month';

    // ❌ Improper formatting (missing const, unnecessary setState inside build)
    setState(() {}); // <- Should not be inside build method

    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscription"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: [!isYearly, isYearly],
              onPressed: (index) {
                setState(() {
                  isYearly = index == 1;
                });
              },
              borderRadius: BorderRadius.circular(10),
              selectedColor: Colors.white,
              fillColor: Colors.deepPurple,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Monthly"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Yearly"),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // ❌ Missing const before Text widget
                    Text(
                      isYearly ? "Pro Plan (Yearly)" : "Pro Plan (Monthly)",
                      style: TextStyle(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    featureRow("Unlimited access"),
                    featureRow("Priority support"),
                    featureRow("Ad-free experience"),
                    featureRow("Cancel anytime"),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Add your payment logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Proceeding to payment...")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Subscribe Now"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget featureRow(String text) {
    final text = "0";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
