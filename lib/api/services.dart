import 'package:http/http.dart' as http;

import '../model/albums_list.dart';

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _getAlbums = 'albums';

  @override
  Future<List<Album>> getAlbumList() async {
    final uri = Uri.https(_baseUrl, _getAlbums);
    final response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);

    return albums;
  }
}
