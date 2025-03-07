import 'package:turn_digital/Core/Networking/api_error_handler.dart';
import 'package:turn_digital/Core/Networking/api_result.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_event_details_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Services/home_services.dart';

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

  Future<ApiResult<GetEventDetailsResponseModel>> getEventDetails({
    required int eventId,
  }) async {
    try {
      final response = await _homeServices.getEventDetails(eventId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
