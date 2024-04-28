import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/response_model.dart';

class LegListWidget extends StatelessWidget {
  List<Leg> stepsData = [];
  LegListWidget({required this.stepsData});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 8,bottom: 8),
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: stepsData.length,
              itemBuilder: (context, item) {
                return legsSummarWidget(stepsData[item]);
              }),
        ],
      ),
    );
  }

  Widget doubleTetwitHeaderWidget(String title, String name, String value) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 16), child: Text(title)),
          SizedBox(
            height: 8,
          ),
          nameAndValueWidget(name, value)
        ],
      ),
    );
  }

  Widget nameAndValueWidget(String name, String value) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name), Text(value)],
      ),
    );
  }

  Widget legsSummarWidget(Leg legData) {
    return Container(
      child: Column(
        children: [
          nameAndValueWidget("Start Address", legData.startAddress),
          nameAndValueWidget("End Address", legData.endAddress),
          doubleTetwitHeaderWidget("Distance", legData.distance.text,
              legData.distance.value.toString()),
          doubleTetwitHeaderWidget("Duration", legData.distance.text,
              legData.distance.value.toString()),
          doubleTetwitHeaderWidget(
            "Start Location ",
            "Lat " + legData.startLocation.lat.toString(),
            "Lang" + legData.startLocation.lng.toString(),
          ),
          doubleTetwitHeaderWidget(
            "End Location ",
            "Lat " + legData.endLocation.lat.toString(),
            "Lang" + legData.endLocation.lng.toString(),
          ),
          Text("Routes List"),
          legsStepsListWidget(legData.steps)
        ],
      ),
    );
  }

  Widget legsStepsListWidget(List<StepsData> steps) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: steps.length,
        itemBuilder: (context, item) {
          return  Container(
            child: Column(
              children: [
                nameAndValueWidget("Travel Mode", steps[item].travelMode),
                nameAndValueWidget("Meanuvar", steps[item].maneuver),
                doubleTetwitHeaderWidget("Distance", steps[item].distance.text,
                    steps[item].distance.value.toString()),
                doubleTetwitHeaderWidget("Duration", steps[item].duration.text,
                    steps[item].duration.value.toString()),
                doubleTetwitHeaderWidget(
                  "Start Location ",
                  "Lat " +  steps[item].startLocation.lat.toString(),
                  "Lang" +  steps[item].startLocation.lng.toString(),
                ),
                doubleTetwitHeaderWidget(
                  "End Location ",
                  "Lat " +  steps[item].endLocation.lat.toString(),
                  "Lang" +  steps[item].endLocation.lng.toString(),
                )
              ],
            ),
          );

        }, separatorBuilder: (BuildContext context, int index) {
          return Divider();
    },);
  }
}
