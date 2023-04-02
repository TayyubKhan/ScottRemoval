class UserLogin_Model {
  int? status;
  String? msg;
  String? loginToken;
  DriverDetails? driverDetails;

  UserLogin_Model({this.status, this.msg, this.loginToken, this.driverDetails});

  UserLogin_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    loginToken = json['login_token'];
    driverDetails = json['driver_details'] != null
        ? new DriverDetails.fromJson(json['driver_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['login_token'] = this.loginToken;
    if (this.driverDetails != null) {
      data['driver_details'] = this.driverDetails!.toJson();
    }
    return data;
  }
}

class DriverDetails {
  String? id;
  String? firstName;
  String? lastName;
  String? bussinessName;
  String? businessDescription;
  String? photo;
  dynamic vanPhoto;
  String? companyType;
  String? userName;
  String? homeAddress;
  String? addressLine2;
  String? city;
  String? county;
  String? country;
  String? postCode;
  String? nonUkAddressLine1;
  String? nonUkAddressLine2;
  String? nonUkAddressCity;
  String? nonUkAddressCountry;
  String? seperateBussinessAddr;
  String? nonUkBussinessAddressLine1;
  String? nonUkBussinessAddressLine2;
  String? nonUkBussinessAddressCity;
  String? nonUkBussinessAddressCountry;
  String? email;
  String? password;
  String? mobileNumber;
  String? phoneNumber;
  String? bankAccountName;
  String? bankAccountNumber;
  String? bankSortCode;
  String? isVerified;
  String? chatId;
  String? roleId;
  String? driverParentId;
  String? goodsInTransitInsurance;
  String? cmrInsurance;
  String? goodsInTransitInsuranceAmount;
  String? cmrInsuranceAmount;
  String? paymentMethods;
  String? specializedIn;
  String? createdAt;
  String? updatedAt;
  String? enableBit;
  String? deleteBit;
  String? loginToken;

  DriverDetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.bussinessName,
      this.businessDescription,
      this.photo,
      this.vanPhoto,
      this.companyType,
      this.userName,
      this.homeAddress,
      this.addressLine2,
      this.city,
      this.county,
      this.country,
      this.postCode,
      this.nonUkAddressLine1,
      this.nonUkAddressLine2,
      this.nonUkAddressCity,
      this.nonUkAddressCountry,
      this.seperateBussinessAddr,
      this.nonUkBussinessAddressLine1,
      this.nonUkBussinessAddressLine2,
      this.nonUkBussinessAddressCity,
      this.nonUkBussinessAddressCountry,
      this.email,
      this.password,
      this.mobileNumber,
      this.phoneNumber,
      this.bankAccountName,
      this.bankAccountNumber,
      this.bankSortCode,
      this.isVerified,
      this.chatId,
      this.roleId,
      this.driverParentId,
      this.goodsInTransitInsurance,
      this.cmrInsurance,
      this.goodsInTransitInsuranceAmount,
      this.cmrInsuranceAmount,
      this.paymentMethods,
      this.specializedIn,
      this.createdAt,
      this.updatedAt,
      this.enableBit,
      this.deleteBit,
      this.loginToken});

  DriverDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    bussinessName = json['bussiness_name'];
    businessDescription = json['business_description'];
    photo = json['photo'];
    vanPhoto = json['van_photo'];
    companyType = json['company_type'];
    userName = json['user_name'];
    homeAddress = json['home_address'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    county = json['county'];
    country = json['country'];
    postCode = json['post_code'];
    nonUkAddressLine1 = json['non_uk_address_line1'];
    nonUkAddressLine2 = json['non_uk_address_line2'];
    nonUkAddressCity = json['non_uk_address_city'];
    nonUkAddressCountry = json['non_uk_address_country'];
    seperateBussinessAddr = json['seperate_bussiness_addr'];
    nonUkBussinessAddressLine1 = json['non_uk_bussiness_address_line1'];
    nonUkBussinessAddressLine2 = json['non_uk_bussiness_address_line2'];
    nonUkBussinessAddressCity = json['non_uk_bussiness_address_city'];
    nonUkBussinessAddressCountry = json['non_uk_bussiness_address_country'];
    email = json['email'];
    password = json['password'];
    mobileNumber = json['mobile_number'];
    phoneNumber = json['phone_number'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    bankSortCode = json['bank_sort_code'];
    isVerified = json['is_verified'];
    chatId = json['chat_id'];
    roleId = json['role_id'];
    driverParentId = json['driver_parent_id'];
    goodsInTransitInsurance = json['goods_in_transit_insurance'];
    cmrInsurance = json['cmr_insurance'];
    goodsInTransitInsuranceAmount = json['goods_in_transit_insurance_amount'];
    cmrInsuranceAmount = json['cmr_insurance_amount'];
    paymentMethods = json['payment_methods'];
    specializedIn = json['specialized_in'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    enableBit = json['enable_bit'];
    deleteBit = json['delete_bit'];
    loginToken = json['login_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['bussiness_name'] = this.bussinessName;
    data['business_description'] = this.businessDescription;
    data['photo'] = this.photo;
    data['van_photo'] = this.vanPhoto;
    data['company_type'] = this.companyType;
    data['user_name'] = this.userName;
    data['home_address'] = this.homeAddress;
    data['address_line2'] = this.addressLine2;
    data['city'] = this.city;
    data['county'] = this.county;
    data['country'] = this.country;
    data['post_code'] = this.postCode;
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
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile_number'] = this.mobileNumber;
    data['phone_number'] = this.phoneNumber;
    data['bank_account_name'] = this.bankAccountName;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_sort_code'] = this.bankSortCode;
    data['is_verified'] = this.isVerified;
    data['chat_id'] = this.chatId;
    data['role_id'] = this.roleId;
    data['driver_parent_id'] = this.driverParentId;
    data['goods_in_transit_insurance'] = this.goodsInTransitInsurance;
    data['cmr_insurance'] = this.cmrInsurance;
    data['goods_in_transit_insurance_amount'] =
        this.goodsInTransitInsuranceAmount;
    data['cmr_insurance_amount'] = this.cmrInsuranceAmount;
    data['payment_methods'] = this.paymentMethods;
    data['specialized_in'] = this.specializedIn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['enable_bit'] = this.enableBit;
    data['delete_bit'] = this.deleteBit;
    data['login_token'] = this.loginToken;
    return data;
  }
}
