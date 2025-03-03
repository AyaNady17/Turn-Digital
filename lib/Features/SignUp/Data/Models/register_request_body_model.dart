import 'package:json_annotation/json_annotation.dart';

part 'register_request_body_model.g.dart';

@JsonSerializable()
class RegisterRequestBodyModel {
  String name;
  String email;
  String password;

  RegisterRequestBodyModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyModelToJson(this);
}
