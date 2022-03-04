import 'package:get/get.dart';
import 'package:getx_state_management/models/product_model.dart';

class ProductController extends GetxController {
  List<Product> productData = [];
  List<Product> cartItem = List<Product>.empty().obs;

  addtoCart(Product item) {
    cartItem.add(item);
  }

  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;

  @override
  void onInit() {
    super.onInit();
    fatchProductData();
  }

  fatchProductData() async {
    await Future.delayed(Duration(seconds: 2));
    List<Product> serverResponse = [
      Product(
        id: 1,
        productName: 'T-Shirt',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productDescription: 'some descroption',
        price: 300,
        favorite: false,
      ),
      Product(
        id: 1,
        productName: 'T-Shirt',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productDescription: 'some descroption',
        price: 449,
        favorite: false,
      ),
      Product(
        id: 1,
        productName: 'T-Shirt',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productDescription: 'some descroption',
        price: 600,
        favorite: false,
      ),
      Product(
        id: 2,
        productName: 'T-Shirt',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productDescription: 'some descroption',
        price: 699,
        favorite: false,
      ),
      Product(
        id: 3,
        productName: 'T-Shirt',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productDescription: 'some descroption',
        price: 799,
        favorite: false,
      )
    ];
    productData.addAll(serverResponse);
    print(productData);
    update();
  }
}
