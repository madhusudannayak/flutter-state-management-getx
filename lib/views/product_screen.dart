import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controllers/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final productController = Get.put(ProductController());

  //ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Product List"),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                label: GetX<ProductController>(
                  builder: (controller) =>
                      Text(productController.count.toString()),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(
              builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: Image.asset(
                                productController
                                    .productData[index].productImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price : " +
                                        productController
                                            .productData[index].price
                                            .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        productController.addtoCart(
                                            productController
                                                .productData[index]);
                                      },
                                      child: const Text(
                                        'Add to Card',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: productController.productData.length,
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetX<ProductController>(
              builder: (controller) => Text(
                    "Total Amount : ${productController.totalPrice}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
