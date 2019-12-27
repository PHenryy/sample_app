import 'package:sample_app/models/banner.dart';

class ProductModel {
  int id;
  String title;
  String shortTitle;
  String sellPrice;
  String originalPrice;
  int cateId;
  int saleAmount;
  int totalAmount;
  String province;
  String city;
  List<String> label;
  int freePostageNum;
  String freePostagePrice;
  String disFreeAddress;
  int postType;
  int postTemplatePrice;
  List<String> standard;
  String content;
  List<BannerModel> banners;

  ProductModel(
      {this.id,
      this.title,
      this.shortTitle,
      this.sellPrice,
      this.originalPrice,
      this.cateId,
      this.saleAmount,
      this.totalAmount,
      this.province,
      this.city,
      this.label,
      this.freePostageNum,
      this.freePostagePrice,
      this.disFreeAddress,
      this.postType,
      this.postTemplatePrice,
      this.standard,
      this.content,
      this.banners});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortTitle = json['short_title'];
    sellPrice = json['sell_price'];
    originalPrice = json['original_price'];
    cateId = json['cate_id'];
    saleAmount = json['sale_amount'];
    totalAmount = json['total_amount'];
    province = json['province'];
    city = json['city'];
    label = json['label'].cast<String>();
    freePostageNum = json['free_postage_num'];
    freePostagePrice = json['free_postage_price'];
    disFreeAddress = json['dis_free_address'];
    postType = json['post_type'];
    postTemplatePrice = json['post_template_price'];
    if (json['standard'] != null) {
      standard = new List<String>();
      json['standard'].forEach((v) {
        standard.add(v);
      });
    }
    content = json['content'];
    if (json['banners'] != null) {
      banners = new List<BannerModel>();
      json['banners'].forEach((v) {
        banners.add(new BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_title'] = this.shortTitle;
    data['sell_price'] = this.sellPrice;
    data['original_price'] = this.originalPrice;
    data['cate_id'] = this.cateId;
    data['sale_amount'] = this.saleAmount;
    data['total_amount'] = this.totalAmount;
    data['province'] = this.province;
    data['city'] = this.city;
    data['label'] = this.label;
    data['free_postage_num'] = this.freePostageNum;
    data['free_postage_price'] = this.freePostagePrice;
    data['dis_free_address'] = this.disFreeAddress;
    data['post_type'] = this.postType;
    data['post_template_price'] = this.postTemplatePrice;
    if (this.standard != null) {
      data['standard'] = this.standard.toList();
    }
    data['content'] = this.content;
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
