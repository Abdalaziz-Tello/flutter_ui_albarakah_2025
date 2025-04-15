import 'package:animation_session/model/fav_model.dart';
import 'package:animation_session/service/favorite_service.dart';
import 'package:flutter/material.dart';

List<FavModel> fav = [];

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getFav(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            fav=snapshot.data!;
          return ListView.builder(
            itemCount: fav.length,
            itemBuilder:(context, index) => ListTile(
              title: Text(fav[index].name),
              trailing: Icon(Icons.favorite ,color: Colors.red,),
            ), );
          }else {
            return Center(child: LinearProgressIndicator(),);
          }
        }
      ),
    );
  }
}