import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:turn_digital/Core/Networking/api_constants.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_event_details_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';

part 'home_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeServices {
  factory HomeServices(Dio dio, {String baseUrl}) = _HomeServices;

  @GET(ApiConstants.getEventsEndpoint)
  Future<GetEventsListResponseModel> getEventsList(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET(ApiConstants.getEventDetailsEndPoint)
  Future<GetEventDetailsResponseModel> getEventDetails(
    @Path('eventId') int eventId,
  );
}
