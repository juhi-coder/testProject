import 'package:flutter/material.dart';
import 'package:testProject/ui/views/home/products.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Products> products = [];
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void addProduct() {
    String name = nameController.text;
    double price = double.parse(priceController.text);
    Products newProduct = Products(product_name: name, product_price: price);
    setState(() {
      products.add(newProduct);
      nameController.clear();
      priceController.clear();
    });
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (Products product in products) {
      totalPrice += product.product_price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(8.0)),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 10,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Product Name'),
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 10,
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Selling Price'),
                  keyboardType: TextInputType.number,
                ),
              )),
              ElevatedButton(
                onPressed: addProduct,
                child: Text('Add Product'),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(
                          '${products[index].product_name}- \$${products[index].product_price.toStringAsFixed(2)}'),
                      trailing: ElevatedButton(
                          onPressed: () => deleteProduct(index),
                          child: Text('Delete')),
                    );
                  }))),
          Text('Total Price: \&&{getTotalPrice().toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
