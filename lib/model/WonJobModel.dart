import 'package:freezed_annotation/freezed_annotation.dart';

part 'WonJobModel.freezed.dart';
part 'WonJobModel.g.dart';

@freezed
class WonJobModel with _$WonJobModel {
  factory WonJobModel({
    @JsonKey(name: 'status') dynamic status,
    @JsonKey(name: 'order_count') dynamic orderCount,
    @JsonKey(name: 'data') List<Data>? data,
  }) = _WonJobModel;

  factory WonJobModel.fromJson(Map<String, dynamic> json) => _$WonJobModelFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: 'id') dynamic id,
    @JsonKey(name: 'driver_id') dynamic driverId,
    @JsonKey(name: 'order_id') dynamic orderId,
    @JsonKey(name: 'order_amount') dynamic orderAmount,
    @JsonKey(name: 'admin_id') dynamic adminId,
    @JsonKey(name: 'cut_percentage') dynamic cutPercentage,
    @JsonKey(name: 'order_final_amount') dynamic orderFinalAmount,
    @JsonKey(name: 'status') dynamic status,
    @JsonKey(name: 'created_at') dynamic createdAt,
    @JsonKey(name: 'updated_at') dynamic updatedAt,
    @JsonKey(name: 'bid_amount') dynamic bidAmount,
    @JsonKey(name: 'discount_amount') dynamic discountAmount,
    @JsonKey(name: 'order_added_amount') dynamic orderAddedAmount,
    @JsonKey(name: 'trackingID') dynamic trackingID,
    @JsonKey(name: 'order_storage_id') dynamic orderStorageId,
    @JsonKey(name: 'user_id') dynamic userId,
    @JsonKey(name: 'order_status') dynamic orderStatus,
    @JsonKey(name: 'order_type') dynamic orderType,
    @JsonKey(name: 'slug') dynamic slug,
    @JsonKey(name: 'description') dynamic description,
    @JsonKey(name: 'booking_first_last_name') dynamic bookingFirstLastName,
    @JsonKey(name: 'bookig_email') dynamic bookigEmail,
    @JsonKey(name: 'booking_phone') dynamic bookingPhone,
    @JsonKey(name: 'pickup_postal') dynamic pickupPostal,
    @JsonKey(name: 'pickup_address') dynamic pickupAddress,
    @JsonKey(name: 'pickup_name') dynamic pickupName,
    @JsonKey(name: 'pickup_phone') dynamic pickupPhone,
    @JsonKey(name: 'delivery_postal') dynamic deliveryPostal,
    @JsonKey(name: 'delivery_postcode') dynamic deliveryPostcode,
    @JsonKey(name: 'pickup_postcode') dynamic pickupPostcode,
    @JsonKey(name: 'delivery_address') dynamic deliveryAddress,
    @JsonKey(name: 'delivery_name') dynamic deliveryName,
    @JsonKey(name: 'delivery_phone') dynamic deliveryPhone,
    @JsonKey(name: 'pickup_address_line1') dynamic pickupAddressLine1,
    @JsonKey(name: 'pickup_address_line2') dynamic pickupAddressLine2,
    @JsonKey(name: 'pickup_city') dynamic pickupCity,
    @JsonKey(name: 'pickup_country') dynamic pickupCountry,
    @JsonKey(name: 'delivery_address_line1') dynamic deliveryAddressLine1,
    @JsonKey(name: 'delivery_address_line2') dynamic deliveryAddressLine2,
    @JsonKey(name: 'delivery_city') dynamic deliveryCity,
    @JsonKey(name: 'delivery_country') dynamic deliveryCountry,
    @JsonKey(name: 'pickup_phone1') dynamic pickupPhone1,
    @JsonKey(name: 'delivery_phone1') dynamic deliveryPhone1,
    @JsonKey(name: 'parent_slug') dynamic parentSlug,
    @JsonKey(name: 'persons') dynamic persons,
    @JsonKey(name: 'km') dynamic km,
    @JsonKey(name: 'total') dynamic total,
    @JsonKey(name: 'products_list') dynamic productsList,
    @JsonKey(name: 'old_products_list') dynamic oldProductsList,
    @JsonKey(name: 'product_volume') dynamic productVolume,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'order_price') dynamic orderPrice,
    @JsonKey(name: 'cubic_meter_price') dynamic cubicMeterPrice,
    @JsonKey(name: 'extra_services_price') dynamic extraServicesPrice,
    @JsonKey(name: 'order_old_price') dynamic orderOldPrice,
    @JsonKey(name: 'strt_time') dynamic strtTime,
    @JsonKey(name: 'end_time') dynamic endTime,
    @JsonKey(name: 'order_date') dynamic orderDate,
    @JsonKey(name: 'q1') dynamic q1,
    @JsonKey(name: 'q2') dynamic q2,
    @JsonKey(name: 'q3') dynamic q3,
    @JsonKey(name: 'q4') dynamic q4,
    @JsonKey(name: 'q5') dynamic q5,
    @JsonKey(name: 'q6') dynamic q6,
    @JsonKey(name: 'q7') dynamic q7,
    @JsonKey(name: 'q8') dynamic q8,
    @JsonKey(name: 'charge_extra') dynamic chargeExtra,
    @JsonKey(name: 'inquiry_email') dynamic inquiryEmail,
    @JsonKey(name: 'inquiry_mobile') dynamic inquiryMobile,
    @JsonKey(name: 'hear') dynamic hear,
    @JsonKey(name: 'delivery_instructions') dynamic deliveryInstructions,
    @JsonKey(name: 'payment_trackingID') dynamic paymentTrackingID,
    @JsonKey(name: 'payment_description') dynamic paymentDescription,
    @JsonKey(name: 'job_status') dynamic jobStatus,
    @JsonKey(name: 'reason') dynamic reason,
    @JsonKey(name: 'pickup_latitude') dynamic pickupLatitude,
    @JsonKey(name: 'pickup_longitude') dynamic pickupLongitude,
    @JsonKey(name: 'drop_latitude') dynamic dropLatitude,
    @JsonKey(name: 'drop_longitude') dynamic dropLongitude,
    @JsonKey(name: 'pickup_location1') dynamic pickupLocation1,
    @JsonKey(name: 'pickup_location2') dynamic pickupLocation2,
    @JsonKey(name: 'drop_location1') dynamic dropLocation1,
    @JsonKey(name: 'drop_location2') dynamic dropLocation2,
    @JsonKey(name: 'drop_city') dynamic dropCity,
    @JsonKey(name: 'drop_country') dynamic dropCountry,
    @JsonKey(name: 'order_pickup_phone1') dynamic orderPickupPhone1,
    @JsonKey(name: 'order_drop_phone1') dynamic orderDropPhone1,
    @JsonKey(name: 'signature') dynamic signature,
    @JsonKey(name: 'signature_path') dynamic signaturePath,
    @JsonKey(name: 'pickup_status') dynamic pickupStatus,
    @JsonKey(name: 'drop_status') dynamic dropStatus,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
