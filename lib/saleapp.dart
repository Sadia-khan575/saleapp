import 'package:flutter/material.dart';

class SaleApp extends StatefulWidget {
  const SaleApp({super.key});

  @override
  State<SaleApp> createState() => _SaleAppState();
}

class _SaleAppState extends State<SaleApp> {
  TextEditingController dressQuantityController = TextEditingController();
  double perDressPrice = 2000.0;
  double totalPrice = 0.0;
  double priceWithoutTax = 0.0;
  double taxAmount = 0.0;
  double taxRate = 0.17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            int quantity = int.parse(dressQuantityController.text);

            if (quantity >= 10) {
              perDressPrice = 1500.0;
            } else {
              perDressPrice = 2000.0;
            }

            priceWithoutTax = quantity * perDressPrice;
            taxAmount = priceWithoutTax * taxRate;
            totalPrice = priceWithoutTax + taxAmount;

            setState(() {});
          },
          child: const Icon(
            Icons.calculate_sharp,
          ),
          backgroundColor: Colors.green,
        ),
        appBar: AppBar(
          title: const Text(
            'Sale App',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: dressQuantityController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Dress Quantity',
                    hintStyle: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20),
              Text('Per Dress Price: Rs. $perDressPrice',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
              Text('Price Without Tax: Rs. ${priceWithoutTax.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purpleAccent)),
              Text('Tax Amount (17%): Rs. ${taxAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
              Text('Total Price (including tax): Rs. ${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purpleAccent)),
            ],
          ),
        ));
  }
}

void main() {
  runApp(const MaterialApp(
    home: SaleApp(),
  ));
}
