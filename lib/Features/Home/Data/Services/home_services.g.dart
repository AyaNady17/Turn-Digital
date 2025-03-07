// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _HomeServices implements HomeServices {
  _HomeServices(this._dio, {this.baseUrl}) {
    baseUrl ??= ApiConstants.baseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetEventsListResponseModel> getEventsList(int page, int limit) async {
    final queryParameters = <String, dynamic>{'page': page, 'limit': limit};

    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<GetEventsListResponseModel>(
        Options(method: 'GET', headers: <String, dynamic>{})
            .compose(
              _dio.options,
              ApiConstants.getEventsEndpoint,
              queryParameters: queryParameters,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );

    final value = GetEventsListResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetEventDetailsResponseModel> getEventDetails(int eventId) async {
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<GetEventDetailsResponseModel>(
        Options(method: 'GET', headers: <String, dynamic>{})
            .compose(
              _dio.options,
              ApiConstants.getEventDetailsEndPoint.replaceFirst(
                '{eventId}',
                eventId.toString(),
              ),
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );

    final value = GetEventDetailsResponseModel.fromJson(_result.data!);
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
