import 'package:json_annotation/json_annotation.dart';

part 'get_organizer_details_reponse_model.g.dart';

@JsonSerializable()
class GetOrganizerDetailsReponseModel {
  bool success;
  String message;
  @JsonKey(name: 'data')
  OrganizerDetailsModel organizerDetailsModel;

  GetOrganizerDetailsReponseModel({
    required this.success,
    required this.message,
    required this.organizerDetailsModel,
  });

  factory GetOrganizerDetailsReponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrganizerDetailsReponseModelFromJson(json);
}

@JsonSerializable()
class OrganizerDetailsModel {
  String name;
  String picture;
  @JsonKey(name: 'number_of_following')
  int numberOfFollowing;
  @JsonKey(name: 'number_of_followers')
  int numberOfFollowers;
  String about;
  List<OrganizerEvent> events;
  List<Review> reviews;

  factory OrganizerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizerDetailsModelFromJson(json);

  OrganizerDetailsModel({
    required this.name,
    required this.picture,
    required this.numberOfFollowing,
    required this.numberOfFollowers,
    required this.about,
    required this.events,
    required this.reviews,
  });
}

@JsonSerializable()
class Review {
  @JsonKey(name: 'review_id')
  int reviewId;
  @JsonKey(name: 'reviewer_picture')
  String reviewerPicture;
  @JsonKey(name: 'reviewer_name')
  String reviewerName;
  int rate;
  String review;
  @JsonKey(name: 'review_date')
  String reviewDate;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Review({
    required this.reviewId,
    required this.reviewerPicture,
    required this.reviewerName,
    required this.rate,
    required this.review,
    required this.reviewDate,
  });
}

@JsonSerializable()
class OrganizerEvent {
  @JsonKey(name: 'id')
  int eventId;
  @JsonKey(name: 'picture')
  String eventPicture;
  @JsonKey(name: 'date')
  String eventDate;
  @JsonKey(name: 'title')
  String eventName;
  factory OrganizerEvent.fromJson(Map<String, dynamic> json) =>
      _$OrganizerEventFromJson(json);

  OrganizerEvent({
    required this.eventId,
    required this.eventName,
    required this.eventPicture,
    required this.eventDate,
  });
}
