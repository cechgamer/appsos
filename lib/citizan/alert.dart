import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  Completer<GoogleMapController>_controllerGoogleMap=Completer();
  int val = 0;
  int val1 = 0;
  int val2 = 1;
 late GoogleMapController newGoogleMapController;
  static double _upperValue = 10.0;
  static double _lowerValue = 1.0;
bool circle=false;
  // RangeValues rangeValues=new RangeValues(_lowerValue, _upperValue);
  double values = 10;
 static final CameraPosition _googlePlex=CameraPosition(target: LatLng(16.2902,63.5887),zoom: 12);
    late Position currentPosition;
    void locatePosition()async{
      Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentPosition=position;
      LatLng latLngPosition=LatLng(position.longitude,position.longitude);
      CameraPosition cameraPosition=new CameraPosition(target: latLngPosition,zoom: 13);
      newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5f1090),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Distancia de Alerta',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Icon(
                  Icons.sd_card_alert_sharp,
                  color: Colors.white,
                  size: 60,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Radio de alerta sugerido:  \n    10 personas más cercanas',
                  style: TextStyle(color: Colors.white),
                ),
                Radio(
                  value: val2,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {

                      val = 1;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Radio de Alerta Manual',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Radio(
                    value: val2,
                    groupValue: val1,
                    onChanged: (value) {
                      setState(() {
                         circle=true;
                        val1 = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    val = 0;
                    val1 = 0;
                    circle=false;
                  });
                },
                child: Text(
                  "Limpiar",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                    onChangeStart: (v) {
                      setState(() {});
                    },
                    value: values,
                    max: _upperValue,
                    min: _lowerValue,
                    onChanged: (v) {
                      setState(() {
                        values = v;
                        print(values);
                      });
                    }),
                Text(
                  "${values.toInt()} KM",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Stack(
              children:[



                Container(
                color: Colors.white,
                height: 400,
                child:


                    GoogleMap(
                               mapType: MapType.normal,
                                myLocationEnabled: true,
                                zoomGesturesEnabled: true,
                                zoomControlsEnabled: true,
                      myLocationButtonEnabled: true,
                      mapToolbarEnabled: true,
                      scrollGesturesEnabled: true,

                      initialCameraPosition: _googlePlex,
                      onMapCreated: (GoogleMapController controller){
                                        _controllerGoogleMap.complete(controller);
                                        newGoogleMapController =controller;
                                        locatePosition();

                      },



                  ),
                ),Visibility(
                  visible: circle,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 185.0,),
                    child: Center(child: Container(
                            width: values*10+20,
                      height: values*10+20,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(170)),

                      )),
                  ),
                ),
           ] ),

            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: 'Guardado');
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 100,
                  height: 30,
                  color: Colors.white,
                  child: Center(child: Text("Guardar")),
                )),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
