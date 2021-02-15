import 'package:bicycle/models/station.dart';
import 'package:bicycle/widgets/station_card.dart';
import 'package:flutter/material.dart';

class StationStack extends StatelessWidget {
  final String title;
  final List<StationModel> stations;

  const StationStack({
    Key key,
    @required this.title,
    @required this.stations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 32,
          ),
          child: Column(
            children: stations
                .map<Widget>(
                  (station) => StationCard(
                    index: stations.indexOf(station),
                    station: station,
                  ),
                )
                .toList(),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Chip(
              backgroundColor: Theme.of(context).accentColor,
              label: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
