class Waiver_Form_Model {
  int? status;

  Waiver_Form_Model({this.status});

  Waiver_Form_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
