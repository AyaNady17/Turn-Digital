import 'package:equatable/equatable.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';

class HomeState extends Equatable {
  final RequestStatus requestStatus;
  final String responseMessage;
  final List<Events> eventsList;

  const HomeState({
    this.responseMessage = '',
    this.requestStatus = RequestStatus.initial,
    this.eventsList = const [],
  });

  factory HomeState.initial() {
    return HomeState(
      responseMessage: '',
      requestStatus: RequestStatus.initial,
      eventsList: [],
    );
  }

  HomeState copyWith({
    String? responseMessage,
    RequestStatus? requestStatus,
    List<Events>? eventsList,
  }) {
    return HomeState(
      responseMessage: responseMessage ?? this.responseMessage,
      requestStatus: requestStatus ?? this.requestStatus,
      eventsList: eventsList ?? this.eventsList,
    );
  }

  @override
  List<Object?> get props => [responseMessage, requestStatus, eventsList];
}
