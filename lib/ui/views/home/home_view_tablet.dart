import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:ideabuilder/ui/views/home/home_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/app_drawer.dart';

class HomeTablet extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final HomeViewModel _model;
  HomeTablet(HomeViewModel model, {Key key})
      : _model = model,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: primaryTextColor,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _model.updateCounter();
        },
      ),
      body: Column(
        children: <Widget>[
          Text('${_model.counter}'),
        ],
      ),
    );
  }
}
