import 'package:json_annotation/json_annotation.dart';

part 'get_events_list_response_model.g.dart';

@JsonSerializable()
class GetEventsListResponseModel {
  bool success;
  String message;
  @JsonKey(name: 'data')
  ResponseData responseData;

  GetEventsListResponseModel({
    required this.success,
    required this.message,
    required this.responseData,
  });

  factory GetEventsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetEventsListResponseModelFromJson(json);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: 'current_page')
  int currentPage;
  @JsonKey(name: 'page_size')
  int pageSize;
  @JsonKey(name: 'total_items')
  int totalItems;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<Events> events;

  ResponseData({
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
    required this.events,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
}

@JsonSerializable()
class Events {
  @JsonKey(name: 'event_id')
  int eventId;
  String picture;
  String date;
  String title;
  String address;
  @JsonKey(name: 'number_of_going')
  int numberOfGoing;
  Organizer organizer;

  Events({
    required this.eventId,
    required this.picture,
    required this.date,
    required this.title,
    required this.address,
    required this.numberOfGoing,
    required this.organizer,
  });

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);
}

@JsonSerializable()
class Organizer {
  int id;
  String name;
  String picture;

  Organizer({required this.id, required this.name, required this.picture});

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);
}
