import 'package:flutter/widgets.dart';

import 'package:myfl/model/app_state_manager.dart';
import 'package:myfl/model/station.dart';
import 'package:myfl/service/stations_service.dart';

class StationManager extends ChangeNotifier {
  List<Station>? stations = StationsService().getStations();
  bool isUpdating;
}
