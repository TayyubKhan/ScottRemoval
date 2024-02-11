// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'WonJobModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WonJobModel _$WonJobModelFromJson(Map<String, dynamic> json) {
  return _WonJobModel.fromJson(json);
}

/// @nodoc
mixin _$WonJobModel {
  @JsonKey(name: 'status')
  dynamic get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_count')
  dynamic get orderCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<Data>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WonJobModelCopyWith<WonJobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WonJobModelCopyWith<$Res> {
  factory $WonJobModelCopyWith(
          WonJobModel value, $Res Function(WonJobModel) then) =
      _$WonJobModelCopyWithImpl<$Res, WonJobModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') dynamic status,
      @JsonKey(name: 'order_count') dynamic orderCount,
      @JsonKey(name: 'data') List<Data>? data});
}

/// @nodoc
class _$WonJobModelCopyWithImpl<$Res, $Val extends WonJobModel>
    implements $WonJobModelCopyWith<$Res> {
  _$WonJobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? orderCount = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderCount: freezed == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WonJobModelImplCopyWith<$Res>
    implements $WonJobModelCopyWith<$Res> {
  factory _$$WonJobModelImplCopyWith(
          _$WonJobModelImpl value, $Res Function(_$WonJobModelImpl) then) =
      __$$WonJobModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') dynamic status,
      @JsonKey(name: 'order_count') dynamic orderCount,
      @JsonKey(name: 'data') List<Data>? data});
}

/// @nodoc
class __$$WonJobModelImplCopyWithImpl<$Res>
    extends _$WonJobModelCopyWithImpl<$Res, _$WonJobModelImpl>
    implements _$$WonJobModelImplCopyWith<$Res> {
  __$$WonJobModelImplCopyWithImpl(
      _$WonJobModelImpl _value, $Res Function(_$WonJobModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? orderCount = freezed,
    Object? data = freezed,
  }) {
    return _then(_$WonJobModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderCount: freezed == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WonJobModelImpl implements _WonJobModel {
  _$WonJobModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'order_count') this.orderCount,
      @JsonKey(name: 'data') final List<Data>? data})
      : _data = data;

  factory _$WonJobModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WonJobModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final dynamic status;
  @override
  @JsonKey(name: 'order_count')
  final dynamic orderCount;
  final List<Data>? _data;
  @override
  @JsonKey(name: 'data')
  List<Data>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WonJobModel(status: $status, orderCount: $orderCount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WonJobModelImpl &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.orderCount, orderCount) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(orderCount),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WonJobModelImplCopyWith<_$WonJobModelImpl> get copyWith =>
      __$$WonJobModelImplCopyWithImpl<_$WonJobModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WonJobModelImplToJson(
      this,
    );
  }
}

abstract class _WonJobModel implements WonJobModel {
  factory _WonJobModel(
      {@JsonKey(name: 'status') final dynamic status,
      @JsonKey(name: 'order_count') final dynamic orderCount,
      @JsonKey(name: 'data') final List<Data>? data}) = _$WonJobModelImpl;

  factory _WonJobModel.fromJson(Map<String, dynamic> json) =
      _$WonJobModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  dynamic get status;
  @override
  @JsonKey(name: 'order_count')
  dynamic get orderCount;
  @override
  @JsonKey(name: 'data')
  List<Data>? get data;
  @override
  @JsonKey(ignore: true)
  _$$WonJobModelImplCopyWith<_$WonJobModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'id')
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  dynamic get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  dynamic get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_amount')
  dynamic get orderAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_id')
  dynamic get adminId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cut_percentage')
  dynamic get cutPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_final_amount')
  dynamic get orderFinalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  dynamic get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  dynamic get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  dynamic get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'bid_amount')
  dynamic get bidAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  dynamic get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_added_amount')
  dynamic get orderAddedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'trackingID')
  dynamic get trackingID => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_storage_id')
  dynamic get orderStorageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  dynamic get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  dynamic get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_type')
  dynamic get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  dynamic get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  dynamic get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_first_last_name')
  dynamic get bookingFirstLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookig_email')
  dynamic get bookigEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_phone')
  dynamic get bookingPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_postal')
  dynamic get pickupPostal => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_address')
  dynamic get pickupAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_name')
  dynamic get pickupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_phone')
  dynamic get pickupPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_postal')
  dynamic get deliveryPostal => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_postcode')
  dynamic get deliveryPostcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_postcode')
  dynamic get pickupPostcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  dynamic get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_name')
  dynamic get deliveryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_phone')
  dynamic get deliveryPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_address_line1')
  dynamic get pickupAddressLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_address_line2')
  dynamic get pickupAddressLine2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_city')
  dynamic get pickupCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_country')
  dynamic get pickupCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address_line1')
  dynamic get deliveryAddressLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address_line2')
  dynamic get deliveryAddressLine2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_city')
  dynamic get deliveryCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_country')
  dynamic get deliveryCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_phone1')
  dynamic get pickupPhone1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_phone1')
  dynamic get deliveryPhone1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_slug')
  dynamic get parentSlug => throw _privateConstructorUsedError;
  @JsonKey(name: 'persons')
  dynamic get persons => throw _privateConstructorUsedError;
  @JsonKey(name: 'km')
  dynamic get km => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  dynamic get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'products_list')
  dynamic get productsList => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_products_list')
  dynamic get oldProductsList => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_volume')
  dynamic get productVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  dynamic get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_price')
  dynamic get orderPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'cubic_meter_price')
  dynamic get cubicMeterPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra_services_price')
  dynamic get extraServicesPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_old_price')
  dynamic get orderOldPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'strt_time')
  dynamic get strtTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  dynamic get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  dynamic get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'q1')
  dynamic get q1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'q2')
  dynamic get q2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'q3')
  dynamic get q3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'q4')
  dynamic get q4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'q5')
  dynamic get q5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'q6')
  dynamic get q6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'q7')
  dynamic get q7 => throw _privateConstructorUsedError;
  @JsonKey(name: 'q8')
  dynamic get q8 => throw _privateConstructorUsedError;
  @JsonKey(name: 'charge_extra')
  dynamic get chargeExtra => throw _privateConstructorUsedError;
  @JsonKey(name: 'inquiry_email')
  dynamic get inquiryEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'inquiry_mobile')
  dynamic get inquiryMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'hear')
  dynamic get hear => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_instructions')
  dynamic get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_trackingID')
  dynamic get paymentTrackingID => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_description')
  dynamic get paymentDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_status')
  dynamic get jobStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  dynamic get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_latitude')
  dynamic get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_longitude')
  dynamic get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_latitude')
  dynamic get dropLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_longitude')
  dynamic get dropLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_location1')
  dynamic get pickupLocation1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_location2')
  dynamic get pickupLocation2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_location1')
  dynamic get dropLocation1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_location2')
  dynamic get dropLocation2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_city')
  dynamic get dropCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_country')
  dynamic get dropCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_pickup_phone1')
  dynamic get orderPickupPhone1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_drop_phone1')
  dynamic get orderDropPhone1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'signature')
  dynamic get signature => throw _privateConstructorUsedError;
  @JsonKey(name: 'signature_path')
  dynamic get signaturePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_status')
  dynamic get pickupStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_status')
  dynamic get dropStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') dynamic id,
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
      @JsonKey(name: 'drop_status') dynamic dropStatus});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? driverId = freezed,
    Object? orderId = freezed,
    Object? orderAmount = freezed,
    Object? adminId = freezed,
    Object? cutPercentage = freezed,
    Object? orderFinalAmount = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? bidAmount = freezed,
    Object? discountAmount = freezed,
    Object? orderAddedAmount = freezed,
    Object? trackingID = freezed,
    Object? orderStorageId = freezed,
    Object? userId = freezed,
    Object? orderStatus = freezed,
    Object? orderType = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? bookingFirstLastName = freezed,
    Object? bookigEmail = freezed,
    Object? bookingPhone = freezed,
    Object? pickupPostal = freezed,
    Object? pickupAddress = freezed,
    Object? pickupName = freezed,
    Object? pickupPhone = freezed,
    Object? deliveryPostal = freezed,
    Object? deliveryPostcode = freezed,
    Object? pickupPostcode = freezed,
    Object? deliveryAddress = freezed,
    Object? deliveryName = freezed,
    Object? deliveryPhone = freezed,
    Object? pickupAddressLine1 = freezed,
    Object? pickupAddressLine2 = freezed,
    Object? pickupCity = freezed,
    Object? pickupCountry = freezed,
    Object? deliveryAddressLine1 = freezed,
    Object? deliveryAddressLine2 = freezed,
    Object? deliveryCity = freezed,
    Object? deliveryCountry = freezed,
    Object? pickupPhone1 = freezed,
    Object? deliveryPhone1 = freezed,
    Object? parentSlug = freezed,
    Object? persons = freezed,
    Object? km = freezed,
    Object? total = freezed,
    Object? productsList = freezed,
    Object? oldProductsList = freezed,
    Object? productVolume = freezed,
    Object? price = freezed,
    Object? orderPrice = freezed,
    Object? cubicMeterPrice = freezed,
    Object? extraServicesPrice = freezed,
    Object? orderOldPrice = freezed,
    Object? strtTime = freezed,
    Object? endTime = freezed,
    Object? orderDate = freezed,
    Object? q1 = freezed,
    Object? q2 = freezed,
    Object? q3 = freezed,
    Object? q4 = freezed,
    Object? q5 = freezed,
    Object? q6 = freezed,
    Object? q7 = freezed,
    Object? q8 = freezed,
    Object? chargeExtra = freezed,
    Object? inquiryEmail = freezed,
    Object? inquiryMobile = freezed,
    Object? hear = freezed,
    Object? deliveryInstructions = freezed,
    Object? paymentTrackingID = freezed,
    Object? paymentDescription = freezed,
    Object? jobStatus = freezed,
    Object? reason = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? dropLatitude = freezed,
    Object? dropLongitude = freezed,
    Object? pickupLocation1 = freezed,
    Object? pickupLocation2 = freezed,
    Object? dropLocation1 = freezed,
    Object? dropLocation2 = freezed,
    Object? dropCity = freezed,
    Object? dropCountry = freezed,
    Object? orderPickupPhone1 = freezed,
    Object? orderDropPhone1 = freezed,
    Object? signature = freezed,
    Object? signaturePath = freezed,
    Object? pickupStatus = freezed,
    Object? dropStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderAmount: freezed == orderAmount
          ? _value.orderAmount
          : orderAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      adminId: freezed == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cutPercentage: freezed == cutPercentage
          ? _value.cutPercentage
          : cutPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderFinalAmount: freezed == orderFinalAmount
          ? _value.orderFinalAmount
          : orderFinalAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bidAmount: freezed == bidAmount
          ? _value.bidAmount
          : bidAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderAddedAmount: freezed == orderAddedAmount
          ? _value.orderAddedAmount
          : orderAddedAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trackingID: freezed == trackingID
          ? _value.trackingID
          : trackingID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderStorageId: freezed == orderStorageId
          ? _value.orderStorageId
          : orderStorageId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookingFirstLastName: freezed == bookingFirstLastName
          ? _value.bookingFirstLastName
          : bookingFirstLastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookigEmail: freezed == bookigEmail
          ? _value.bookigEmail
          : bookigEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookingPhone: freezed == bookingPhone
          ? _value.bookingPhone
          : bookingPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPostal: freezed == pickupPostal
          ? _value.pickupPostal
          : pickupPostal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupName: freezed == pickupName
          ? _value.pickupName
          : pickupName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPhone: freezed == pickupPhone
          ? _value.pickupPhone
          : pickupPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPostal: freezed == deliveryPostal
          ? _value.deliveryPostal
          : deliveryPostal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPostcode: freezed == deliveryPostcode
          ? _value.deliveryPostcode
          : deliveryPostcode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPostcode: freezed == pickupPostcode
          ? _value.pickupPostcode
          : pickupPostcode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryName: freezed == deliveryName
          ? _value.deliveryName
          : deliveryName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPhone: freezed == deliveryPhone
          ? _value.deliveryPhone
          : deliveryPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupAddressLine1: freezed == pickupAddressLine1
          ? _value.pickupAddressLine1
          : pickupAddressLine1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupAddressLine2: freezed == pickupAddressLine2
          ? _value.pickupAddressLine2
          : pickupAddressLine2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupCity: freezed == pickupCity
          ? _value.pickupCity
          : pickupCity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupCountry: freezed == pickupCountry
          ? _value.pickupCountry
          : pickupCountry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryAddressLine1: freezed == deliveryAddressLine1
          ? _value.deliveryAddressLine1
          : deliveryAddressLine1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryAddressLine2: freezed == deliveryAddressLine2
          ? _value.deliveryAddressLine2
          : deliveryAddressLine2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryCity: freezed == deliveryCity
          ? _value.deliveryCity
          : deliveryCity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryCountry: freezed == deliveryCountry
          ? _value.deliveryCountry
          : deliveryCountry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPhone1: freezed == pickupPhone1
          ? _value.pickupPhone1
          : pickupPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPhone1: freezed == deliveryPhone1
          ? _value.deliveryPhone1
          : deliveryPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      parentSlug: freezed == parentSlug
          ? _value.parentSlug
          : parentSlug // ignore: cast_nullable_to_non_nullable
              as dynamic,
      persons: freezed == persons
          ? _value.persons
          : persons // ignore: cast_nullable_to_non_nullable
              as dynamic,
      km: freezed == km
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as dynamic,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productsList: freezed == productsList
          ? _value.productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      oldProductsList: freezed == oldProductsList
          ? _value.oldProductsList
          : oldProductsList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productVolume: freezed == productVolume
          ? _value.productVolume
          : productVolume // ignore: cast_nullable_to_non_nullable
              as dynamic,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderPrice: freezed == orderPrice
          ? _value.orderPrice
          : orderPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cubicMeterPrice: freezed == cubicMeterPrice
          ? _value.cubicMeterPrice
          : cubicMeterPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      extraServicesPrice: freezed == extraServicesPrice
          ? _value.extraServicesPrice
          : extraServicesPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderOldPrice: freezed == orderOldPrice
          ? _value.orderOldPrice
          : orderOldPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      strtTime: freezed == strtTime
          ? _value.strtTime
          : strtTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q1: freezed == q1
          ? _value.q1
          : q1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q2: freezed == q2
          ? _value.q2
          : q2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q3: freezed == q3
          ? _value.q3
          : q3 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q4: freezed == q4
          ? _value.q4
          : q4 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q5: freezed == q5
          ? _value.q5
          : q5 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q6: freezed == q6
          ? _value.q6
          : q6 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q7: freezed == q7
          ? _value.q7
          : q7 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q8: freezed == q8
          ? _value.q8
          : q8 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chargeExtra: freezed == chargeExtra
          ? _value.chargeExtra
          : chargeExtra // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inquiryEmail: freezed == inquiryEmail
          ? _value.inquiryEmail
          : inquiryEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inquiryMobile: freezed == inquiryMobile
          ? _value.inquiryMobile
          : inquiryMobile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hear: freezed == hear
          ? _value.hear
          : hear // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentTrackingID: freezed == paymentTrackingID
          ? _value.paymentTrackingID
          : paymentTrackingID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentDescription: freezed == paymentDescription
          ? _value.paymentDescription
          : paymentDescription // ignore: cast_nullable_to_non_nullable
              as dynamic,
      jobStatus: freezed == jobStatus
          ? _value.jobStatus
          : jobStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLatitude: freezed == dropLatitude
          ? _value.dropLatitude
          : dropLatitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLongitude: freezed == dropLongitude
          ? _value.dropLongitude
          : dropLongitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLocation1: freezed == pickupLocation1
          ? _value.pickupLocation1
          : pickupLocation1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLocation2: freezed == pickupLocation2
          ? _value.pickupLocation2
          : pickupLocation2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLocation1: freezed == dropLocation1
          ? _value.dropLocation1
          : dropLocation1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLocation2: freezed == dropLocation2
          ? _value.dropLocation2
          : dropLocation2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropCity: freezed == dropCity
          ? _value.dropCity
          : dropCity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropCountry: freezed == dropCountry
          ? _value.dropCountry
          : dropCountry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderPickupPhone1: freezed == orderPickupPhone1
          ? _value.orderPickupPhone1
          : orderPickupPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderDropPhone1: freezed == orderDropPhone1
          ? _value.orderDropPhone1
          : orderDropPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signaturePath: freezed == signaturePath
          ? _value.signaturePath
          : signaturePath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupStatus: freezed == pickupStatus
          ? _value.pickupStatus
          : pickupStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropStatus: freezed == dropStatus
          ? _value.dropStatus
          : dropStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') dynamic id,
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
      @JsonKey(name: 'drop_status') dynamic dropStatus});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? driverId = freezed,
    Object? orderId = freezed,
    Object? orderAmount = freezed,
    Object? adminId = freezed,
    Object? cutPercentage = freezed,
    Object? orderFinalAmount = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? bidAmount = freezed,
    Object? discountAmount = freezed,
    Object? orderAddedAmount = freezed,
    Object? trackingID = freezed,
    Object? orderStorageId = freezed,
    Object? userId = freezed,
    Object? orderStatus = freezed,
    Object? orderType = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? bookingFirstLastName = freezed,
    Object? bookigEmail = freezed,
    Object? bookingPhone = freezed,
    Object? pickupPostal = freezed,
    Object? pickupAddress = freezed,
    Object? pickupName = freezed,
    Object? pickupPhone = freezed,
    Object? deliveryPostal = freezed,
    Object? deliveryPostcode = freezed,
    Object? pickupPostcode = freezed,
    Object? deliveryAddress = freezed,
    Object? deliveryName = freezed,
    Object? deliveryPhone = freezed,
    Object? pickupAddressLine1 = freezed,
    Object? pickupAddressLine2 = freezed,
    Object? pickupCity = freezed,
    Object? pickupCountry = freezed,
    Object? deliveryAddressLine1 = freezed,
    Object? deliveryAddressLine2 = freezed,
    Object? deliveryCity = freezed,
    Object? deliveryCountry = freezed,
    Object? pickupPhone1 = freezed,
    Object? deliveryPhone1 = freezed,
    Object? parentSlug = freezed,
    Object? persons = freezed,
    Object? km = freezed,
    Object? total = freezed,
    Object? productsList = freezed,
    Object? oldProductsList = freezed,
    Object? productVolume = freezed,
    Object? price = freezed,
    Object? orderPrice = freezed,
    Object? cubicMeterPrice = freezed,
    Object? extraServicesPrice = freezed,
    Object? orderOldPrice = freezed,
    Object? strtTime = freezed,
    Object? endTime = freezed,
    Object? orderDate = freezed,
    Object? q1 = freezed,
    Object? q2 = freezed,
    Object? q3 = freezed,
    Object? q4 = freezed,
    Object? q5 = freezed,
    Object? q6 = freezed,
    Object? q7 = freezed,
    Object? q8 = freezed,
    Object? chargeExtra = freezed,
    Object? inquiryEmail = freezed,
    Object? inquiryMobile = freezed,
    Object? hear = freezed,
    Object? deliveryInstructions = freezed,
    Object? paymentTrackingID = freezed,
    Object? paymentDescription = freezed,
    Object? jobStatus = freezed,
    Object? reason = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? dropLatitude = freezed,
    Object? dropLongitude = freezed,
    Object? pickupLocation1 = freezed,
    Object? pickupLocation2 = freezed,
    Object? dropLocation1 = freezed,
    Object? dropLocation2 = freezed,
    Object? dropCity = freezed,
    Object? dropCountry = freezed,
    Object? orderPickupPhone1 = freezed,
    Object? orderDropPhone1 = freezed,
    Object? signature = freezed,
    Object? signaturePath = freezed,
    Object? pickupStatus = freezed,
    Object? dropStatus = freezed,
  }) {
    return _then(_$DataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderAmount: freezed == orderAmount
          ? _value.orderAmount
          : orderAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      adminId: freezed == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cutPercentage: freezed == cutPercentage
          ? _value.cutPercentage
          : cutPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderFinalAmount: freezed == orderFinalAmount
          ? _value.orderFinalAmount
          : orderFinalAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bidAmount: freezed == bidAmount
          ? _value.bidAmount
          : bidAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderAddedAmount: freezed == orderAddedAmount
          ? _value.orderAddedAmount
          : orderAddedAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trackingID: freezed == trackingID
          ? _value.trackingID
          : trackingID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderStorageId: freezed == orderStorageId
          ? _value.orderStorageId
          : orderStorageId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookingFirstLastName: freezed == bookingFirstLastName
          ? _value.bookingFirstLastName
          : bookingFirstLastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookigEmail: freezed == bookigEmail
          ? _value.bookigEmail
          : bookigEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookingPhone: freezed == bookingPhone
          ? _value.bookingPhone
          : bookingPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPostal: freezed == pickupPostal
          ? _value.pickupPostal
          : pickupPostal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupName: freezed == pickupName
          ? _value.pickupName
          : pickupName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPhone: freezed == pickupPhone
          ? _value.pickupPhone
          : pickupPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPostal: freezed == deliveryPostal
          ? _value.deliveryPostal
          : deliveryPostal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPostcode: freezed == deliveryPostcode
          ? _value.deliveryPostcode
          : deliveryPostcode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPostcode: freezed == pickupPostcode
          ? _value.pickupPostcode
          : pickupPostcode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryName: freezed == deliveryName
          ? _value.deliveryName
          : deliveryName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPhone: freezed == deliveryPhone
          ? _value.deliveryPhone
          : deliveryPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupAddressLine1: freezed == pickupAddressLine1
          ? _value.pickupAddressLine1
          : pickupAddressLine1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupAddressLine2: freezed == pickupAddressLine2
          ? _value.pickupAddressLine2
          : pickupAddressLine2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupCity: freezed == pickupCity
          ? _value.pickupCity
          : pickupCity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupCountry: freezed == pickupCountry
          ? _value.pickupCountry
          : pickupCountry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryAddressLine1: freezed == deliveryAddressLine1
          ? _value.deliveryAddressLine1
          : deliveryAddressLine1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryAddressLine2: freezed == deliveryAddressLine2
          ? _value.deliveryAddressLine2
          : deliveryAddressLine2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryCity: freezed == deliveryCity
          ? _value.deliveryCity
          : deliveryCity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryCountry: freezed == deliveryCountry
          ? _value.deliveryCountry
          : deliveryCountry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupPhone1: freezed == pickupPhone1
          ? _value.pickupPhone1
          : pickupPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPhone1: freezed == deliveryPhone1
          ? _value.deliveryPhone1
          : deliveryPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      parentSlug: freezed == parentSlug
          ? _value.parentSlug
          : parentSlug // ignore: cast_nullable_to_non_nullable
              as dynamic,
      persons: freezed == persons
          ? _value.persons
          : persons // ignore: cast_nullable_to_non_nullable
              as dynamic,
      km: freezed == km
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as dynamic,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productsList: freezed == productsList
          ? _value.productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      oldProductsList: freezed == oldProductsList
          ? _value.oldProductsList
          : oldProductsList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productVolume: freezed == productVolume
          ? _value.productVolume
          : productVolume // ignore: cast_nullable_to_non_nullable
              as dynamic,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderPrice: freezed == orderPrice
          ? _value.orderPrice
          : orderPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cubicMeterPrice: freezed == cubicMeterPrice
          ? _value.cubicMeterPrice
          : cubicMeterPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      extraServicesPrice: freezed == extraServicesPrice
          ? _value.extraServicesPrice
          : extraServicesPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderOldPrice: freezed == orderOldPrice
          ? _value.orderOldPrice
          : orderOldPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      strtTime: freezed == strtTime
          ? _value.strtTime
          : strtTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q1: freezed == q1
          ? _value.q1
          : q1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q2: freezed == q2
          ? _value.q2
          : q2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q3: freezed == q3
          ? _value.q3
          : q3 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q4: freezed == q4
          ? _value.q4
          : q4 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q5: freezed == q5
          ? _value.q5
          : q5 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q6: freezed == q6
          ? _value.q6
          : q6 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q7: freezed == q7
          ? _value.q7
          : q7 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      q8: freezed == q8
          ? _value.q8
          : q8 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chargeExtra: freezed == chargeExtra
          ? _value.chargeExtra
          : chargeExtra // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inquiryEmail: freezed == inquiryEmail
          ? _value.inquiryEmail
          : inquiryEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inquiryMobile: freezed == inquiryMobile
          ? _value.inquiryMobile
          : inquiryMobile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hear: freezed == hear
          ? _value.hear
          : hear // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentTrackingID: freezed == paymentTrackingID
          ? _value.paymentTrackingID
          : paymentTrackingID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentDescription: freezed == paymentDescription
          ? _value.paymentDescription
          : paymentDescription // ignore: cast_nullable_to_non_nullable
              as dynamic,
      jobStatus: freezed == jobStatus
          ? _value.jobStatus
          : jobStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLatitude: freezed == dropLatitude
          ? _value.dropLatitude
          : dropLatitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLongitude: freezed == dropLongitude
          ? _value.dropLongitude
          : dropLongitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLocation1: freezed == pickupLocation1
          ? _value.pickupLocation1
          : pickupLocation1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupLocation2: freezed == pickupLocation2
          ? _value.pickupLocation2
          : pickupLocation2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLocation1: freezed == dropLocation1
          ? _value.dropLocation1
          : dropLocation1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropLocation2: freezed == dropLocation2
          ? _value.dropLocation2
          : dropLocation2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropCity: freezed == dropCity
          ? _value.dropCity
          : dropCity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropCountry: freezed == dropCountry
          ? _value.dropCountry
          : dropCountry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderPickupPhone1: freezed == orderPickupPhone1
          ? _value.orderPickupPhone1
          : orderPickupPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderDropPhone1: freezed == orderDropPhone1
          ? _value.orderDropPhone1
          : orderDropPhone1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signaturePath: freezed == signaturePath
          ? _value.signaturePath
          : signaturePath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupStatus: freezed == pickupStatus
          ? _value.pickupStatus
          : pickupStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dropStatus: freezed == dropStatus
          ? _value.dropStatus
          : dropStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  _$DataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'driver_id') this.driverId,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'order_amount') this.orderAmount,
      @JsonKey(name: 'admin_id') this.adminId,
      @JsonKey(name: 'cut_percentage') this.cutPercentage,
      @JsonKey(name: 'order_final_amount') this.orderFinalAmount,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'bid_amount') this.bidAmount,
      @JsonKey(name: 'discount_amount') this.discountAmount,
      @JsonKey(name: 'order_added_amount') this.orderAddedAmount,
      @JsonKey(name: 'trackingID') this.trackingID,
      @JsonKey(name: 'order_storage_id') this.orderStorageId,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'order_status') this.orderStatus,
      @JsonKey(name: 'order_type') this.orderType,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'booking_first_last_name') this.bookingFirstLastName,
      @JsonKey(name: 'bookig_email') this.bookigEmail,
      @JsonKey(name: 'booking_phone') this.bookingPhone,
      @JsonKey(name: 'pickup_postal') this.pickupPostal,
      @JsonKey(name: 'pickup_address') this.pickupAddress,
      @JsonKey(name: 'pickup_name') this.pickupName,
      @JsonKey(name: 'pickup_phone') this.pickupPhone,
      @JsonKey(name: 'delivery_postal') this.deliveryPostal,
      @JsonKey(name: 'delivery_postcode') this.deliveryPostcode,
      @JsonKey(name: 'pickup_postcode') this.pickupPostcode,
      @JsonKey(name: 'delivery_address') this.deliveryAddress,
      @JsonKey(name: 'delivery_name') this.deliveryName,
      @JsonKey(name: 'delivery_phone') this.deliveryPhone,
      @JsonKey(name: 'pickup_address_line1') this.pickupAddressLine1,
      @JsonKey(name: 'pickup_address_line2') this.pickupAddressLine2,
      @JsonKey(name: 'pickup_city') this.pickupCity,
      @JsonKey(name: 'pickup_country') this.pickupCountry,
      @JsonKey(name: 'delivery_address_line1') this.deliveryAddressLine1,
      @JsonKey(name: 'delivery_address_line2') this.deliveryAddressLine2,
      @JsonKey(name: 'delivery_city') this.deliveryCity,
      @JsonKey(name: 'delivery_country') this.deliveryCountry,
      @JsonKey(name: 'pickup_phone1') this.pickupPhone1,
      @JsonKey(name: 'delivery_phone1') this.deliveryPhone1,
      @JsonKey(name: 'parent_slug') this.parentSlug,
      @JsonKey(name: 'persons') this.persons,
      @JsonKey(name: 'km') this.km,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'products_list') this.productsList,
      @JsonKey(name: 'old_products_list') this.oldProductsList,
      @JsonKey(name: 'product_volume') this.productVolume,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'order_price') this.orderPrice,
      @JsonKey(name: 'cubic_meter_price') this.cubicMeterPrice,
      @JsonKey(name: 'extra_services_price') this.extraServicesPrice,
      @JsonKey(name: 'order_old_price') this.orderOldPrice,
      @JsonKey(name: 'strt_time') this.strtTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'order_date') this.orderDate,
      @JsonKey(name: 'q1') this.q1,
      @JsonKey(name: 'q2') this.q2,
      @JsonKey(name: 'q3') this.q3,
      @JsonKey(name: 'q4') this.q4,
      @JsonKey(name: 'q5') this.q5,
      @JsonKey(name: 'q6') this.q6,
      @JsonKey(name: 'q7') this.q7,
      @JsonKey(name: 'q8') this.q8,
      @JsonKey(name: 'charge_extra') this.chargeExtra,
      @JsonKey(name: 'inquiry_email') this.inquiryEmail,
      @JsonKey(name: 'inquiry_mobile') this.inquiryMobile,
      @JsonKey(name: 'hear') this.hear,
      @JsonKey(name: 'delivery_instructions') this.deliveryInstructions,
      @JsonKey(name: 'payment_trackingID') this.paymentTrackingID,
      @JsonKey(name: 'payment_description') this.paymentDescription,
      @JsonKey(name: 'job_status') this.jobStatus,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'pickup_latitude') this.pickupLatitude,
      @JsonKey(name: 'pickup_longitude') this.pickupLongitude,
      @JsonKey(name: 'drop_latitude') this.dropLatitude,
      @JsonKey(name: 'drop_longitude') this.dropLongitude,
      @JsonKey(name: 'pickup_location1') this.pickupLocation1,
      @JsonKey(name: 'pickup_location2') this.pickupLocation2,
      @JsonKey(name: 'drop_location1') this.dropLocation1,
      @JsonKey(name: 'drop_location2') this.dropLocation2,
      @JsonKey(name: 'drop_city') this.dropCity,
      @JsonKey(name: 'drop_country') this.dropCountry,
      @JsonKey(name: 'order_pickup_phone1') this.orderPickupPhone1,
      @JsonKey(name: 'order_drop_phone1') this.orderDropPhone1,
      @JsonKey(name: 'signature') this.signature,
      @JsonKey(name: 'signature_path') this.signaturePath,
      @JsonKey(name: 'pickup_status') this.pickupStatus,
      @JsonKey(name: 'drop_status') this.dropStatus});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final dynamic id;
  @override
  @JsonKey(name: 'driver_id')
  final dynamic driverId;
  @override
  @JsonKey(name: 'order_id')
  final dynamic orderId;
  @override
  @JsonKey(name: 'order_amount')
  final dynamic orderAmount;
  @override
  @JsonKey(name: 'admin_id')
  final dynamic adminId;
  @override
  @JsonKey(name: 'cut_percentage')
  final dynamic cutPercentage;
  @override
  @JsonKey(name: 'order_final_amount')
  final dynamic orderFinalAmount;
  @override
  @JsonKey(name: 'status')
  final dynamic status;
  @override
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;
  @override
  @JsonKey(name: 'bid_amount')
  final dynamic bidAmount;
  @override
  @JsonKey(name: 'discount_amount')
  final dynamic discountAmount;
  @override
  @JsonKey(name: 'order_added_amount')
  final dynamic orderAddedAmount;
  @override
  @JsonKey(name: 'trackingID')
  final dynamic trackingID;
  @override
  @JsonKey(name: 'order_storage_id')
  final dynamic orderStorageId;
  @override
  @JsonKey(name: 'user_id')
  final dynamic userId;
  @override
  @JsonKey(name: 'order_status')
  final dynamic orderStatus;
  @override
  @JsonKey(name: 'order_type')
  final dynamic orderType;
  @override
  @JsonKey(name: 'slug')
  final dynamic slug;
  @override
  @JsonKey(name: 'description')
  final dynamic description;
  @override
  @JsonKey(name: 'booking_first_last_name')
  final dynamic bookingFirstLastName;
  @override
  @JsonKey(name: 'bookig_email')
  final dynamic bookigEmail;
  @override
  @JsonKey(name: 'booking_phone')
  final dynamic bookingPhone;
  @override
  @JsonKey(name: 'pickup_postal')
  final dynamic pickupPostal;
  @override
  @JsonKey(name: 'pickup_address')
  final dynamic pickupAddress;
  @override
  @JsonKey(name: 'pickup_name')
  final dynamic pickupName;
  @override
  @JsonKey(name: 'pickup_phone')
  final dynamic pickupPhone;
  @override
  @JsonKey(name: 'delivery_postal')
  final dynamic deliveryPostal;
  @override
  @JsonKey(name: 'delivery_postcode')
  final dynamic deliveryPostcode;
  @override
  @JsonKey(name: 'pickup_postcode')
  final dynamic pickupPostcode;
  @override
  @JsonKey(name: 'delivery_address')
  final dynamic deliveryAddress;
  @override
  @JsonKey(name: 'delivery_name')
  final dynamic deliveryName;
  @override
  @JsonKey(name: 'delivery_phone')
  final dynamic deliveryPhone;
  @override
  @JsonKey(name: 'pickup_address_line1')
  final dynamic pickupAddressLine1;
  @override
  @JsonKey(name: 'pickup_address_line2')
  final dynamic pickupAddressLine2;
  @override
  @JsonKey(name: 'pickup_city')
  final dynamic pickupCity;
  @override
  @JsonKey(name: 'pickup_country')
  final dynamic pickupCountry;
  @override
  @JsonKey(name: 'delivery_address_line1')
  final dynamic deliveryAddressLine1;
  @override
  @JsonKey(name: 'delivery_address_line2')
  final dynamic deliveryAddressLine2;
  @override
  @JsonKey(name: 'delivery_city')
  final dynamic deliveryCity;
  @override
  @JsonKey(name: 'delivery_country')
  final dynamic deliveryCountry;
  @override
  @JsonKey(name: 'pickup_phone1')
  final dynamic pickupPhone1;
  @override
  @JsonKey(name: 'delivery_phone1')
  final dynamic deliveryPhone1;
  @override
  @JsonKey(name: 'parent_slug')
  final dynamic parentSlug;
  @override
  @JsonKey(name: 'persons')
  final dynamic persons;
  @override
  @JsonKey(name: 'km')
  final dynamic km;
  @override
  @JsonKey(name: 'total')
  final dynamic total;
  @override
  @JsonKey(name: 'products_list')
  final dynamic productsList;
  @override
  @JsonKey(name: 'old_products_list')
  final dynamic oldProductsList;
  @override
  @JsonKey(name: 'product_volume')
  final dynamic productVolume;
  @override
  @JsonKey(name: 'price')
  final dynamic price;
  @override
  @JsonKey(name: 'order_price')
  final dynamic orderPrice;
  @override
  @JsonKey(name: 'cubic_meter_price')
  final dynamic cubicMeterPrice;
  @override
  @JsonKey(name: 'extra_services_price')
  final dynamic extraServicesPrice;
  @override
  @JsonKey(name: 'order_old_price')
  final dynamic orderOldPrice;
  @override
  @JsonKey(name: 'strt_time')
  final dynamic strtTime;
  @override
  @JsonKey(name: 'end_time')
  final dynamic endTime;
  @override
  @JsonKey(name: 'order_date')
  final dynamic orderDate;
  @override
  @JsonKey(name: 'q1')
  final dynamic q1;
  @override
  @JsonKey(name: 'q2')
  final dynamic q2;
  @override
  @JsonKey(name: 'q3')
  final dynamic q3;
  @override
  @JsonKey(name: 'q4')
  final dynamic q4;
  @override
  @JsonKey(name: 'q5')
  final dynamic q5;
  @override
  @JsonKey(name: 'q6')
  final dynamic q6;
  @override
  @JsonKey(name: 'q7')
  final dynamic q7;
  @override
  @JsonKey(name: 'q8')
  final dynamic q8;
  @override
  @JsonKey(name: 'charge_extra')
  final dynamic chargeExtra;
  @override
  @JsonKey(name: 'inquiry_email')
  final dynamic inquiryEmail;
  @override
  @JsonKey(name: 'inquiry_mobile')
  final dynamic inquiryMobile;
  @override
  @JsonKey(name: 'hear')
  final dynamic hear;
  @override
  @JsonKey(name: 'delivery_instructions')
  final dynamic deliveryInstructions;
  @override
  @JsonKey(name: 'payment_trackingID')
  final dynamic paymentTrackingID;
  @override
  @JsonKey(name: 'payment_description')
  final dynamic paymentDescription;
  @override
  @JsonKey(name: 'job_status')
  final dynamic jobStatus;
  @override
  @JsonKey(name: 'reason')
  final dynamic reason;
  @override
  @JsonKey(name: 'pickup_latitude')
  final dynamic pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  final dynamic pickupLongitude;
  @override
  @JsonKey(name: 'drop_latitude')
  final dynamic dropLatitude;
  @override
  @JsonKey(name: 'drop_longitude')
  final dynamic dropLongitude;
  @override
  @JsonKey(name: 'pickup_location1')
  final dynamic pickupLocation1;
  @override
  @JsonKey(name: 'pickup_location2')
  final dynamic pickupLocation2;
  @override
  @JsonKey(name: 'drop_location1')
  final dynamic dropLocation1;
  @override
  @JsonKey(name: 'drop_location2')
  final dynamic dropLocation2;
  @override
  @JsonKey(name: 'drop_city')
  final dynamic dropCity;
  @override
  @JsonKey(name: 'drop_country')
  final dynamic dropCountry;
  @override
  @JsonKey(name: 'order_pickup_phone1')
  final dynamic orderPickupPhone1;
  @override
  @JsonKey(name: 'order_drop_phone1')
  final dynamic orderDropPhone1;
  @override
  @JsonKey(name: 'signature')
  final dynamic signature;
  @override
  @JsonKey(name: 'signature_path')
  final dynamic signaturePath;
  @override
  @JsonKey(name: 'pickup_status')
  final dynamic pickupStatus;
  @override
  @JsonKey(name: 'drop_status')
  final dynamic dropStatus;

  @override
  String toString() {
    return 'Data(id: $id, driverId: $driverId, orderId: $orderId, orderAmount: $orderAmount, adminId: $adminId, cutPercentage: $cutPercentage, orderFinalAmount: $orderFinalAmount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, bidAmount: $bidAmount, discountAmount: $discountAmount, orderAddedAmount: $orderAddedAmount, trackingID: $trackingID, orderStorageId: $orderStorageId, userId: $userId, orderStatus: $orderStatus, orderType: $orderType, slug: $slug, description: $description, bookingFirstLastName: $bookingFirstLastName, bookigEmail: $bookigEmail, bookingPhone: $bookingPhone, pickupPostal: $pickupPostal, pickupAddress: $pickupAddress, pickupName: $pickupName, pickupPhone: $pickupPhone, deliveryPostal: $deliveryPostal, deliveryPostcode: $deliveryPostcode, pickupPostcode: $pickupPostcode, deliveryAddress: $deliveryAddress, deliveryName: $deliveryName, deliveryPhone: $deliveryPhone, pickupAddressLine1: $pickupAddressLine1, pickupAddressLine2: $pickupAddressLine2, pickupCity: $pickupCity, pickupCountry: $pickupCountry, deliveryAddressLine1: $deliveryAddressLine1, deliveryAddressLine2: $deliveryAddressLine2, deliveryCity: $deliveryCity, deliveryCountry: $deliveryCountry, pickupPhone1: $pickupPhone1, deliveryPhone1: $deliveryPhone1, parentSlug: $parentSlug, persons: $persons, km: $km, total: $total, productsList: $productsList, oldProductsList: $oldProductsList, productVolume: $productVolume, price: $price, orderPrice: $orderPrice, cubicMeterPrice: $cubicMeterPrice, extraServicesPrice: $extraServicesPrice, orderOldPrice: $orderOldPrice, strtTime: $strtTime, endTime: $endTime, orderDate: $orderDate, q1: $q1, q2: $q2, q3: $q3, q4: $q4, q5: $q5, q6: $q6, q7: $q7, q8: $q8, chargeExtra: $chargeExtra, inquiryEmail: $inquiryEmail, inquiryMobile: $inquiryMobile, hear: $hear, deliveryInstructions: $deliveryInstructions, paymentTrackingID: $paymentTrackingID, paymentDescription: $paymentDescription, jobStatus: $jobStatus, reason: $reason, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, dropLatitude: $dropLatitude, dropLongitude: $dropLongitude, pickupLocation1: $pickupLocation1, pickupLocation2: $pickupLocation2, dropLocation1: $dropLocation1, dropLocation2: $dropLocation2, dropCity: $dropCity, dropCountry: $dropCountry, orderPickupPhone1: $orderPickupPhone1, orderDropPhone1: $orderDropPhone1, signature: $signature, signaturePath: $signaturePath, pickupStatus: $pickupStatus, dropStatus: $dropStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.driverId, driverId) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality()
                .equals(other.orderAmount, orderAmount) &&
            const DeepCollectionEquality().equals(other.adminId, adminId) &&
            const DeepCollectionEquality()
                .equals(other.cutPercentage, cutPercentage) &&
            const DeepCollectionEquality()
                .equals(other.orderFinalAmount, orderFinalAmount) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.bidAmount, bidAmount) &&
            const DeepCollectionEquality()
                .equals(other.discountAmount, discountAmount) &&
            const DeepCollectionEquality()
                .equals(other.orderAddedAmount, orderAddedAmount) &&
            const DeepCollectionEquality()
                .equals(other.trackingID, trackingID) &&
            const DeepCollectionEquality()
                .equals(other.orderStorageId, orderStorageId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.orderStatus, orderStatus) &&
            const DeepCollectionEquality().equals(other.orderType, orderType) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.bookingFirstLastName, bookingFirstLastName) &&
            const DeepCollectionEquality()
                .equals(other.bookigEmail, bookigEmail) &&
            const DeepCollectionEquality()
                .equals(other.bookingPhone, bookingPhone) &&
            const DeepCollectionEquality()
                .equals(other.pickupPostal, pickupPostal) &&
            const DeepCollectionEquality()
                .equals(other.pickupAddress, pickupAddress) &&
            const DeepCollectionEquality()
                .equals(other.pickupName, pickupName) &&
            const DeepCollectionEquality()
                .equals(other.pickupPhone, pickupPhone) &&
            const DeepCollectionEquality()
                .equals(other.deliveryPostal, deliveryPostal) &&
            const DeepCollectionEquality()
                .equals(other.deliveryPostcode, deliveryPostcode) &&
            const DeepCollectionEquality()
                .equals(other.pickupPostcode, pickupPostcode) &&
            const DeepCollectionEquality()
                .equals(other.deliveryAddress, deliveryAddress) &&
            const DeepCollectionEquality()
                .equals(other.deliveryName, deliveryName) &&
            const DeepCollectionEquality()
                .equals(other.deliveryPhone, deliveryPhone) &&
            const DeepCollectionEquality()
                .equals(other.pickupAddressLine1, pickupAddressLine1) &&
            const DeepCollectionEquality()
                .equals(other.pickupAddressLine2, pickupAddressLine2) &&
            const DeepCollectionEquality()
                .equals(other.pickupCity, pickupCity) &&
            const DeepCollectionEquality()
                .equals(other.pickupCountry, pickupCountry) &&
            const DeepCollectionEquality()
                .equals(other.deliveryAddressLine1, deliveryAddressLine1) &&
            const DeepCollectionEquality()
                .equals(other.deliveryAddressLine2, deliveryAddressLine2) &&
            const DeepCollectionEquality()
                .equals(other.deliveryCity, deliveryCity) &&
            const DeepCollectionEquality()
                .equals(other.deliveryCountry, deliveryCountry) &&
            const DeepCollectionEquality()
                .equals(other.pickupPhone1, pickupPhone1) &&
            const DeepCollectionEquality()
                .equals(other.deliveryPhone1, deliveryPhone1) &&
            const DeepCollectionEquality()
                .equals(other.parentSlug, parentSlug) &&
            const DeepCollectionEquality().equals(other.persons, persons) &&
            const DeepCollectionEquality().equals(other.km, km) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other.productsList, productsList) &&
            const DeepCollectionEquality()
                .equals(other.oldProductsList, oldProductsList) &&
            const DeepCollectionEquality()
                .equals(other.productVolume, productVolume) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.orderPrice, orderPrice) &&
            const DeepCollectionEquality()
                .equals(other.cubicMeterPrice, cubicMeterPrice) &&
            const DeepCollectionEquality()
                .equals(other.extraServicesPrice, extraServicesPrice) &&
            const DeepCollectionEquality()
                .equals(other.orderOldPrice, orderOldPrice) &&
            const DeepCollectionEquality().equals(other.strtTime, strtTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality().equals(other.orderDate, orderDate) &&
            const DeepCollectionEquality().equals(other.q1, q1) &&
            const DeepCollectionEquality().equals(other.q2, q2) &&
            const DeepCollectionEquality().equals(other.q3, q3) &&
            const DeepCollectionEquality().equals(other.q4, q4) &&
            const DeepCollectionEquality().equals(other.q5, q5) &&
            const DeepCollectionEquality().equals(other.q6, q6) &&
            const DeepCollectionEquality().equals(other.q7, q7) &&
            const DeepCollectionEquality().equals(other.q8, q8) &&
            const DeepCollectionEquality()
                .equals(other.chargeExtra, chargeExtra) &&
            const DeepCollectionEquality()
                .equals(other.inquiryEmail, inquiryEmail) &&
            const DeepCollectionEquality()
                .equals(other.inquiryMobile, inquiryMobile) &&
            const DeepCollectionEquality().equals(other.hear, hear) &&
            const DeepCollectionEquality()
                .equals(other.deliveryInstructions, deliveryInstructions) &&
            const DeepCollectionEquality().equals(other.paymentTrackingID, paymentTrackingID) &&
            const DeepCollectionEquality().equals(other.paymentDescription, paymentDescription) &&
            const DeepCollectionEquality().equals(other.jobStatus, jobStatus) &&
            const DeepCollectionEquality().equals(other.reason, reason) &&
            const DeepCollectionEquality().equals(other.pickupLatitude, pickupLatitude) &&
            const DeepCollectionEquality().equals(other.pickupLongitude, pickupLongitude) &&
            const DeepCollectionEquality().equals(other.dropLatitude, dropLatitude) &&
            const DeepCollectionEquality().equals(other.dropLongitude, dropLongitude) &&
            const DeepCollectionEquality().equals(other.pickupLocation1, pickupLocation1) &&
            const DeepCollectionEquality().equals(other.pickupLocation2, pickupLocation2) &&
            const DeepCollectionEquality().equals(other.dropLocation1, dropLocation1) &&
            const DeepCollectionEquality().equals(other.dropLocation2, dropLocation2) &&
            const DeepCollectionEquality().equals(other.dropCity, dropCity) &&
            const DeepCollectionEquality().equals(other.dropCountry, dropCountry) &&
            const DeepCollectionEquality().equals(other.orderPickupPhone1, orderPickupPhone1) &&
            const DeepCollectionEquality().equals(other.orderDropPhone1, orderDropPhone1) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.signaturePath, signaturePath) &&
            const DeepCollectionEquality().equals(other.pickupStatus, pickupStatus) &&
            const DeepCollectionEquality().equals(other.dropStatus, dropStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(driverId),
        const DeepCollectionEquality().hash(orderId),
        const DeepCollectionEquality().hash(orderAmount),
        const DeepCollectionEquality().hash(adminId),
        const DeepCollectionEquality().hash(cutPercentage),
        const DeepCollectionEquality().hash(orderFinalAmount),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(bidAmount),
        const DeepCollectionEquality().hash(discountAmount),
        const DeepCollectionEquality().hash(orderAddedAmount),
        const DeepCollectionEquality().hash(trackingID),
        const DeepCollectionEquality().hash(orderStorageId),
        const DeepCollectionEquality().hash(userId),
        const DeepCollectionEquality().hash(orderStatus),
        const DeepCollectionEquality().hash(orderType),
        const DeepCollectionEquality().hash(slug),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(bookingFirstLastName),
        const DeepCollectionEquality().hash(bookigEmail),
        const DeepCollectionEquality().hash(bookingPhone),
        const DeepCollectionEquality().hash(pickupPostal),
        const DeepCollectionEquality().hash(pickupAddress),
        const DeepCollectionEquality().hash(pickupName),
        const DeepCollectionEquality().hash(pickupPhone),
        const DeepCollectionEquality().hash(deliveryPostal),
        const DeepCollectionEquality().hash(deliveryPostcode),
        const DeepCollectionEquality().hash(pickupPostcode),
        const DeepCollectionEquality().hash(deliveryAddress),
        const DeepCollectionEquality().hash(deliveryName),
        const DeepCollectionEquality().hash(deliveryPhone),
        const DeepCollectionEquality().hash(pickupAddressLine1),
        const DeepCollectionEquality().hash(pickupAddressLine2),
        const DeepCollectionEquality().hash(pickupCity),
        const DeepCollectionEquality().hash(pickupCountry),
        const DeepCollectionEquality().hash(deliveryAddressLine1),
        const DeepCollectionEquality().hash(deliveryAddressLine2),
        const DeepCollectionEquality().hash(deliveryCity),
        const DeepCollectionEquality().hash(deliveryCountry),
        const DeepCollectionEquality().hash(pickupPhone1),
        const DeepCollectionEquality().hash(deliveryPhone1),
        const DeepCollectionEquality().hash(parentSlug),
        const DeepCollectionEquality().hash(persons),
        const DeepCollectionEquality().hash(km),
        const DeepCollectionEquality().hash(total),
        const DeepCollectionEquality().hash(productsList),
        const DeepCollectionEquality().hash(oldProductsList),
        const DeepCollectionEquality().hash(productVolume),
        const DeepCollectionEquality().hash(price),
        const DeepCollectionEquality().hash(orderPrice),
        const DeepCollectionEquality().hash(cubicMeterPrice),
        const DeepCollectionEquality().hash(extraServicesPrice),
        const DeepCollectionEquality().hash(orderOldPrice),
        const DeepCollectionEquality().hash(strtTime),
        const DeepCollectionEquality().hash(endTime),
        const DeepCollectionEquality().hash(orderDate),
        const DeepCollectionEquality().hash(q1),
        const DeepCollectionEquality().hash(q2),
        const DeepCollectionEquality().hash(q3),
        const DeepCollectionEquality().hash(q4),
        const DeepCollectionEquality().hash(q5),
        const DeepCollectionEquality().hash(q6),
        const DeepCollectionEquality().hash(q7),
        const DeepCollectionEquality().hash(q8),
        const DeepCollectionEquality().hash(chargeExtra),
        const DeepCollectionEquality().hash(inquiryEmail),
        const DeepCollectionEquality().hash(inquiryMobile),
        const DeepCollectionEquality().hash(hear),
        const DeepCollectionEquality().hash(deliveryInstructions),
        const DeepCollectionEquality().hash(paymentTrackingID),
        const DeepCollectionEquality().hash(paymentDescription),
        const DeepCollectionEquality().hash(jobStatus),
        const DeepCollectionEquality().hash(reason),
        const DeepCollectionEquality().hash(pickupLatitude),
        const DeepCollectionEquality().hash(pickupLongitude),
        const DeepCollectionEquality().hash(dropLatitude),
        const DeepCollectionEquality().hash(dropLongitude),
        const DeepCollectionEquality().hash(pickupLocation1),
        const DeepCollectionEquality().hash(pickupLocation2),
        const DeepCollectionEquality().hash(dropLocation1),
        const DeepCollectionEquality().hash(dropLocation2),
        const DeepCollectionEquality().hash(dropCity),
        const DeepCollectionEquality().hash(dropCountry),
        const DeepCollectionEquality().hash(orderPickupPhone1),
        const DeepCollectionEquality().hash(orderDropPhone1),
        const DeepCollectionEquality().hash(signature),
        const DeepCollectionEquality().hash(signaturePath),
        const DeepCollectionEquality().hash(pickupStatus),
        const DeepCollectionEquality().hash(dropStatus)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {@JsonKey(name: 'id') final dynamic id,
      @JsonKey(name: 'driver_id') final dynamic driverId,
      @JsonKey(name: 'order_id') final dynamic orderId,
      @JsonKey(name: 'order_amount') final dynamic orderAmount,
      @JsonKey(name: 'admin_id') final dynamic adminId,
      @JsonKey(name: 'cut_percentage') final dynamic cutPercentage,
      @JsonKey(name: 'order_final_amount') final dynamic orderFinalAmount,
      @JsonKey(name: 'status') final dynamic status,
      @JsonKey(name: 'created_at') final dynamic createdAt,
      @JsonKey(name: 'updated_at') final dynamic updatedAt,
      @JsonKey(name: 'bid_amount') final dynamic bidAmount,
      @JsonKey(name: 'discount_amount') final dynamic discountAmount,
      @JsonKey(name: 'order_added_amount') final dynamic orderAddedAmount,
      @JsonKey(name: 'trackingID') final dynamic trackingID,
      @JsonKey(name: 'order_storage_id') final dynamic orderStorageId,
      @JsonKey(name: 'user_id') final dynamic userId,
      @JsonKey(name: 'order_status') final dynamic orderStatus,
      @JsonKey(name: 'order_type') final dynamic orderType,
      @JsonKey(name: 'slug') final dynamic slug,
      @JsonKey(name: 'description') final dynamic description,
      @JsonKey(name: 'booking_first_last_name')
      final dynamic bookingFirstLastName,
      @JsonKey(name: 'bookig_email') final dynamic bookigEmail,
      @JsonKey(name: 'booking_phone') final dynamic bookingPhone,
      @JsonKey(name: 'pickup_postal') final dynamic pickupPostal,
      @JsonKey(name: 'pickup_address') final dynamic pickupAddress,
      @JsonKey(name: 'pickup_name') final dynamic pickupName,
      @JsonKey(name: 'pickup_phone') final dynamic pickupPhone,
      @JsonKey(name: 'delivery_postal') final dynamic deliveryPostal,
      @JsonKey(name: 'delivery_postcode') final dynamic deliveryPostcode,
      @JsonKey(name: 'pickup_postcode') final dynamic pickupPostcode,
      @JsonKey(name: 'delivery_address') final dynamic deliveryAddress,
      @JsonKey(name: 'delivery_name') final dynamic deliveryName,
      @JsonKey(name: 'delivery_phone') final dynamic deliveryPhone,
      @JsonKey(name: 'pickup_address_line1') final dynamic pickupAddressLine1,
      @JsonKey(name: 'pickup_address_line2') final dynamic pickupAddressLine2,
      @JsonKey(name: 'pickup_city') final dynamic pickupCity,
      @JsonKey(name: 'pickup_country') final dynamic pickupCountry,
      @JsonKey(name: 'delivery_address_line1')
      final dynamic deliveryAddressLine1,
      @JsonKey(name: 'delivery_address_line2')
      final dynamic deliveryAddressLine2,
      @JsonKey(name: 'delivery_city') final dynamic deliveryCity,
      @JsonKey(name: 'delivery_country') final dynamic deliveryCountry,
      @JsonKey(name: 'pickup_phone1') final dynamic pickupPhone1,
      @JsonKey(name: 'delivery_phone1') final dynamic deliveryPhone1,
      @JsonKey(name: 'parent_slug') final dynamic parentSlug,
      @JsonKey(name: 'persons') final dynamic persons,
      @JsonKey(name: 'km') final dynamic km,
      @JsonKey(name: 'total') final dynamic total,
      @JsonKey(name: 'products_list') final dynamic productsList,
      @JsonKey(name: 'old_products_list') final dynamic oldProductsList,
      @JsonKey(name: 'product_volume') final dynamic productVolume,
      @JsonKey(name: 'price') final dynamic price,
      @JsonKey(name: 'order_price') final dynamic orderPrice,
      @JsonKey(name: 'cubic_meter_price') final dynamic cubicMeterPrice,
      @JsonKey(name: 'extra_services_price') final dynamic extraServicesPrice,
      @JsonKey(name: 'order_old_price') final dynamic orderOldPrice,
      @JsonKey(name: 'strt_time') final dynamic strtTime,
      @JsonKey(name: 'end_time') final dynamic endTime,
      @JsonKey(name: 'order_date') final dynamic orderDate,
      @JsonKey(name: 'q1') final dynamic q1,
      @JsonKey(name: 'q2') final dynamic q2,
      @JsonKey(name: 'q3') final dynamic q3,
      @JsonKey(name: 'q4') final dynamic q4,
      @JsonKey(name: 'q5') final dynamic q5,
      @JsonKey(name: 'q6') final dynamic q6,
      @JsonKey(name: 'q7') final dynamic q7,
      @JsonKey(name: 'q8') final dynamic q8,
      @JsonKey(name: 'charge_extra') final dynamic chargeExtra,
      @JsonKey(name: 'inquiry_email') final dynamic inquiryEmail,
      @JsonKey(name: 'inquiry_mobile') final dynamic inquiryMobile,
      @JsonKey(name: 'hear') final dynamic hear,
      @JsonKey(name: 'delivery_instructions')
      final dynamic deliveryInstructions,
      @JsonKey(name: 'payment_trackingID') final dynamic paymentTrackingID,
      @JsonKey(name: 'payment_description') final dynamic paymentDescription,
      @JsonKey(name: 'job_status') final dynamic jobStatus,
      @JsonKey(name: 'reason') final dynamic reason,
      @JsonKey(name: 'pickup_latitude') final dynamic pickupLatitude,
      @JsonKey(name: 'pickup_longitude') final dynamic pickupLongitude,
      @JsonKey(name: 'drop_latitude') final dynamic dropLatitude,
      @JsonKey(name: 'drop_longitude') final dynamic dropLongitude,
      @JsonKey(name: 'pickup_location1') final dynamic pickupLocation1,
      @JsonKey(name: 'pickup_location2') final dynamic pickupLocation2,
      @JsonKey(name: 'drop_location1') final dynamic dropLocation1,
      @JsonKey(name: 'drop_location2') final dynamic dropLocation2,
      @JsonKey(name: 'drop_city') final dynamic dropCity,
      @JsonKey(name: 'drop_country') final dynamic dropCountry,
      @JsonKey(name: 'order_pickup_phone1') final dynamic orderPickupPhone1,
      @JsonKey(name: 'order_drop_phone1') final dynamic orderDropPhone1,
      @JsonKey(name: 'signature') final dynamic signature,
      @JsonKey(name: 'signature_path') final dynamic signaturePath,
      @JsonKey(name: 'pickup_status') final dynamic pickupStatus,
      @JsonKey(name: 'drop_status') final dynamic dropStatus}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  dynamic get id;
  @override
  @JsonKey(name: 'driver_id')
  dynamic get driverId;
  @override
  @JsonKey(name: 'order_id')
  dynamic get orderId;
  @override
  @JsonKey(name: 'order_amount')
  dynamic get orderAmount;
  @override
  @JsonKey(name: 'admin_id')
  dynamic get adminId;
  @override
  @JsonKey(name: 'cut_percentage')
  dynamic get cutPercentage;
  @override
  @JsonKey(name: 'order_final_amount')
  dynamic get orderFinalAmount;
  @override
  @JsonKey(name: 'status')
  dynamic get status;
  @override
  @JsonKey(name: 'created_at')
  dynamic get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  dynamic get updatedAt;
  @override
  @JsonKey(name: 'bid_amount')
  dynamic get bidAmount;
  @override
  @JsonKey(name: 'discount_amount')
  dynamic get discountAmount;
  @override
  @JsonKey(name: 'order_added_amount')
  dynamic get orderAddedAmount;
  @override
  @JsonKey(name: 'trackingID')
  dynamic get trackingID;
  @override
  @JsonKey(name: 'order_storage_id')
  dynamic get orderStorageId;
  @override
  @JsonKey(name: 'user_id')
  dynamic get userId;
  @override
  @JsonKey(name: 'order_status')
  dynamic get orderStatus;
  @override
  @JsonKey(name: 'order_type')
  dynamic get orderType;
  @override
  @JsonKey(name: 'slug')
  dynamic get slug;
  @override
  @JsonKey(name: 'description')
  dynamic get description;
  @override
  @JsonKey(name: 'booking_first_last_name')
  dynamic get bookingFirstLastName;
  @override
  @JsonKey(name: 'bookig_email')
  dynamic get bookigEmail;
  @override
  @JsonKey(name: 'booking_phone')
  dynamic get bookingPhone;
  @override
  @JsonKey(name: 'pickup_postal')
  dynamic get pickupPostal;
  @override
  @JsonKey(name: 'pickup_address')
  dynamic get pickupAddress;
  @override
  @JsonKey(name: 'pickup_name')
  dynamic get pickupName;
  @override
  @JsonKey(name: 'pickup_phone')
  dynamic get pickupPhone;
  @override
  @JsonKey(name: 'delivery_postal')
  dynamic get deliveryPostal;
  @override
  @JsonKey(name: 'delivery_postcode')
  dynamic get deliveryPostcode;
  @override
  @JsonKey(name: 'pickup_postcode')
  dynamic get pickupPostcode;
  @override
  @JsonKey(name: 'delivery_address')
  dynamic get deliveryAddress;
  @override
  @JsonKey(name: 'delivery_name')
  dynamic get deliveryName;
  @override
  @JsonKey(name: 'delivery_phone')
  dynamic get deliveryPhone;
  @override
  @JsonKey(name: 'pickup_address_line1')
  dynamic get pickupAddressLine1;
  @override
  @JsonKey(name: 'pickup_address_line2')
  dynamic get pickupAddressLine2;
  @override
  @JsonKey(name: 'pickup_city')
  dynamic get pickupCity;
  @override
  @JsonKey(name: 'pickup_country')
  dynamic get pickupCountry;
  @override
  @JsonKey(name: 'delivery_address_line1')
  dynamic get deliveryAddressLine1;
  @override
  @JsonKey(name: 'delivery_address_line2')
  dynamic get deliveryAddressLine2;
  @override
  @JsonKey(name: 'delivery_city')
  dynamic get deliveryCity;
  @override
  @JsonKey(name: 'delivery_country')
  dynamic get deliveryCountry;
  @override
  @JsonKey(name: 'pickup_phone1')
  dynamic get pickupPhone1;
  @override
  @JsonKey(name: 'delivery_phone1')
  dynamic get deliveryPhone1;
  @override
  @JsonKey(name: 'parent_slug')
  dynamic get parentSlug;
  @override
  @JsonKey(name: 'persons')
  dynamic get persons;
  @override
  @JsonKey(name: 'km')
  dynamic get km;
  @override
  @JsonKey(name: 'total')
  dynamic get total;
  @override
  @JsonKey(name: 'products_list')
  dynamic get productsList;
  @override
  @JsonKey(name: 'old_products_list')
  dynamic get oldProductsList;
  @override
  @JsonKey(name: 'product_volume')
  dynamic get productVolume;
  @override
  @JsonKey(name: 'price')
  dynamic get price;
  @override
  @JsonKey(name: 'order_price')
  dynamic get orderPrice;
  @override
  @JsonKey(name: 'cubic_meter_price')
  dynamic get cubicMeterPrice;
  @override
  @JsonKey(name: 'extra_services_price')
  dynamic get extraServicesPrice;
  @override
  @JsonKey(name: 'order_old_price')
  dynamic get orderOldPrice;
  @override
  @JsonKey(name: 'strt_time')
  dynamic get strtTime;
  @override
  @JsonKey(name: 'end_time')
  dynamic get endTime;
  @override
  @JsonKey(name: 'order_date')
  dynamic get orderDate;
  @override
  @JsonKey(name: 'q1')
  dynamic get q1;
  @override
  @JsonKey(name: 'q2')
  dynamic get q2;
  @override
  @JsonKey(name: 'q3')
  dynamic get q3;
  @override
  @JsonKey(name: 'q4')
  dynamic get q4;
  @override
  @JsonKey(name: 'q5')
  dynamic get q5;
  @override
  @JsonKey(name: 'q6')
  dynamic get q6;
  @override
  @JsonKey(name: 'q7')
  dynamic get q7;
  @override
  @JsonKey(name: 'q8')
  dynamic get q8;
  @override
  @JsonKey(name: 'charge_extra')
  dynamic get chargeExtra;
  @override
  @JsonKey(name: 'inquiry_email')
  dynamic get inquiryEmail;
  @override
  @JsonKey(name: 'inquiry_mobile')
  dynamic get inquiryMobile;
  @override
  @JsonKey(name: 'hear')
  dynamic get hear;
  @override
  @JsonKey(name: 'delivery_instructions')
  dynamic get deliveryInstructions;
  @override
  @JsonKey(name: 'payment_trackingID')
  dynamic get paymentTrackingID;
  @override
  @JsonKey(name: 'payment_description')
  dynamic get paymentDescription;
  @override
  @JsonKey(name: 'job_status')
  dynamic get jobStatus;
  @override
  @JsonKey(name: 'reason')
  dynamic get reason;
  @override
  @JsonKey(name: 'pickup_latitude')
  dynamic get pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  dynamic get pickupLongitude;
  @override
  @JsonKey(name: 'drop_latitude')
  dynamic get dropLatitude;
  @override
  @JsonKey(name: 'drop_longitude')
  dynamic get dropLongitude;
  @override
  @JsonKey(name: 'pickup_location1')
  dynamic get pickupLocation1;
  @override
  @JsonKey(name: 'pickup_location2')
  dynamic get pickupLocation2;
  @override
  @JsonKey(name: 'drop_location1')
  dynamic get dropLocation1;
  @override
  @JsonKey(name: 'drop_location2')
  dynamic get dropLocation2;
  @override
  @JsonKey(name: 'drop_city')
  dynamic get dropCity;
  @override
  @JsonKey(name: 'drop_country')
  dynamic get dropCountry;
  @override
  @JsonKey(name: 'order_pickup_phone1')
  dynamic get orderPickupPhone1;
  @override
  @JsonKey(name: 'order_drop_phone1')
  dynamic get orderDropPhone1;
  @override
  @JsonKey(name: 'signature')
  dynamic get signature;
  @override
  @JsonKey(name: 'signature_path')
  dynamic get signaturePath;
  @override
  @JsonKey(name: 'pickup_status')
  dynamic get pickupStatus;
  @override
  @JsonKey(name: 'drop_status')
  dynamic get dropStatus;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
