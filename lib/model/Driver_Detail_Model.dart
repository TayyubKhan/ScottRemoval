class Driver_Detail_List_Model {
  int? status;
  Data? data;

  Driver_Detail_List_Model({this.status, this.data});

  Driver_Detail_List_Model.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? phoneNumber;
  String? email;
  String? city;
  String? country;
  String? postCode;
  String? homeAddress;
  String? bussinessName;
  String? businessDescription;
  String? photo;
  Null? vanPhoto;
  String? addressLine2;
  String? nonUkAddressLine1;
  String? nonUkAddressLine2;
  String? nonUkAddressCity;
  String? nonUkAddressCountry;
  String? seperateBussinessAddr;
  String? nonUkBussinessAddressLine1;
  String? nonUkBussinessAddressLine2;
  String? nonUkBussinessAddressCity;
  String? nonUkBussinessAddressCountry;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.userName,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.phoneNumber,
      this.email,
      this.city,
      this.country,
      this.postCode,
      this.homeAddress,
      this.bussinessName,
      this.businessDescription,
      this.photo,
      this.vanPhoto,
      this.addressLine2,
      this.nonUkAddressLine1,
      this.nonUkAddressLine2,
      this.nonUkAddressCity,
      this.nonUkAddressCountry,
      this.seperateBussinessAddr,
      this.nonUkBussinessAddressLine1,
      this.nonUkBussinessAddressLine2,
      this.nonUkBussinessAddressCity,
      this.nonUkBussinessAddressCountry,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    city = json['city'];
    country = json['country'];
    postCode = json['post_code'];
    homeAddress = json['home_address'];
    bussinessName = json['bussiness_name'];
    businessDescription = json['business_description'];
    photo = json['photo'];
    vanPhoto = json['van_photo'];
    addressLine2 = json['address_line2'];
    nonUkAddressLine1 = json['non_uk_address_line1'];
    nonUkAddressLine2 = json['non_uk_address_line2'];
    nonUkAddressCity = json['non_uk_address_city'];
    nonUkAddressCountry = json['non_uk_address_country'];
    seperateBussinessAddr = json['seperate_bussiness_addr'];
    nonUkBussinessAddressLine1 = json['non_uk_bussiness_address_line1'];
    nonUkBussinessAddressLine2 = json['non_uk_bussiness_address_line2'];
    nonUkBussinessAddressCity = json['non_uk_bussiness_address_city'];
    nonUkBussinessAddressCountry = json['non_uk_bussiness_address_country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_number'] = this.mobileNumber;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['city'] = this.city;
    data['country'] = this.country;
    data['post_code'] = this.postCode;
    data['home_address'] = this.homeAddress;
    data['bussiness_name'] = this.bussinessName;
    data['business_description'] = this.businessDescription;
    data['photo'] = this.photo;
    data['van_photo'] = this.vanPhoto;
    data['address_line2'] = this.addressLine2;
    data['non_uk_address_line1'] = this.nonUkAddressLine1;
    data['non_uk_address_line2'] = this.nonUkAddressLine2;
    data['non_uk_address_city'] = this.nonUkAddressCity;
    data['non_uk_address_country'] = this.nonUkAddressCountry;
    data['seperate_bussiness_addr'] = this.seperateBussinessAddr;
    data['non_uk_bussiness_address_line1'] = this.nonUkBussinessAddressLine1;
    data['non_uk_bussiness_address_line2'] = this.nonUkBussinessAddressLine2;
    data['non_uk_bussiness_address_city'] = this.nonUkBussinessAddressCity;
    data['non_uk_bussiness_address_country'] =
        this.nonUkBussinessAddressCountry;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
