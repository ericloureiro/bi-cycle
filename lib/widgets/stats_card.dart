import 'package:bicycle/widgets/stats_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const StatsCard({
    Key key,
    this.icon,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Card(
              child: Container(
                height: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StatsText(text: title),
                        StatsText(
                          text: subtitle,
                          fontSize: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 120,
                height: 120,
                alignment: Alignment.center,
                color: Theme.of(context).accentColor,
                child: Center(
                  child: Icon(
                    icon,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
