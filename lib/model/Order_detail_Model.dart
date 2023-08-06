class Order_detail_Model {
  int? status;
  Data? data;

  Order_detail_Model({this.status, this.data});

  Order_detail_Model.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? bidAmount;
  String? discountAmount;
  String? orderAddedAmount;
  String? trackingID;
  String? orderStorageId;
  String? userId;
  String? orderStatus;
  String? orderType;
  String? slug;
  dynamic description;
  String? bookingFirstLastName;
  String? bookigEmail;
  String? bookingPhone;
  String? pickupPostal;
  String? pickupAddress;
  dynamic pickupName;
  dynamic pickupPhone;
  String? deliveryPostal;
  dynamic deliveryPostcode;
  dynamic pickupPostcode;
  String? deliveryAddress;
  dynamic deliveryName;
  String? deliveryPhone;
  String? pickupAddressLine1;
  dynamic pickupAddressLine2;
  String? pickupCity;
  dynamic pickupCountry;
  dynamic deliveryAddressLine1;
  dynamic deliveryAddressLine2;
  String? deliveryCity;
  dynamic deliveryCountry;
  dynamic pickupPhone1;
  dynamic deliveryPhone1;
  String? parentSlug;
  String? persons;
  String? km;
  String? total;
  String? productsList;
  String? oldProductsList;
  String? productVolume;
  String? price;
  String? orderPrice;
  String? cubicMeterPrice;
  dynamic extraServicesPrice;
  String? orderOldPrice;
  String? strtTime;
  String? endTime;
  String? orderDate;
  String? createdAt;
  String? updatedAt;
  dynamic q1;
  dynamic q2;
  dynamic q3;
  dynamic q4;
  dynamic q5;
  dynamic q6;
  dynamic q7;
  dynamic q8;
  String? chargeExtra;
  String? inquiryEmail;
  String? inquiryMobile;
  dynamic hear;
  dynamic deliveryInstructions;
  String? status;
  dynamic paymentTrackingID;
  dynamic paymentDescription;
  String? jobStatus;
  dynamic reason;
  String? pickupLatitude;
  String? pickupLongitude;
  String? dropLatitude;
  String? dropLongitude;
  dynamic pickupLocation1;
  dynamic pickupLocation2;
  dynamic dropLocation1;
  dynamic dropLocation2;
  dynamic dropCity;
  dynamic dropCountry;
  dynamic orderPickupPhone1;
  dynamic orderDropPhone1;
  dynamic signature;
  dynamic signaturePath;
  String? name;
  String? email;
  String? phone;
  dynamic avatar;

  Data(
      {this.id,
      this.bidAmount,
      this.discountAmount,
      this.orderAddedAmount,
      this.trackingID,
      this.orderStorageId,
      this.userId,
      this.orderStatus,
      this.orderType,
      this.slug,
      this.description,
      this.bookingFirstLastName,
      this.bookigEmail,
      this.bookingPhone,
      this.pickupPostal,
      this.pickupAddress,
      this.pickupName,
      this.pickupPhone,
      this.deliveryPostal,
      this.deliveryPostcode,
      this.pickupPostcode,
      this.deliveryAddress,
      this.deliveryName,
      this.deliveryPhone,
      this.pickupAddressLine1,
      this.pickupAddressLine2,
      this.pickupCity,
      this.pickupCountry,
      this.deliveryAddressLine1,
      this.deliveryAddressLine2,
      this.deliveryCity,
      this.deliveryCountry,
      this.pickupPhone1,
      this.deliveryPhone1,
      this.parentSlug,
      this.persons,
      this.km,
      this.total,
      this.productsList,
      this.oldProductsList,
      this.productVolume,
      this.price,
      this.orderPrice,
      this.cubicMeterPrice,
      this.extraServicesPrice,
      this.orderOldPrice,
      this.strtTime,
      this.endTime,
      this.orderDate,
      this.createdAt,
      this.updatedAt,
      this.q1,
      this.q2,
      this.q3,
      this.q4,
      this.q5,
      this.q6,
      this.q7,
      this.q8,
      this.chargeExtra,
      this.inquiryEmail,
      this.inquiryMobile,
      this.hear,
      this.deliveryInstructions,
      this.status,
      this.paymentTrackingID,
      this.paymentDescription,
      this.jobStatus,
      this.reason,
      this.pickupLatitude,
      this.pickupLongitude,
      this.dropLatitude,
      this.dropLongitude,
      this.pickupLocation1,
      this.pickupLocation2,
      this.dropLocation1,
      this.dropLocation2,
      this.dropCity,
      this.dropCountry,
      this.orderPickupPhone1,
      this.orderDropPhone1,
      this.signature,
      this.signaturePath,
      this.name,
      this.email,
      this.phone,
      this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bidAmount = json['bid_amount'];
    discountAmount = json['discount_amount'];
    orderAddedAmount = json['order_added_amount'];
    trackingID = json['trackingID'];
    orderStorageId = json['order_storage_id'];
    userId = json['user_id'];
    orderStatus = json['order_status'];
    orderType = json['order_type'];
    slug = json['slug'];
    description = json['description'];
    bookingFirstLastName = json['booking_first_last_name'];
    bookigEmail = json['bookig_email'];
    bookingPhone = json['booking_phone'];
    pickupPostal = json['pickup_postal'];
    pickupAddress = json['pickup_address'];
    pickupName = json['pickup_name'];
    pickupPhone = json['pickup_phone'];
    deliveryPostal = json['delivery_postal'];
    deliveryPostcode = json['delivery_postcode'];
    pickupPostcode = json['pickup_postcode'];
    deliveryAddress = json['delivery_address'];
    deliveryName = json['delivery_name'];
    deliveryPhone = json['delivery_phone'];
    pickupAddressLine1 = json['pickup_address_line1'];
    pickupAddressLine2 = json['pickup_address_line2'];
    pickupCity = json['pickup_city'];
    pickupCountry = json['pickup_country'];
    deliveryAddressLine1 = json['delivery_address_line1'];
    deliveryAddressLine2 = json['delivery_address_line2'];
    deliveryCity = json['delivery_city'];
    deliveryCountry = json['delivery_country'];
    pickupPhone1 = json['pickup_phone1'];
    deliveryPhone1 = json['delivery_phone1'];
    parentSlug = json['parent_slug'];
    persons = json['persons'];
    km = json['km'];
    total = json['total'];
    productsList = json['products_list'];
    oldProductsList = json['old_products_list'];
    productVolume = json['product_volume'];
    price = json['price'];
    orderPrice = json['order_price'];
    cubicMeterPrice = json['cubic_meter_price'];
    extraServicesPrice = json['extra_services_price'];
    orderOldPrice = json['order_old_price'];
    strtTime = json['strt_time'];
    endTime = json['end_time'];
    orderDate = json['order_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    q1 = json['q1'];
    q2 = json['q2'];
    q3 = json['q3'];
    q4 = json['q4'];
    q5 = json['q5'];
    q6 = json['q6'];
    q7 = json['q7'];
    q8 = json['q8'];
    chargeExtra = json['charge_extra'];
    inquiryEmail = json['inquiry_email'];
    inquiryMobile = json['inquiry_mobile'];
    hear = json['hear'];
    deliveryInstructions = json['delivery_instructions'];
    status = json['status'];
    paymentTrackingID = json['payment_trackingID'];
    paymentDescription = json['payment_description'];
    jobStatus = json['job_status'];
    reason = json['reason'];
    pickupLatitude = json['pickup_latitude'];
    pickupLongitude = json['pickup_longitude'];
    dropLatitude = json['drop_latitude'];
    dropLongitude = json['drop_longitude'];
    pickupLocation1 = json['pickup_location1'];
    pickupLocation2 = json['pickup_location2'];
    dropLocation1 = json['drop_location1'];
    dropLocation2 = json['drop_location2'];
    dropCity = json['drop_city'];
    dropCountry = json['drop_country'];
    orderPickupPhone1 = json['order_pickup_phone1'];
    orderDropPhone1 = json['order_drop_phone1'];
    signature = json['signature'];
    signaturePath = json['signature_path'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bid_amount'] = this.bidAmount;
    data['discount_amount'] = this.discountAmount;
    data['order_added_amount'] = this.orderAddedAmount;
    data['trackingID'] = this.trackingID;
    data['order_storage_id'] = this.orderStorageId;
    data['user_id'] = this.userId;
    data['order_status'] = this.orderStatus;
    data['order_type'] = this.orderType;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['booking_first_last_name'] = this.bookingFirstLastName;
    data['bookig_email'] = this.bookigEmail;
    data['booking_phone'] = this.bookingPhone;
    data['pickup_postal'] = this.pickupPostal;
    data['pickup_address'] = this.pickupAddress;
    data['pickup_name'] = this.pickupName;
    data['pickup_phone'] = this.pickupPhone;
    data['delivery_postal'] = this.deliveryPostal;
    data['delivery_postcode'] = this.deliveryPostcode;
    data['pickup_postcode'] = this.pickupPostcode;
    data['delivery_address'] = this.deliveryAddress;
    data['delivery_name'] = this.deliveryName;
    data['delivery_phone'] = this.deliveryPhone;
    data['pickup_address_line1'] = this.pickupAddressLine1;
    data['pickup_address_line2'] = this.pickupAddressLine2;
    data['pickup_city'] = this.pickupCity;
    data['pickup_country'] = this.pickupCountry;
    data['delivery_address_line1'] = this.deliveryAddressLine1;
    data['delivery_address_line2'] = this.deliveryAddressLine2;
    data['delivery_city'] = this.deliveryCity;
    data['delivery_country'] = this.deliveryCountry;
    data['pickup_phone1'] = this.pickupPhone1;
    data['delivery_phone1'] = this.deliveryPhone1;
    data['parent_slug'] = this.parentSlug;
    data['persons'] = this.persons;
    data['km'] = this.km;
    data['total'] = this.total;
    data['products_list'] = this.productsList;
    data['old_products_list'] = this.oldProductsList;
    data['product_volume'] = this.productVolume;
    data['price'] = this.price;
    data['order_price'] = this.orderPrice;
    data['cubic_meter_price'] = this.cubicMeterPrice;
    data['extra_services_price'] = this.extraServicesPrice;
    data['order_old_price'] = this.orderOldPrice;
    data['strt_time'] = this.strtTime;
    data['end_time'] = this.endTime;
    data['order_date'] = this.orderDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['q1'] = this.q1;
    data['q2'] = this.q2;
    data['q3'] = this.q3;
    data['q4'] = this.q4;
    data['q5'] = this.q5;
    data['q6'] = this.q6;
    data['q7'] = this.q7;
    data['q8'] = this.q8;
    data['charge_extra'] = this.chargeExtra;
    data['inquiry_email'] = this.inquiryEmail;
    data['inquiry_mobile'] = this.inquiryMobile;
    data['hear'] = this.hear;
    data['delivery_instructions'] = this.deliveryInstructions;
    data['status'] = this.status;
    data['payment_trackingID'] = this.paymentTrackingID;
    data['payment_description'] = this.paymentDescription;
    data['job_status'] = this.jobStatus;
    data['reason'] = this.reason;
    data['pickup_latitude'] = this.pickupLatitude;
    data['pickup_longitude'] = this.pickupLongitude;
    data['drop_latitude'] = this.dropLatitude;
    data['drop_longitude'] = this.dropLongitude;
    data['pickup_location1'] = this.pickupLocation1;
    data['pickup_location2'] = this.pickupLocation2;
    data['drop_location1'] = this.dropLocation1;
    data['drop_location2'] = this.dropLocation2;
    data['drop_city'] = this.dropCity;
    data['drop_country'] = this.dropCountry;
    data['order_pickup_phone1'] = this.orderPickupPhone1;
    data['order_drop_phone1'] = this.orderDropPhone1;
    data['signature'] = this.signature;
    data['signature_path'] = this.signaturePath;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    return data;
  }
}
