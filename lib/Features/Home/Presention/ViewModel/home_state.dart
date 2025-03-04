import 'package:equatable/equatable.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';

class HomeState extends Equatable {
  final List<Events> eventsList;
  final RequestStatus requestStatus;
  final String responseMessage;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  const HomeState({
    required this.eventsList,
    required this.requestStatus,
    required this.responseMessage,
    this.currentPage = 1,
    this.hasMore = false,
    this.isLoadingMore = false,
  });

  factory HomeState.initial() {
    return HomeState(
      responseMessage: '',
      requestStatus: RequestStatus.initial,
      eventsList: [],
      currentPage: 1,
      hasMore: false,
      isLoadingMore: false,
    );
  }

  HomeState copyWith({
    List<Events>? eventsList,
    RequestStatus? requestStatus,
    String? responseMessage,
    int? currentPage,
    bool? isLoadingMore,
    bool? hasMore,
  }) {
    return HomeState(
      eventsList: eventsList ?? this.eventsList,
      requestStatus: requestStatus ?? this.requestStatus,
      responseMessage: responseMessage ?? this.responseMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [
    responseMessage,
    requestStatus,
    eventsList,
    currentPage,
    hasMore,
    isLoadingMore,
  ];
}
