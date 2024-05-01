// import 'package:dartz/dartz.dart';
// import 'package:location/location.dart';
//
// import '../error/failures.dart';
//
// class LocationHandler {
//   bool _serviceEnabled = false;
//   late PermissionStatus _permissionGranted;
//   LocationData? _locationData;
//
//   Future<Either<Failure, LocationData?>> getCurrentLocation() async {
//     Location location = Location();
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {}
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = (await location.requestPermission());
//       if (_permissionGranted != PermissionStatus.granted) {}
//     }
//     _locationData = (await location.getLocation());
//     return Right(_locationData);
//   }
// }
