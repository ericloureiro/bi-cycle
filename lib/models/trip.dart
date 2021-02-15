import 'package:intl/intl.dart';

class TripModel {
  double distanceTravelled;
  int totalTrips;

  NumberFormat formatter = NumberFormat("#,###.##", "en_US");

  String get distanceText => '${formatter.format(distanceTravelled)} mi';
  String get countText => formatter.format(totalTrips);

  TripModel(this.distanceTravelled, this.totalTrips);
}
