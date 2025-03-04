// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_events_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEventsListResponseModel _$GetEventsListResponseModelFromJson(
  Map<String, dynamic> json,
) => GetEventsListResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  responseData: ResponseData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetEventsListResponseModelToJson(
  GetEventsListResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.responseData,
};

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
  currentPage: (json['current_page'] as num).toInt(),
  pageSize: (json['page_size'] as num).toInt(),
  totalItems: (json['total_items'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  events:
      (json['events'] as List<dynamic>)
          .map((e) => Events.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
      'total_items': instance.totalItems,
      'total_pages': instance.totalPages,
      'events': instance.events,
    };

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
  eventId: (json['event_id'] as num).toInt(),
  picture: json['picture'] as String,
  date: json['date'] as String,
  title: json['title'] as String,
  address: json['address'] as String,
  numberOfGoing: (json['number_of_going'] as num).toInt(),
  organizer: Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
  'event_id': instance.eventId,
  'picture': instance.picture,
  'date': instance.date,
  'title': instance.title,
  'address': instance.address,
  'number_of_going': instance.numberOfGoing,
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
