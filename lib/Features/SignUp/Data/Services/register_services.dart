import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:turn_digital/Core/Networking/api_constants.dart';
import 'package:turn_digital/Features/SignUp/Data/Models/register_request_body_model.dart';
import 'package:turn_digital/Features/SignUp/Data/Models/register_response_model.dart';

part 'register_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RegisterServices {
  factory RegisterServices(Dio dio, {String baseUrl}) = _RegisterServices;

  @POST(ApiConstants.signUpEndPoint)
  Future<RegisterResponseModel> signup(
    @Body() RegisterRequestBodyModel registerRequestBodyModel,
  );
}
