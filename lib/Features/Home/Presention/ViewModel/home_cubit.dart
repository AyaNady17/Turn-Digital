import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Notifications/local_notificatons_services.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Repository/home_repo.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/event_card.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  final NotificationService _notificationService;
  HomeCubit(this._homeRepo, this._notificationService)
    : super(HomeState.initial());

  Future<void> getEvents({
    int page = 1,
    bool isLoadMore = false,
    int limit = 6,
  }) async {
    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true));
    } else {
      emit(state.copyWith(requestStatus: RequestStatus.loading));
    }

    final response = await _homeRepo.getEventsList(page: page, limit: limit);

    response.when(
      success: (response) {
        final newEvents = response.responseData.events;
        emit(
          state.copyWith(
            requestStatus: RequestStatus.success,
            eventsList:
                isLoadMore ? [...state.eventsList, ...newEvents] : newEvents,
            currentPage: page,
            hasMore:
                newEvents.length ==
                limit, // If the response is full, there might be more
            isLoadingMore: false,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            requestStatus: RequestStatus.failure,
            responseMessage: error.message,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  Future<void> getEventDetails(int eventId) async {
    emit(state.copyWith(eventDetailsRequestStatus: RequestStatus.loading));
    final response = await _homeRepo.getEventDetails(eventId: eventId);
    response.when(
      success: (response) {
        emit(
          state.copyWith(
            eventDetailsRequestStatus: RequestStatus.success,
            eventDetails: response.eventDetailsModel,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            eventDetailsRequestStatus: RequestStatus.failure,
            responseMessage: error.message,
          ),
        );
      },
    );
  }

  Future<void> setEventAlert({required Events event}) async {
    emit(state.copyWith(isAlertSet: true));
    await _notificationService.scheduleNotification(
      title: event.title,
      body: event.address,
      eventDateTime: DateTime.parse(event.date),
      id: event.eventId,
    );
  }

  Future<void> shareEvent(dynamic event) async {
    final tempDir = await getTemporaryDirectory();
    final filePath = "${tempDir.path}/${event.title}.jpg";

    await Dio().download(event.picture, filePath);

    final String shareText =
        "${event.title}\n📍 Location: ${event.address}\n🗓 Date: ${extractDateParts(event.date)['month']} ${extractDateParts(event.date)['date']}\n\nCheck out this event!";

    await Share.shareXFiles(
      [XFile(filePath)],
      text: shareText,
      subject: event.title,
    );
  }

  Future<void> getOrganizerDetails(int organizerId) async {
    emit(state.copyWith(requestStatusOrganizer: RequestStatus.loading));
    final response = await _homeRepo.getOrganizerDetails(
      organizerId: organizerId,
    );
    response.when(
      success: (response) {
        emit(
          state.copyWith(
            requestStatusOrganizer: RequestStatus.success,
            organizerModel: response.organizerDetailsModel,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            requestStatusOrganizer: RequestStatus.failure,
            responseMessage: error.message,
          ),
        );
      },
    );
  }
}
