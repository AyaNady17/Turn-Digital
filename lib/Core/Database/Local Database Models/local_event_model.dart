import 'package:hive/hive.dart';

part 'local_event_model.g.dart';

@HiveType(typeId: 1)
class LocalEvent {
  @HiveField(0)
  int eventId;

  @HiveField(1)
  String picture;

  @HiveField(2)
  String date;

  @HiveField(3)
  String title;

  @HiveField(4)
  String address;

  @HiveField(5)
  int numberOfGoing;

  LocalEvent({
    required this.eventId,
    required this.picture,
    required this.date,
    required this.title,
    required this.address,
    required this.numberOfGoing,
  });
}
