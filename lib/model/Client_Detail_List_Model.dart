class Client_Detail_List_Model {
  bool? status;
  Data? data;

  Client_Detail_List_Model({this.status, this.data});

  Client_Detail_List_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  Null? username;
  String? email;
  String? createdOn;
  Null? lastLogin;
  Null? active;
  Null? company;
  String? phone;
  Null? avatar;
  Null? gender;

  Data(
      {this.name,
      this.username,
      this.email,
      this.createdOn,
      this.lastLogin,
      this.active,
      this.company,
      this.phone,
      this.avatar,
      this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    createdOn = json['created_on'];
    lastLogin = json['last_login'];
    active = json['active'];
    company = json['company'];
    phone = json['phone'];
    avatar = json['avatar'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['created_on'] = this.createdOn;
    data['last_login'] = this.lastLogin;
    data['active'] = this.active;
    data['company'] = this.company;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    return data;
  }
}
