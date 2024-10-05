import 'package:firstapp/ui/favourite_page.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/app_state/logics.dart';
import 'package:provider/provider.dart';
import '../utilities/big_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var like = appState.favourite;
    final IconData icon;
    if (like.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border_outlined;
    }

    switch (selectedIndex) {
      case 0:
        break;
      case 1:
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(color: theme.colorScheme.onPrimary),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white, // Set the color you want
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                  ),
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: theme.colorScheme.primary,
                ),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: theme.colorScheme.primary,
                ),
                title: const Text("Favourite"),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const FavoritesPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(pair: pair),
              const SizedBox(height: 10),
              const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(icon),
                    onPressed: () {
                      appState.toggleFavourite();
                    },
                    label: const Text("Like"),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      appState.getNext();
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
