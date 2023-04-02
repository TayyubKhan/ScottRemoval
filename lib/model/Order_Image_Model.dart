class Order_Image_Model {
  int? status;
  String? baseUrl;
  List<Data>? data;

  Order_Image_Model({this.status, this.baseUrl, this.data});

  Order_Image_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    baseUrl = json['base_url'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['base_url'] = this.baseUrl;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? orderId;
  String? image;
  String? imagePath;

  Data({this.orderId, this.image, this.imagePath});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    image = json['image'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['image'] = this.image;
    data['image_path'] = this.imagePath;
    return data;
  }
}
