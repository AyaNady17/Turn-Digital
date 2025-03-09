import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:turn_digital/Core/Database/Local%20Database%20Models/local_event_model.dart';

class HiveService {
  static const String localEventBoxName = 'saved_LocalEvent';

  static Future<void> initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(LocalEventAdapter());
  }

  static Future<void> saveEvent(LocalEvent event) async {
    var box = await Hive.openBox<LocalEvent>(localEventBoxName);
    if (!box.values.any((e) => e.eventId == event.eventId)) {
      await box.add(event);
    }
  }

  static Future<List<LocalEvent>> getSavedLocalEvent() async {
    var box = await Hive.openBox<LocalEvent>(localEventBoxName);
    return box.values.toList();
  }

  static Future<void> removeEvent(int eventId) async {
    var box = await Hive.openBox<LocalEvent>(localEventBoxName);
    final eventKey = box.keys.firstWhere(
      (key) => box.get(key)!.eventId == eventId,
      orElse: () => null,
    );
    if (eventKey != null) {
      await box.delete(eventKey);
    }
  }

  static Future<void> clearAllLocalEvent() async {
    var box = await Hive.openBox<LocalEvent>(localEventBoxName);
    await box.clear();
  }
}
