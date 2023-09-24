
import 'package:app_seminar_1/provider/my_app_controller.dart';
import 'package:app_seminar_1/widget/big_card.dart';
import 'package:app_seminar_1/widget/history_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appController = context.watch<MyAppController>();
    var pair = appController.current;

    IconData icon;
    if (appController.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appController.toggleFavorite(appController.current);
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appController.getNext();
                },
                child: Text('Next'),
              )
            ],
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
