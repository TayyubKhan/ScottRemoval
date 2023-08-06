class WonJobModel {
  dynamic status;
  dynamic orderCount;
  List<Data>? data;

  WonJobModel({this.status, this.orderCount, this.data});

  WonJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderCount = json['order_count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['order_count'] = orderCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic driverId;
  dynamic orderId;
  dynamic orderAmount;
  dynamic adminId;
  dynamic cutPercentage;
  dynamic orderFinalAmount;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic bidAmount;
  dynamic discountAmount;
  dynamic orderAddedAmount;
  dynamic trackingID;
  dynamic orderStorageId;
  dynamic userId;
  dynamic orderStatus;
  dynamic orderType;
  dynamic slug;
  dynamic description;
  dynamic bookingFirstLastName;
  dynamic bookigEmail;
  dynamic bookingPhone;
  dynamic pickupPostal;
  dynamic pickupAddress;
  dynamic pickupName;
  dynamic pickupPhone;
  dynamic deliveryPostal;
  dynamic deliveryPostcode;
  dynamic pickupPostcode;
  dynamic deliveryAddress;
  dynamic deliveryName;
  dynamic deliveryPhone;
  dynamic pickupAddressLine1;
  dynamic pickupAddressLine2;
  dynamic pickupCity;
  dynamic pickupCountry;
  dynamic deliveryAddressLine1;
  dynamic deliveryAddressLine2;
  dynamic deliveryCity;
  dynamic deliveryCountry;
  dynamic pickupPhone1;
  dynamic deliveryPhone1;
  dynamic parentSlug;
  dynamic persons;
  dynamic km;
  dynamic total;
  dynamic productsList;
  dynamic oldProductsList;
  dynamic productVolume;
  dynamic price;
  dynamic orderPrice;
  dynamic cubicMeterPrice;
  dynamic extraServicesPrice;
  dynamic orderOldPrice;
  dynamic strtTime;
  dynamic endTime;
  dynamic orderDate;
  dynamic q1;
  dynamic q2;
  dynamic q3;
  dynamic q4;
  dynamic q5;
  dynamic q6;
  dynamic q7;
  dynamic q8;
  dynamic chargeExtra;
  dynamic inquiryEmail;
  dynamic inquiryMobile;
  dynamic hear;
  dynamic deliveryInstructions;
  dynamic paymentTrackingID;
  dynamic paymentDescription;
  dynamic jobStatus;
  dynamic reason;
  dynamic pickupLatitude;
  dynamic pickupLongitude;
  dynamic dropLatitude;
  dynamic dropLongitude;
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
  dynamic pickupStatus;
  dynamic dropStatus;

  Data(
      {this.id,
      this.driverId,
      this.orderId,
      this.orderAmount,
      this.adminId,
      this.cutPercentage,
      this.orderFinalAmount,
      this.status,
      this.createdAt,
      this.updatedAt,
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
      this.pickupStatus,
      this.dropStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    orderId = json['order_id'];
    orderAmount = json['order_amount'];
    adminId = json['admin_id'];
    cutPercentage = json['cut_percentage'];
    orderFinalAmount = json['order_final_amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    pickupStatus = json['pickup_status'];
    dropStatus = json['drop_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['driver_id'] = driverId;
    data['order_id'] = orderId;
    data['order_amount'] = orderAmount;
    data['admin_id'] = adminId;
    data['cut_percentage'] = cutPercentage;
    data['order_final_amount'] = orderFinalAmount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['bid_amount'] = bidAmount;
    data['discount_amount'] = discountAmount;
    data['order_added_amount'] = orderAddedAmount;
    data['trackingID'] = trackingID;
    data['order_storage_id'] = orderStorageId;
    data['user_id'] = userId;
    data['order_status'] = orderStatus;
    data['order_type'] = orderType;
    data['slug'] = slug;
    data['description'] = description;
    data['booking_first_last_name'] = bookingFirstLastName;
    data['bookig_email'] = bookigEmail;
    data['booking_phone'] = bookingPhone;
    data['pickup_postal'] = pickupPostal;
    data['pickup_address'] = pickupAddress;
    data['pickup_name'] = pickupName;
    data['pickup_phone'] = pickupPhone;
    data['delivery_postal'] = deliveryPostal;
    data['delivery_postcode'] = deliveryPostcode;
    data['pickup_postcode'] = pickupPostcode;
    data['delivery_address'] = deliveryAddress;
    data['delivery_name'] = deliveryName;
    data['delivery_phone'] = deliveryPhone;
    data['pickup_address_line1'] = pickupAddressLine1;
    data['pickup_address_line2'] = pickupAddressLine2;
    data['pickup_city'] = pickupCity;
    data['pickup_country'] = pickupCountry;
    data['delivery_address_line1'] = deliveryAddressLine1;
    data['delivery_address_line2'] = deliveryAddressLine2;
    data['delivery_city'] = deliveryCity;
    data['delivery_country'] = deliveryCountry;
    data['pickup_phone1'] = pickupPhone1;
    data['delivery_phone1'] = deliveryPhone1;
    data['parent_slug'] = parentSlug;
    data['persons'] = persons;
    data['km'] = km;
    data['total'] = total;
    data['products_list'] = productsList;
    data['old_products_list'] = oldProductsList;
    data['product_volume'] = productVolume;
    data['price'] = price;
    data['order_price'] = orderPrice;
    data['cubic_meter_price'] = cubicMeterPrice;
    data['extra_services_price'] = extraServicesPrice;
    data['order_old_price'] = orderOldPrice;
    data['strt_time'] = strtTime;
    data['end_time'] = endTime;
    data['order_date'] = orderDate;
    data['q1'] = q1;
    data['q2'] = q2;
    data['q3'] = q3;
    data['q4'] = q4;
    data['q5'] = q5;
    data['q6'] = q6;
    data['q7'] = q7;
    data['q8'] = q8;
    data['charge_extra'] = chargeExtra;
    data['inquiry_email'] = inquiryEmail;
    data['inquiry_mobile'] = inquiryMobile;
    data['hear'] = hear;
    data['delivery_instructions'] = deliveryInstructions;
    data['payment_trackingID'] = paymentTrackingID;
    data['payment_description'] = paymentDescription;
    data['job_status'] = jobStatus;
    data['reason'] = reason;
    data['pickup_latitude'] = pickupLatitude;
    data['pickup_longitude'] = pickupLongitude;
    data['drop_latitude'] = dropLatitude;
    data['drop_longitude'] = dropLongitude;
    data['pickup_location1'] = pickupLocation1;
    data['pickup_location2'] = pickupLocation2;
    data['drop_location1'] = dropLocation1;
    data['drop_location2'] = dropLocation2;
    data['drop_city'] = dropCity;
    data['drop_country'] = dropCountry;
    data['order_pickup_phone1'] = orderPickupPhone1;
    data['order_drop_phone1'] = orderDropPhone1;
    data['signature'] = signature;
    data['signature_path'] = signaturePath;
    data['pickup_status'] = pickupStatus;
    data['drop_status'] = dropStatus;
    return data;
  }
}
