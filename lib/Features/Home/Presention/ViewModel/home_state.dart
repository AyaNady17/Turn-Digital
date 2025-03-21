import 'package:equatable/equatable.dart';
import 'package:turn_digital/Core/Database/Local%20Database%20Models/local_event_model.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_event_details_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_organizer_details_reponse_model.dart';

class HomeState extends Equatable {
  final List<Events> eventsList;
  final RequestStatus requestStatus;
  final RequestStatus requestStatusOrganizer;
  final String responseMessage;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;
  final EventDetailsModel? eventDetails;
  final RequestStatus eventDetailsRequestStatus;
  final OrganizerDetailsModel? organizerModel;
  final bool isAlertSet;
  final List<LocalEvent> savedEvents;

  const HomeState({
    required this.eventsList,
    required this.requestStatus,
    required this.responseMessage,
    this.requestStatusOrganizer = RequestStatus.initial,
    this.currentPage = 1,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.eventDetails,
    this.eventDetailsRequestStatus = RequestStatus.initial,
    this.organizerModel,
    this.isAlertSet = false,
    this.savedEvents = const [],
  });

  factory HomeState.initial() {
    return HomeState(
      responseMessage: '',
      requestStatus: RequestStatus.initial,
      requestStatusOrganizer: RequestStatus.initial,
      eventsList: [],
      currentPage: 1,
      hasMore: false,
      isLoadingMore: false,
      eventDetails: null,
      eventDetailsRequestStatus: RequestStatus.initial,
      organizerModel: null,
      isAlertSet: false,
      savedEvents: [],
    );
  }

  HomeState copyWith({
    List<Events>? eventsList,
    RequestStatus? requestStatus,
    String? responseMessage,
    int? currentPage,
    bool? isLoadingMore,
    bool? hasMore,
    EventDetailsModel? eventDetails,
    RequestStatus? eventDetailsRequestStatus,
    RequestStatus? requestStatusOrganizer,
    OrganizerDetailsModel? organizerModel,
    bool? isAlertSet,
    List<LocalEvent>? savedEvents,
  }) {
    return HomeState(
      eventsList: eventsList ?? this.eventsList,
      requestStatus: requestStatus ?? this.requestStatus,
      responseMessage: responseMessage ?? this.responseMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      eventDetails: eventDetails ?? this.eventDetails,
      eventDetailsRequestStatus:
          eventDetailsRequestStatus ?? this.eventDetailsRequestStatus,
      requestStatusOrganizer:
          requestStatusOrganizer ?? this.requestStatusOrganizer,
      organizerModel: organizerModel ?? this.organizerModel,
      isAlertSet: isAlertSet ?? this.isAlertSet,
      savedEvents: savedEvents ?? this.savedEvents,
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
    eventDetails,
    eventDetailsRequestStatus,
    requestStatusOrganizer,
    organizerModel,
    isAlertSet,
    savedEvents,
  ];
}
