import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/bloc/albums/bloc.dart';
import 'package:flutter_bloc_pattern/bloc/albums/events.dart';
import 'package:flutter_bloc_pattern/bloc/albums/states.dart';
import 'package:flutter_bloc_pattern/model/albums_list.dart';
import 'package:flutter_bloc_pattern/widgets/error_text.dart';
import 'package:flutter_bloc_pattern/widgets/list_row.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  void _loadAlbums() async {
    BlocProvider.of<AlbumsBloc>(context).add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Container(child: _body()),
    );
  }

  _body() {
    return BlocBuilder<AlbumsBloc, AlbumsState>(
      builder: (BuildContext context, AlbumsState state) {
        if (state is AlbumsListError) {
          return ErrorText(message: '${state.error.message}\nTap to Retry');
        }
        if (state is AlbumsLoaded) {
          return _list(state.albums);
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _list(List<Album> albums) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
            itemCount: albums.length,
            itemBuilder: (_, index) {
              var album = albums[index];
              return ListRow(album: album);
            }),
      ),
    ]);
  }
}
