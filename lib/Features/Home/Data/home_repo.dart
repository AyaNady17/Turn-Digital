import 'package:turn_digital/Core/Networking/api_error_handler.dart';
import 'package:turn_digital/Core/Networking/api_result.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';
import 'package:turn_digital/Features/Home/Data/home_services.dart';

class HomeRepo {
  final HomeServices _homeServices;

  HomeRepo(HomeServices homeServices) : _homeServices = homeServices;

  Future<ApiResult<GetEventsListResponseModel>> getEventsList({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _homeServices.getEventsList(page, limit);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
