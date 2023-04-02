class Slug_List_Model {
  int? status;

  Slug_List_Model({this.status});

  Slug_List_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
