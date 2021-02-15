import 'package:bicycle/models/indicator.dart';
import 'package:bicycle/widgets/refreshable_scroll_view.dart';
import 'package:bicycle/widgets/station_stack.dart';
import 'package:bicycle/widgets/stats_column.dart';
import 'package:bicycle/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'bloc.dart';

class HubWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HubWidgetState();
}

class _HubWidgetState extends State<HubWidget> with TickerProviderStateMixin {
  HubBloc bloc;
  int _selectedIndex;
  TabController _tabController;

  @override
  void initState() {
    bloc = BlocProvider.of<HubBloc>(context);
    _selectedIndex = 0;
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {
          setState(() {
            _selectedIndex = _tabController.index;
          });
        }));
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayWidget: Center(
        child: SpinKitCubeGrid(
          color: Theme.of(context).accentColor,
          size: 50.0,
        ),
      ),
      overlayOpacity: 0.8,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.pedal_bike,
              color: Colors.white,
              size: 36,
            ),
          ),
          title: Text(
            'Bi Cycle',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocConsumer<HubBloc, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            context.hideLoaderOverlay();

            if (state is LoadingState) {
              context.showLoaderOverlay();
            }

            if (state is FailureState) {
              return Center(
                child: Icon(
                  Icons.warning,
                  size: 64,
                ),
              );
            }

            IndicatorModel indicator = bloc.indicator;

            if (indicator == null) {
              return Container();
            }

            return TabBarView(
              children: [
                RefreshableScrollView(
                  children: [
                    StatsColumn(
                      title: 'Current year',
                      tripInformation: indicator.currentInformation,
                    ),
                    StatsColumn(
                      title: 'Since beginning',
                      tripInformation: indicator.totalInformation,
                    ),
                  ],
                ),
                RefreshableScrollView(
                  children: [
                    StationStack(
                      title: 'Most popular check-out stations',
                      stations: indicator.pickupStations,
                    ),
                    StationStack(
                      title: 'Most popular return stations',
                      stations: indicator.dropoutStations,
                    ),
                  ],
                ),
              ],
              controller: _tabController,
            );
          },
        ),
        bottomNavigationBar: Container(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 8,
              ),
              child: GNav(
                  mainAxisAlignment: MainAxisAlignment.center,
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  duration: Duration(milliseconds: 800),
                  tabBackgroundColor: Theme.of(context).accentColor,
                  tabs: [
                    TabButton(
                      icon: Icons.beenhere_outlined,
                      text: 'Stats',
                    ),
                    TabButton(
                      icon: Icons.place_outlined,
                      text: 'Stations',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _tabController.animateTo(index);
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
