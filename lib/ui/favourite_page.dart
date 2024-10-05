import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/app_state/logics.dart';
import '../utilities/big_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favourite;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text('No favorites yet!'),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          var pair = favorites[index];
          return ListTile(
            title: BigCard(pair: pair),
          );
        },
      ),
    );
  }
}
