class ProductModel {

  final String productName;
  final String type;
  final int price;
  int quantity;

  ProductModel({
    required this.productName,
    required this.type,
    required this.price,
    this.quantity = 1,
  });
}

final products = [
  ProductModel(
    productName: 'Product 1',
    type: 'Type 1',
    price: 100000,
  ),

  ProductModel(
    productName: 'Product 2',
    type: 'Type 2',
    price: 200000,
  ),
];