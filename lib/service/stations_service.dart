import 'dart:convert';

import 'package:myfl/model/app_state_manager.dart';

import '../model/station.dart';
import 'package:http/http.dart' as http;

class StationsService {
  List<Station> getStations() {
    return [
      Station(id: 1, email: "4kilo@gmail.com", location: "4 kilo"),
      Station(id: 1, email: "5kilo@gmail.com", location: "5 kilo"),
      Station(id: 1, email: "6kilo@gmail.com", location: "6 kilo"),
      Station(id: 1, email: "7kilo@gmail.com", location: "7 kilo")
    ];
  }
}
