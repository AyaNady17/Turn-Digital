import 'package:bloc/bloc.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/Home/Data/Repository/home_repo.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  final HomeRepo _homeRepo;

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
}
