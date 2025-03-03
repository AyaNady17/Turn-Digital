import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  bool success;
  String message;
  List<String> errors;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.errors,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}
