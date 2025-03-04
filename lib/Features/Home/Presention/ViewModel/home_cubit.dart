import 'package:bloc/bloc.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/Home/Data/home_repo.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  final HomeRepo _homeRepo;

  Future<void> getEvents({int page = 1, int limit = 10}) async {
    emit(state.copyWith(requestStatus: RequestStatus.loading));

    final response = await _homeRepo.getEventsList(page: page, limit: limit);

    response.when(
      success: (response) async {
        emit(
          state.copyWith(
            requestStatus: RequestStatus.success,
            eventsList: response.responseData.events,
            responseMessage: response.message,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            responseMessage: error.errors.first,
            requestStatus: RequestStatus.failure,
          ),
        );
      },
    );
  }
}
