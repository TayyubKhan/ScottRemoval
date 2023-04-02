class Order_Signature_Model {
  int? status;

  Order_Signature_Model({this.status});

  Order_Signature_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
