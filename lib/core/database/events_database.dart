import 'package:gatherly/core/data/events_model.dart';
import 'package:gatherly/core/database/event_fields.dart';
import 'package:sqflite/sqflite.dart';

class EventsDatabase {
  static final EventsDatabase instance = EventsDatabase._internal();

  static Database? _database;
  EventsDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/${EventFields.tableName}.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
        CREATE TABLE notes (
          ${EventFields.id} ${EventFields.idType},
          ${EventFields.eventImage} ${EventFields.textType},
          ${EventFields.eventName} ${EventFields.textType},
          ${EventFields.eventStartDate} ${EventFields.textType},
          ${EventFields.eventEndDate} ${EventFields.textType},
          ${EventFields.eventVenue} ${EventFields.textType},
          ${EventFields.files} ${EventFields.textType}
        )
      ''');
  }

  /*Future<EventsModel> create(EventsModel events) async {
    final db = await instance.database;
    final id = await db.insert(EventFields.tableName, events.toJson());
    return events.copy(id: id);
  }*/
}