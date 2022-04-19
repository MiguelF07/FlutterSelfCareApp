import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class FourthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'First Tab',
          ),
        ],
      ),
    );
  }
}

// // class FourthTab extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Google Maps Demo',
// //       home: MapSample(),
// //     );
// //   }
// // }

// // class MapSample extends StatefulWidget {
// //   @override
// //   State<MapSample> createState() => MapSampleState();
// // }

// // class MapSampleState extends State<MapSample> {
// //   Completer<GoogleMapController> _controller = Completer();

// //   static final CameraPosition _kGooglePlex = CameraPosition(
// //     target: LatLng(37.42796133580664, -122.085749655962),
// //     zoom: 14.4746,
// //   );

// //   static final CameraPosition _kLake = CameraPosition(
// //       bearing: 192.8334901395799,
// //       target: LatLng(37.43296265331129, -122.08832357078792),
// //       tilt: 59.440717697143555,
// //       zoom: 19.151926040649414);

// //   @override
// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //       body: GoogleMap(
// //         mapType: MapType.hybrid,
// //         initialCameraPosition: _kGooglePlex,
// //         onMapCreated: (GoogleMapController controller) {
// //           _controller.complete(controller);
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton.extended(
// //         onPressed: _goToTheLake,
// //         label: Text('To the lake!'),
// //         icon: Icon(Icons.directions_boat),
// //       ),
// //     );
// //   }

// //   Future<void> _goToTheLake() async {
// //     final GoogleMapController controller = await _controller.future;
// //     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// //   }
// // }

// class FourthTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
//   late GoogleMapController _controller;
//   Location _location = Location();
//   Set<Marker> _markers = {};

//   void _onMapCreated(GoogleMapController _cntlr) {
//     _controller = _cntlr;
//     _location.onLocationChanged.listen((l) {
//       _controller.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
//         ),
//       );
//       _markers.add(Marker(
//           markerId: MarkerId('Home'),
//           position: LatLng(l.latitude ?? 0.0, l.longitude ?? 0.0)));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             GoogleMap(
//               initialCameraPosition:
//                   CameraPosition(target: _initialcameraposition),
//               mapType: MapType.normal,
//               onMapCreated: _onMapCreated,
//               myLocationEnabled: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }