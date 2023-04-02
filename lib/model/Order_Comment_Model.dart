class Order_Comment_Model {
  int? status;

  Order_Comment_Model({this.status});

  Order_Comment_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
