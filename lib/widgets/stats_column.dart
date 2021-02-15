import 'package:bicycle/models/trip.dart';
import 'package:bicycle/widgets/stats_card.dart';
import 'package:flutter/material.dart';

class StatsColumn extends StatelessWidget {
  final String title;
  final TripModel tripInformation;

  const StatsColumn({
    Key key,
    this.tripInformation,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        StatsCard(
          icon: Icons.map_outlined,
          title: 'Distance traveled',
          subtitle: tripInformation.distanceText,
        ),
        StatsCard(
          icon: Icons.emoji_flags_outlined,
          title: 'Trips count',
          subtitle: tripInformation.countText,
        ),
      ],
    );
  }
}
