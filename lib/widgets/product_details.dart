import 'package:flutter/material.dart'; 
import 'package:crumbitez/models/product_entry.dart'; 

class ProductDetailsPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name), 
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context), 
          ),
        ], // Widget[]
      ), // AppBar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Price: ${product.fields.price}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Quantity: ${product.fields.quantity}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}