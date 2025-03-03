// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RegisterServices implements RegisterServices {
  _RegisterServices(this._dio, {this.baseUrl}) {
    baseUrl ??= ApiConstants.baseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RegisterResponseModel> signup(
    RegisterRequestBodyModel registerRequestBodyModel,
  ) async {
    final _data = registerRequestBodyModel.toJson();
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<RegisterResponseModel>(
        Options(method: 'POST', headers: <String, dynamic>{})
            .compose(_dio.options, ApiConstants.signUpEndPoint, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = RegisterResponseModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      requestOptions = requestOptions.copyWith(responseType: ResponseType.json);
    }
    return requestOptions;
  }
}
