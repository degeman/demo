import 'package:flutter/material.dart';

import 'package:myfl/model/app_state_manager.dart';
import 'package:myfl/service/stations_service.dart';
import 'package:provider/provider.dart';

import '../model/derash_pages.dart';
import '../model/station.dart';
import '../model/station_manger.dart';

class StationScreen extends StatefulWidget {
  List<Station> stations;

  StationScreen({Key? key, required this.stations}) : super(key: key);

  static MaterialPage page(List<Station> stations) {
    return MaterialPage(
      name: DerashPages.stationpage,
      key: ValueKey(DerashPages.stationpage),
      child: StationScreen(stations: stations),
    );
  }

  @override
  State<StationScreen> createState() => _StationScreenState(stations: stations);
}

class _StationScreenState extends State<StationScreen> {
  List<Station> stations;

  _StationScreenState({required this.stations});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("life  really  sucks")),
      body: Builder(builder: (context) {
        return Padding(
            padding: EdgeInsets.all(20),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(stations[index].location),
                        subtitle: Text(stations[index].email),
                      ));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemCount: stations.length));
      }),
    );
  }
}
