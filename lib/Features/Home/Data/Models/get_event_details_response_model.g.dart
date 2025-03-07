// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_event_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEventDetailsResponseModel _$GetEventDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetEventDetailsResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  eventDetailsModel: EventDetailsModel.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetEventDetailsResponseModelToJson(
  GetEventDetailsResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.eventDetailsModel,
};

EventDetailsModel _$EventDetailsModelFromJson(Map<String, dynamic> json) =>
    EventDetailsModel(
      eventId: (json['event_id'] as num).toInt(),
      picture: json['picture'] as String,
      date: json['date'] as String,
      title: json['title'] as String,
      address: json['address'] as String,
      numberOfGoing: (json['number_of_going'] as num).toInt(),
      addressTitle: json['address_title'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      aboutEvent: json['about_event'] as String,
      eventPrice: json['event_price'] as String,
      organizer: Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDetailsModelToJson(EventDetailsModel instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'picture': instance.picture,
      'date': instance.date,
      'title': instance.title,
      'address': instance.address,
      'number_of_going': instance.numberOfGoing,
      'address_title': instance.addressTitle,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'about_event': instance.aboutEvent,
      'event_price': instance.eventPrice,
      'organizer': instance.organizer,
    };

Organizer _$OrganizerFromJson(Map<String, dynamic> json) => Organizer(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  picture: json['picture'] as String,
);

Map<String, dynamic> _$OrganizerToJson(Organizer instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'picture': instance.picture,
};
