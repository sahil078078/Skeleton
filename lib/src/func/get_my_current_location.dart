//package:geolocator/geolocator.dart
// Future<Position?> getMyCurrentLocation({LocationAccuracy accuracy = LocationAccuracy.best}) async {
//   LocationPermission permission = await Geolocator.checkPermission();
//   Position? myPosition;

//   if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
//     myPosition = await _getPosition(accuracy);
//   } else {
//     final locationPermission = await AppPermission.locationPermission();
//     if (locationPermission) {
//       myPosition = await _getPosition(accuracy);
//     }
//   }

//   return myPosition;
// }

// Future<Position> _getPosition(LocationAccuracy accuracy) async => await Geolocator.getCurrentPosition(
//       locationSettings: LocationSettings(accuracy: accuracy),
//     );
