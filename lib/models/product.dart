class Product {
  Product({
    this.id,
    this.title,
    this.shortTitle,
    this.coverImg,
    this.sellPrice,
    this.originalPrice,
    this.saleAmount,
    this.cateId,
    this.totalAmount,
    this.province,
    this.city,
    this.label,
    this.freePostageNum,
    this.freePostagePrice,
    this.disFreeAddress,
    this.postType,
    this.postTemplatePrice,
    this.ossUrl,
  });

  final int id;
  final String title;
  final String shortTitle;
  final int coverImg;
  final String sellPrice;
  final String originalPrice;
  final int saleAmount;
  final int cateId;
  final int totalAmount;
  final String province;
  final String city;
  final String label;
  final int freePostageNum;
  final String freePostagePrice;
  final String disFreeAddress;
  final int postType;
  final int postTemplatePrice;
  final String ossUrl;
}
