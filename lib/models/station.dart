class StationModel {
  String name;
  int count;

  StationModel.fromJson(dynamic data){
    assert(data != null);

    name = data['stationName'];
    count = data['count'];
  }
}
