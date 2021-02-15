import 'station.dart';
import 'trip.dart';

class IndicatorModel {
  TripModel totalInformation;
  TripModel currentInformation;
  List<StationModel> pickupStations;
  List<StationModel> dropoutStations;

  IndicatorModel.fromJson(dynamic data) {
    assert(data != null);
    pickupStations = [];
    dropoutStations = [];

    totalInformation = TripModel(
      data['distanceTravelled'],
      data['totalTrips'],
    );
    currentInformation = TripModel(
      data['distanceTravelledCurrentYear'],
      data['totalTripsCurrentYear'],
    );

    for (dynamic station in data['topPickupStations']) {
      pickupStations.add(StationModel.fromJson(station));
    }

    pickupStations.sort((a, b) => b.count.compareTo(a.count));

    for (dynamic station in data['topDropoutStations']) {
      dropoutStations.add(StationModel.fromJson(station));
    }

    dropoutStations.sort((a, b) => b.count.compareTo(a.count));
  }
}
