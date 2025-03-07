// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organizer_details_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrganizerDetailsReponseModel _$GetOrganizerDetailsReponseModelFromJson(
  Map<String, dynamic> json,
) => GetOrganizerDetailsReponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  organizerDetailsModel: OrganizerDetailsModel.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetOrganizerDetailsReponseModelToJson(
  GetOrganizerDetailsReponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.organizerDetailsModel,
};

OrganizerDetailsModel _$OrganizerDetailsModelFromJson(
  Map<String, dynamic> json,
) => OrganizerDetailsModel(
  name: json['name'] as String,
  picture: json['picture'] as String,
  numberOfFollowing: (json['number_of_following'] as num).toInt(),
  numberOfFollowers: (json['number_of_followers'] as num).toInt(),
  about: json['about'] as String,
  events:
      (json['events'] as List<dynamic>)
          .map((e) => Events.fromJson(e as Map<String, dynamic>))
          .toList(),
  reviews:
      (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$OrganizerDetailsModelToJson(
  OrganizerDetailsModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'picture': instance.picture,
  'number_of_following': instance.numberOfFollowing,
  'number_of_followers': instance.numberOfFollowers,
  'about': instance.about,
  'events': instance.events,
  'reviews': instance.reviews,
};

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  reviewId: (json['review_id'] as num).toInt(),
  reviewerPicture: json['reviewer_picture'] as String,
  reviewerName: json['reviewer_name'] as String,
  rate: (json['rate'] as num).toInt(),
  review: json['review'] as String,
  reviewDate: json['reviewDate'] as String,
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'review_id': instance.reviewId,
  'reviewer_picture': instance.reviewerPicture,
  'reviewer_name': instance.reviewerName,
  'rate': instance.rate,
  'review': instance.review,
  'reviewDate': instance.reviewDate,
};
