// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  RegisterResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
