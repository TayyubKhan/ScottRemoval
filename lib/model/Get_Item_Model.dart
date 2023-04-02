class Get_Item_Model {
  int? status;
  List<Floors>? floors;
  List<Items>? items;

  Get_Item_Model({this.status, this.floors, this.items});

  Get_Item_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['floors'] != null) {
      floors = <Floors>[];
      json['floors'].forEach((v) {
        floors!.add(new Floors.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.floors != null) {
      data['floors'] = this.floors!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Floors {
  String? id;
  String? name;
  String? liftOption;

  Floors({this.id, this.name, this.liftOption});

  Floors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    liftOption = json['lift_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lift_option'] = this.liftOption;
    return data;
  }
}

class Items {
  String? productId;
  String? name;
  String? image;
  String? details;
  String? volumeMeter;

  Items(
      {this.productId, this.name, this.image, this.details, this.volumeMeter});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    details = json['details'];
    volumeMeter = json['volume_meter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['details'] = this.details;
    data['volume_meter'] = this.volumeMeter;
    return data;
  }
}
