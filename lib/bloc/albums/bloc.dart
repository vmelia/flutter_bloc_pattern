import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/api/exceptions.dart';
import 'package:flutter_bloc_pattern/api/services.dart';
import 'package:flutter_bloc_pattern/model/albums_list.dart';

import 'events.dart';
import 'states.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  final AlbumsRepo albumsRepo;
  List<Album> albums;

  AlbumsBloc(this.albumsRepo) : super(AlbumsInitState());

  @override
  Stream<AlbumsState> mapEventToState(event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums);
        } on SocketException {
          yield AlbumsListError(NoInternetException('No Internet'));
        } on HttpException {
          yield AlbumsListError(NoServiceFoundException('No Service'));
        } on FormatException {
          yield AlbumsListError(InvalidFormatException('Invalid Response Format'));
        } catch (e) {
          yield AlbumsListError(UnknownException('Unknown Error'));
        }
        break;
    }
  }
}
