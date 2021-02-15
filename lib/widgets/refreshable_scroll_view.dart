import 'package:bicycle/hub/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshableScrollView extends StatelessWidget {
  final List<Widget> children;

  const RefreshableScrollView({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<HubBloc>(context).add(
          RefreshEvent(),
        );

        return Future.value(true);
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
