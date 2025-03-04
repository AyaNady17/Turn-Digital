import 'package:bloc/bloc.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/Home/Data/home_repo.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  final HomeRepo _homeRepo;

  Future<void> getEvents({int page = 1, bool isLoadMore = false}) async {
    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true));
    } else {
      emit(state.copyWith(requestStatus: RequestStatus.loading));
    }

    final limit = 10;
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
}
