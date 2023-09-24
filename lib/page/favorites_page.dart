import 'package:app_seminar_1/provider/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appController = context.watch<MyAppController>();

    return appController.favorites.isEmpty
        ? Center(
            child: Text('No favorites yet.'),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                    'You have ${appController.favorites.length} favorites:'),
              ),
              Expanded(
                  child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 400 / 80,
                ),
                children: [
                  for (var pair in appController.favorites)
                    ListTile(
                      leading: IconButton(
                        onPressed: () {
                          appController.removeFavorite(pair);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          semanticLabel: 'Delete',
                        ),
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(
                        pair.asLowerCase,
                        semanticsLabel: pair.asPascalCase,
                      ),
                    )
                ],
              ))
            ],
          );
  }
}
