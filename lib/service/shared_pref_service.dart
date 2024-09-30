// class SharedPref {
//   SharedPref._();
//   factory SharedPref() => SharedPref._();

//   SharedPreferences? _pref;

//   Future<void> initialization() async {
//     _pref ??= await SharedPreferences.getInstance();
//     appPrint('_pref = $_pref');
//   }

//   //! GETTERS
//   int get currentLocationID => _pref?.getInt(currentLocationIDKey) ?? 0;

//   //! SETTERS
//   set currentLocationID(int value) => _pref?.setInt(currentLocationIDKey, value);

//   //! Strings
//   static const currentLocationIDKey = 'app_sahil_interview';
// }

// final sharedPref = SharedPref();
