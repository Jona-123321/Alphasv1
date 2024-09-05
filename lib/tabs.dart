import 'package:alpha_airdrops/airdrops.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  int index;
  late int count;
  late bool showbar;
  HomeTab(this.index, double width, {super.key}) {
    count = (width / 299).toInt();
    count = count < 1 ? 1 : count;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: count,
        children: List.generate(17, (index) {
          return const AlphaCard();
        }));
  }
}

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



/*
return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

*/
