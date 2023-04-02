class Product_Price_Model {
  int? status;
  Price? price;

  Product_Price_Model({this.status, this.price});

  Product_Price_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class Price {
  String? productId;
  String? price;

  Price({this.productId, this.price});

  Price.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['price'] = this.price;
    return data;
  }
}
