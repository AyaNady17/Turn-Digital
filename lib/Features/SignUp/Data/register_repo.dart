import 'package:turn_digital/Core/Networking/api_error_handler.dart';
import 'package:turn_digital/Core/Networking/api_result.dart';
import 'package:turn_digital/Features/SignUp/Data/Models/register_request_body_model.dart';
import 'package:turn_digital/Features/SignUp/Data/Models/register_response_model.dart';
import 'package:turn_digital/Features/SignUp/Data/register_services.dart';

class SignUpRepo {
  final RegisterServices _registerServices;

  SignUpRepo(RegisterServices registerServices)
    : _registerServices = registerServices;

  Future<ApiResult<RegisterResponseModel>> signup({
    required RegisterRequestBodyModel registerRequestBody,
  }) async {
    try {
      final response = await _registerServices.signup(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
