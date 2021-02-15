import 'package:bicycle/hub/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class HubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HubBloc>(
      create: (_) => HubBloc(),
      child: HubWidget(),
    );
  }
}
