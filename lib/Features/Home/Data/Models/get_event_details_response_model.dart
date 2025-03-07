import 'package:json_annotation/json_annotation.dart';

part 'get_event_details_response_model.g.dart';

@JsonSerializable()
class GetEventDetailsResponseModel {
  final bool success;
  final String message;
  @JsonKey(name: 'data')
  final EventDetailsModel eventDetailsModel;

  GetEventDetailsResponseModel({
    required this.success,
    required this.message,
    required this.eventDetailsModel,
  });

  factory GetEventDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetEventDetailsResponseModelFromJson(json);
}

@JsonSerializable()
class EventDetailsModel {
  @JsonKey(name: 'event_id')
  final int eventId;
  final String picture;
  final String date;
  final String title;
  final String address;
  @JsonKey(name: 'number_of_going')
  final int numberOfGoing;
  @JsonKey(name: 'address_title')
  final String addressTitle;
  final String latitude;
  final String longitude;
  @JsonKey(name: 'about_event')
  final String aboutEvent;
  @JsonKey(name: 'event_price')
  final String eventPrice;
  final Organizer organizer;

  EventDetailsModel({
    required this.eventId,
    required this.picture,
    required this.date,
    required this.title,
    required this.address,
    required this.numberOfGoing,
    required this.addressTitle,
    required this.latitude,
    required this.longitude,
    required this.aboutEvent,
    required this.eventPrice,
    required this.organizer,
  });

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsModelFromJson(json);
}

@JsonSerializable()
class Organizer {
  final int id;
  final String name;
  final String picture;

  Organizer({required this.id, required this.name, required this.picture});

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);
}
