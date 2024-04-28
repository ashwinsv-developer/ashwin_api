import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/response_model.dart';

class BoundWidget extends StatelessWidget{
  Bounds boundData;
  BoundWidget( {required this.boundData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      color: Colors.white,
      child: Column(
        children: [
          Text("Bound Data"),
          boundItemWidget("North East",boundData.northeast.lat.toString(),boundData.northeast.lng.toString()),
          boundItemWidget("South West",boundData.southwest.lat.toString(),boundData.southwest.lng.toString()),
        ],
      ),
    );
  }

  Widget boundItemWidget(String name , String lat , String long){
    return Container(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Lat"),
              Text("Long")
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(lat),
              Text(long)
            ],
          )
        ],
      ),
    );

  }
}

