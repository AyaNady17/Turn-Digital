import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_event_details_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_event_details_response_model.dart'
    as get_organizer_details_reponse_model;
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_organizer_details_reponse_model.dart'
    as get_organizer_details_reponse_model;
import 'package:turn_digital/Features/Home/Data/Repository/home_repo.dart';
import 'package:turn_digital/Features/Home/Data/Services/home_services.dart';

import 'home_repo_test.mocks.dart';

@GenerateMocks([HomeServices])
void main() {
  late MockHomeServices mockHomeServices;
  late HomeRepo homeRepo;

  setUp(() {
    mockHomeServices = MockHomeServices();
    homeRepo = HomeRepo(mockHomeServices);
  });

  group('HomeRepo', () {
    test('getEventsList returns success', () async {
      final responseModel = GetEventsListResponseModel(
        success: true,
        message: 'List loaded successfully',
        responseData: ResponseData(
          currentPage: 1,
          pageSize: 10,
          totalItems: 1,
          totalPages: 1,
          events: [],
        ),
      );
      when(
        mockHomeServices.getEventsList(1, 10),
      ).thenAnswer((_) async => responseModel);

      dynamic result = await homeRepo.getEventsList(page: 1, limit: 10);

      result.when(
        success: (data) => result = data,
        failure: (error) => result = error,
      );

      expect(result.success, true);
      expect(result, responseModel);
    });

    test('getEventsList returns failure on error', () async {
      when(
        mockHomeServices.getEventsList(1, 10),
      ).thenThrow(DioExceptionType.connectionError);

      dynamic result = await homeRepo.getEventsList(page: 1, limit: 10);

      result.when(
        success: (data) => result = data,
        failure: (error) => result = error,
      );

      expect(result.errors.first, "Unknown error occurred");
    });

    test('getEventDetails returns success', () async {
      final responseModel = GetEventDetailsResponseModel(
        success: true,
        message: 'List loaded successfully',
        eventDetailsModel: EventDetailsModel(
          eventId: 1,
          title: 'Event 1',
          aboutEvent: 'Description 1',
          date: '2021-01-01',
          latitude: '1',
          longitude: '1',
          address: 'Location 1',
          picture: 'Picture 1',
          numberOfGoing: 1,
          addressTitle: 'Address 1',
          eventPrice: '1',
          organizer: get_organizer_details_reponse_model.Organizer(
            id: 1,
            name: 'Organizer 1',
            picture: 'Picture 1',
          ),
        ),
      );
      when(
        mockHomeServices.getEventDetails(1),
      ).thenAnswer((_) async => responseModel);

      dynamic result = await homeRepo.getEventDetails(eventId: 1);

      result.when(
        success: (data) => result = data,
        failure: (error) => result = error,
      );

      expect(result.success, true);
      expect(result, responseModel);
    });

    test('getEventDetails returns failure on error', () async {
      when(mockHomeServices.getEventDetails(1)).thenThrow(Exception('Error'));

      dynamic result = await homeRepo.getEventDetails(eventId: 1);

      result.when(
        success: (data) => result = data,
        failure: (error) => result = error,
      );

      expect(result.errors.first, "Unknown error occurred");
    });

    test('getOrganizerDetails returns success', () async {
      final responseModel =
          get_organizer_details_reponse_model.GetOrganizerDetailsReponseModel(
            success: true,
            message: ' loaded successfully',
            organizerDetailsModel:
                get_organizer_details_reponse_model.OrganizerDetailsModel(
                  numberOfFollowers: 1,
                  numberOfFollowing: 1,
                  about: 'Description 1',
                  events: [],
                  reviews: [],
                  name: 'Organizer 1',
                  picture: 'Picture 1',
                ),
          );
      when(
        mockHomeServices.getOrganizerDetails(1),
      ).thenAnswer((_) async => responseModel);

      dynamic result = await homeRepo.getOrganizerDetails(organizerId: 1);

      result.when(
        success: (data) => result = data,
        failure: (error) => result = error,
      );

      expect(result.success, true);
      expect(result, responseModel);
    });

    test('getOrganizerDetails returns failure on error', () async {
      when(
        mockHomeServices.getOrganizerDetails(1),
      ).thenThrow(Exception('Error'));

      dynamic result = await homeRepo.getOrganizerDetails(organizerId: 1);

      result.when(
        success: (data) => result = data,
        failure: (error) => result = error,
      );

      expect(result.errors.first, "Unknown error occurred");
    });
  });
}
