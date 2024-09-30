

// class DatabaseService {
//   DatabaseService._();
//   static final instance = DatabaseService._();
//   factory DatabaseService() => instance;
//   Database? _database;

//   //! STORE CURRENT LOCATION DATA
//   //!-------------------------------------------------------
//   final _currentLocationInfoDBName = 'app_sahil_interview.db';
//   final _currentLocationTable = 'app_sahil_interview_table';  // CHANGE

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = '$dbPath/$_currentLocationInfoDBName';
//     appPrint('path : $path');

//     return await openDatabase(
//       path,
//       onCreate: _onCreate,
//       version: 1,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute(
//       """
//     CREATE TABLE $_currentLocationTable
//     (
//        id INTEGER PRIMARY KEY AUTOINCREMENT, 
//        location TEXT NOT NULL, 
//        items TEXT NOT NULL, 
//        latitude REAL NOT NULL,
//        longitude REAL NOT NULL,
//        is_active BOOLEAN NOT NULL
//     ) 
//     """,
//     );
//   }

//   //! READ
//   Future<List<ReminderModel>> readCurrentLocations() async {
//     appPrint('read readCurrentLocations');
//     final db = await instance.database;
//     const orderBy = "id DESC";
//     final reminders = await db.query(_currentLocationTable, orderBy: orderBy);
//     appPrint('read currentLocations : $reminders');
//     final result = List<ReminderModel>.from(reminders.map((e) => ReminderModel.fromJson(e)));
//     return result;
//   }

//   //! CREATE
//   Future<ReminderModel> addCurrentLocation(ReminderModel response) async {
//     appPrint('addCurrentLocation : ${response.toJson()}');
//     final db = await instance.database;
//     final id = await db.insert(_currentLocationTable, response.toJson());
//     appPrint('addCurrentLocation ID : $id');
//     return response.copy(id: id);
//   }

//   //!-------------------------------------------------------
//   //! UPDATE
//   Future<ReminderModel> updateCurrentLocation(ReminderModel response) async {
//     appPrint('updateCurrentLocation : ${response.toJson()}');
//     final db = await instance.database;
//     final id = await db.update(
//       _currentLocationTable,
//       response.toJson(),
//       where: 'id = ?',
//       whereArgs: [response.id],
//     );

//     appPrint('updateCurrentLocation ID : $id');
//     return response.copy(id: id);
//   }

//   //! Delete Reminder
//   Future<int> deleteCurrentLocation(int id) async {
//     final db = await instance.database;
//     final delID = await db.delete(
//       _currentLocationTable,
//       where: 'id = ?',
//       whereArgs: [id],
//     );

//     return delID;
//   }

// }
