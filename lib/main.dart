import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/bloc/albums/bloc.dart';
import 'package:flutter_bloc_pattern/pages/albums_screen.dart';

import 'api/services.dart';

void main() {
  runApp(MyAppMulti());
}

// class MyAppSingle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: BlocProvider(
//           create: (BuildContext context) {
//             return CounterBloc(CounterState(counter: 0));
//           },
//           child: BlocPage()),
//     );
//   }
// }

class MyAppMulti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Multi Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) => AlbumsBloc(AlbumServices()),
          child: AlbumsScreen(),
        ));
  }
}
