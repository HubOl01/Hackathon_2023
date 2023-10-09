import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

  LatLng point = LatLng(56.9972, 40.9714);
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      double long = 49.5;
  double lat = -0.09;
  var location = [];

    return Scaffold(
      body: FlutterMap(
    options: MapOptions(
      center: LatLng(56.9972, 40.9714),
      zoom: 3,
      maxZoom: 18.49,
      
      onTap: (p, s) async {
              location = await Geocoder.local.findAddressesFromCoordinates(
                  new Coordinates(s.latitude, s.longitude));

              setState(() {
                point = s;
                print(s);
              });

              print(
                  "${location.first.countryName} - ${location.first.addressLine}");
            },
    ),
    nonRotatedChildren: [
      // RichAttributionWidget(
      //   attributions: [
      //     TextSourceAttribution(
      //       'OpenStreetMap contributors',
      //       onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
      //     ),
      //   ],
      // ),
    ],
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        // urlTemplate:'https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
        
        userAgentPackageName: 'com.example.app',
        subdomains: ['a', 'b', 'c'],
        maxNativeZoom: 20
      ),
      MarkerLayer(
         markers: [
                Marker(
                  rotate: true,
                  width: 30.0,
                  height: 30.0,
                  point: point,
                  builder: (ctx) => InkWell(
                    
                    child: Container(
                      // height: 10,
                      // width: 10,
                      color: Colors.black
                      // child: 
                    ),
                  ),
                )
              ],
      )
    ],
      )
    );
  }
}