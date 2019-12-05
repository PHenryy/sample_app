import 'package:scoped_model/scoped_model.dart';
import './cart_item.dart';

class CartModel extends Model {
  List<CartItem> _cartList = [
    CartItem(
      thumbnail: 'assets/images/i1.jpg',
      title: '敏感肌日常修护系列产品（冻冻冻冻冻冻）',
      price: 198.00,
      isSelected: false,
    ),
    CartItem(
      thumbnail: 'assets/images/i1.jpg',
      title: '敏感肌日常修护系列产品（冻冻冻冻冻冻）',
      price: 198.00,
    ),
    CartItem(
      thumbnail: 'assets/images/i1.jpg',
      title: '敏感肌日常修护系列产品（冻冻冻冻冻冻）',
      price: 198.00,
    ),
    CartItem(
      thumbnail: 'assets/images/i1.jpg',
      title: '敏感肌日常修护系列产品（冻冻冻冻冻冻）',
      price: 198.00,
    ),
    CartItem(
      thumbnail: 'assets/images/i1.jpg',
      title: '敏感肌日常修护系列产品（冻冻冻冻冻冻）',
      price: 198.00,
    ),
    CartItem(
      thumbnail: 'assets/images/i1.jpg',
      title: '敏感肌日常修护系列产品（冻冻冻冻冻冻）',
      price: 198.00,
    ),
  ];

  double totalPrice;

  CartModel() : super() {
    totalPrice = _cartList
        .where((item) => item.isSelected)
        .fold(0, (p, e) => p + e.price);
  }

  List<CartItem> get cartList => _cartList;

  void selectAll() {
    _cartList = _cartList.map((item) {
      item.isSelected = true;
      return item;
    }).toList();

    notifyListeners();
  }

  void unSelectAll() {
    _cartList = _cartList.map((item) {
      item.isSelected = false;
      return item;
    }).toList();

    notifyListeners();
  }

  void caculateTotalPrice() {
    totalPrice = _cartList
        .where((item) => item.isSelected)
        .fold(0, (p, e) => p + (e.price * e.quantity));
    notifyListeners();
  }
}
