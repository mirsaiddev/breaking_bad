import '../../data/model/death.dart';
import '../../utils/constants.dart';
import 'package:breaking_bad/view_model/deaths_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeathsPage extends StatefulWidget {
  @override
  _DeathsPageState createState() => _DeathsPageState();
}

class _DeathsPageState extends State<DeathsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildConsumer(),
    );
  }

  Consumer<DeathViewModel> _buildConsumer() {
    return Consumer<DeathViewModel>(
      builder: (context, model, child) {
        if (model.deathState == DeathState.INITIAL) {
          return _buildInitial();
        } else if (model.deathState == DeathState.LOADING) {
          return _buildLoading();
        } else {
          return _buildSuccess(model.deathsList);
        }
      },
    );
  }

  Center _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Constants.JapaneseLaurel),
      ),
    );
  }

  Center _buildInitial() {
    return Center(
      child: Text('Initial'),
    );
  }

  ListView _buildSuccess(List<Death> _deaths) {
    return ListView.builder(
      itemCount: _deaths.length,
      itemBuilder: (context, index) {
        Death _death = _deaths[index];
        return ExpansionTile(
          title: Text("${_death.death}"),
          children: <Widget>[
            ListTile(
              title: Text('Responsible :  ${_death.responsible}'),
            ),
            ListTile(
              title: Text('Episode :  S${_death.season}E${_death.episode}'),
            ),
            ListTile(
              title: Text('Cause :  ${_death.cause}'),
            ),
            ListTile(
              title: Text('Last Words :  ${_death.lastWords}'),
            ),
          ],
        );
      },
    );
  }
}
