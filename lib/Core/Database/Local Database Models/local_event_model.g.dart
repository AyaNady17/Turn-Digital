// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_event_model.dart';

class LocalEventAdapter extends TypeAdapter<LocalEvent> {
  @override
  final int typeId = 1;

  @override
  LocalEvent read(BinaryReader reader) {
    return LocalEvent(
      eventId: reader.readInt(),
      picture: reader.readString(),
      date: reader.readString(),
      title: reader.readString(),
      address: reader.readString(),
      numberOfGoing: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalEvent obj) {
    writer.writeInt(obj.eventId);
    writer.writeString(obj.picture);
    writer.writeString(obj.date);
    writer.writeString(obj.title);
    writer.writeString(obj.address);
    writer.writeInt(obj.numberOfGoing);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
