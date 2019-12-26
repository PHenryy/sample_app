class ProductListItem {
  int id;
  String title;
  String shortTitle;
  int coverImg;
  String sellPrice;
  String originalPrice;
  int saleAmount;
  int cateId;
  int totalAmount;
  String province;
  String city;
  String label;
  int freePostageNum;
  String freePostagePrice;
  String disFreeAddress;
  int postType;
  int postTemplatePrice;
  String ossUrl;

  ProductListItem({
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

  ProductListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortTitle = json['short_title'];
    coverImg = json['cover_img'];
    sellPrice = json['sell_price'];
    originalPrice = json['original_price'];
    saleAmount = json['sale_amount'];
    cateId = json['cate_id'];
    totalAmount = json['total_amount'];
    province = json['province'];
    city = json['city'];
    label = json['label'];
    freePostageNum = json['free_postage_num'];
    freePostagePrice = json['free_postage_price'];
    disFreeAddress = json['dis_free_address'];
    postType = json['post_type'];
    postTemplatePrice = json['post_template_price'];
    ossUrl = json['oss_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_title'] = this.shortTitle;
    data['cover_img'] = this.coverImg;
    data['sell_price'] = this.sellPrice;
    data['original_price'] = this.originalPrice;
    data['sale_amount'] = this.saleAmount;
    data['cate_id'] = this.cateId;
    data['total_amount'] = this.totalAmount;
    data['province'] = this.province;
    data['city'] = this.city;
    data['label'] = this.label;
    data['free_postage_num'] = this.freePostageNum;
    data['free_postage_price'] = this.freePostagePrice;
    data['dis_free_address'] = this.disFreeAddress;
    data['post_type'] = this.postType;
    data['post_template_price'] = this.postTemplatePrice;
    data['oss_url'] = this.ossUrl;
    return data;
  }
}
