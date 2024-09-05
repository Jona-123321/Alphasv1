import 'package:alpha_airdrops/tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scaled_app/scaled_app.dart';

class Destination {
  const Destination(this.label, this.icon, this.selectedIcon);
  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<Destination> destinations = <Destination>[
  Destination('Home', Icon(Icons.home_outlined), Icon(Icons.home)),
  Destination('Explore', Icon(Icons.explore_outlined), Icon(Icons.explore)),
  Destination(
      'Updates', Icon(Icons.notifications_outlined), Icon(Icons.notifications)),
];

class AlphaAirdrops extends StatelessWidget {
  const AlphaAirdrops({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: // MediaQuery(
          // data: MediaQuery.of(context).scale(),
          // child:
          const AlphaAirdropsState(),
    );
  }
}

class AlphaAirdropsState extends StatefulWidget {
  const AlphaAirdropsState({super.key});

  @override
  State<AlphaAirdropsState> createState() => _AlphaAirdropsStateState();
}

class _AlphaAirdropsStateState extends State<AlphaAirdropsState> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: Center(child: getTab()),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: destinations.map(
          (Destination destination) {
            return NavigationDestination(
              label: destination.label,
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              tooltip: destination.label,
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                destinations: destinations.map(
                  (Destination destination) {
                    return NavigationRailDestination(
                      label: Text(destination.label),
                      icon: destination.icon,
                      selectedIcon: destination.selectedIcon,
                    );
                  },
                ).toList(),
                selectedIndex: screenIndex,
                useIndicator: true,
                onDestinationSelected: (int index) {
                  setState(() {
                    screenIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            //TODO content
            Expanded(child: getTab()),
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: openDrawer,
                    child: const Icon(Icons.arrow_back_ios_new_rounded)))
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Alphas',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...destinations.map(
            (Destination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold();
  }

  int homeLast = 0;
  Widget getTab() {
    return [
      HomeTab(homeLast, MediaQuery.of(context).size.width)
        ..showbar = showNavigationDrawer,
      const ExploreTab(),
      const UpdatesTab()
    ][screenIndex];
  }
}
