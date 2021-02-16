import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/episode.dart';
import '../../utils/constants.dart';
import '../../view_model/episode_view_model.dart';

class EpisodesPage extends StatefulWidget {
  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildConsumer(),
    );
  }

  Consumer<EpisodeViewModel> _buildConsumer() {
    return Consumer<EpisodeViewModel>(
      builder: (context, model, child) {
        if (model.episodeState == EpisodeState.INITIAL) {
          return _buildInitial();
        } else if (model.episodeState == EpisodeState.LOADING) {
          return _buildLoading();
        } else {
          return _buildSuccess(model.episodeList);
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

  ListView _buildSuccess(List<Episode> _episodes) {
    return ListView.builder(
      itemCount: _episodes.length,
      itemBuilder: (context, index) {
        Episode _episode = _episodes[index];
        return ExpansionTile(
          title: Text("${_episode.series}   |   S${_episode.season}E${_episode.episode}   |   ${_episode.title}"),
          children: <Widget>[
            ListTile(
              title: Text('Characters :  ${_episode.characters}'),
            ),
            ListTile(
              title: Text('Air Date :  ${_episode.airDate}'),
            )
          ],
        );
      },
    );
  }
}
