import 'dart:convert';
import 'dart:io';

import 'package:ashwin_api/widgets/bound_widget.dart';
import 'package:ashwin_api/widgets/leg_widget.dart';
import 'package:flutter/material.dart';
import 'models/response_model.dart';
import 'network/http_network.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Api Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   RoutesData? routesData;
  void _incrementCounter() async {
    var data= (await  Network().fetchData());
    if(data.isNotEmpty){
      routesData= RoutesData.fromJson(jsonDecode(data));
    }
    setState(() {
      routesData= RoutesData.fromJson(jsonDecode(data));
    });

  }
  @override
  void initState() {
    _incrementCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         title: Text(widget.title),
      ),

      body: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        child:  routesData!= null?
        routesList(routesData!.routes)
            : Center(child: CircularProgressIndicator())
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

   Widget routesList(List<RoutesList> routesList){
    return Container(
      child: ListView.builder(
        itemCount:routesList.length ,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context,i){
        return Column(
          children: [
            BoundWidget( boundData: routesList[i].bounds),
            SizedBox(height: 8,),
            LegListWidget(stepsData: routesList[i].legs)
          ],
        );
      }),
    );
   }

}
