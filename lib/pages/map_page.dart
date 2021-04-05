import 'dart:async';

import 'package:codigosqr/models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;




  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    final CameraPosition _posicionInicial = CameraPosition(

      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50.0
    );
    
    //Marcadores
    
    Set<Marker> markers = Set<Marker>();
      markers.add(new Marker(
        markerId: MarkerId('geo-location'),
        position: scan.getLatLng()
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
              icon: Icon(Icons.location_pin),
              onPressed: () async {


                  final GoogleMapController controller = await _controller.future;
                  controller.animateCamera(CameraUpdate.newCameraPosition(_posicionInicial));
                }

          )
        ],
      ),
      body: GoogleMap(
        compassEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: _posicionInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: (){
          setState(() {
            if ( mapType == MapType.normal){

              mapType = MapType.satellite;

            }else{

              mapType = MapType.normal;

            }

            setState(() {});
          });

        },
      ),
    );
  }


}
