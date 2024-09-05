import 'package:alpha_airdrops/reuse.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class App {
  static Platform PLATFORM = Web.WEB;
  static bool loaded = false;
  _App() {}

  static Platform load(Size size) {
    if (!kIsWeb) {
      PLATFORM = Mobile.MOBILE;
    }
    if (size.width < 600) {
      PLATFORM.screen = Compact.COMPACT;
    } else if (size.width < 839) {
      PLATFORM.screen = Medium.MEDIUM;
    }
    return PLATFORM;
  }
}

abstract class Platform {
  late ScreenSize screen = Expanded.EXPANDED;
  Widget nav(Destinations destinations);

  static Platform load(MediaQuery mq) {
    return Web();
  }
}

class Web extends Platform {
  static final Platform WEB = Web();
  @override
  Widget nav(Destinations destinations) {
    return Medium.MEDIUM.nav(destinations);
  }
}

class Mobile extends Platform {
  static final Platform MOBILE = Mobile();

  @override
  Widget nav(Destinations destinations) {
    return screen.nav(destinations);
  }
}

abstract class ScreenSize {
  Widget nav(Destinations destinations);
}

class Compact extends ScreenSize {
  static final COMPACT = Compact();
  @override
  Widget nav(Destinations destinations) {
    if (destinations.ignoreLabels = true) {
      return NavigationBar(
          destinations: destinations.icons,
          selectedIndex: destinations.index!());
    }
    return NavigationBar(
        selectedIndex: destinations.index!(),
        destinations: List.generate(destinations.icons.length, (x) {
          return NavigationDestination(
              icon: destinations.icons[x], label: destinations.labels[x]);
        }, growable: false));
  }
}

class Medium extends ScreenSize {
  static final ScreenSize MEDIUM = Medium();
  @override
  Widget nav(Destinations destinations) {
    if (destinations.ignoreLabels = true) {
      return NavigationBar(
          selectedIndex: destinations.index!(),
          destinations: destinations.icons);
    }
    return NavigationRail(
        selectedIndex: destinations.index!(),
        destinations: List.generate(destinations.icons.length, (x) {
          return NavigationRailDestination(
              icon: destinations.icons[x], label: Text(destinations.labels[x]));
        }, growable: false));
  }
}

class Expanded extends ScreenSize {
  static final ScreenSize EXPANDED = Expanded();
  @override
  Widget nav(Destinations destinations) {
    if (destinations.ignoreLabels) {
      return NavigationDrawer(children: destinations.icons);
    } else {
      return NavigationDrawer(
          children: List.generate(destinations.icons.length, (x) {
        return NavigationDrawerDestination(
            icon: destinations.icons[x], label: Text(destinations.labels[x]));
      }, growable: false));
    }
  }
}
