class CartItem {
  CartItem({
    this.thumbnail,
    this.title,
    this.price,
    this.isSelected = true,
    this.quantity = 1,
  });

  bool isSelected;
  int quantity;
  final String thumbnail;
  final String title;
  final double price;

  void toggleSelectStatus() {
    isSelected = !isSelected;
  }

  void setQuantity(int qtt) {
    quantity = qtt;
  }
}
