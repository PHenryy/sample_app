class BannerModel {
  int id;
  int img;
  int gId;
  int type;
  int status;
  String ossUrl;

  BannerModel({
    this.id,
    this.img,
    this.gId,
    this.type,
    this.status,
    this.ossUrl,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    gId = json['g_id'];
    type = json['type'];
    status = json['status'];
    ossUrl = json['oss_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['g_id'] = this.gId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['oss_url'] = this.ossUrl;
    return data;
  }
}
