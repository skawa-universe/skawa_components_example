import 'dart:html';
import 'package:angular/angular.dart';

import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:skawa_materialish_components/drawer/drawer.dart';
import 'package:skawa_materialish_components/appbar/appbar.dart';
import 'package:skawa_materialish_components/nav_item/nav_item.dart';
import 'package:skawa_materialish_components/sidebar_item/sidebar_item.dart';
import 'package:skawa_materialish_components/card/card.dart';
import 'package:angular_components/material_button/material_button.dart';
import '../app_component.dart';

@Component(
    selector: 'drawer-demo',
    templateUrl: 'drawer_demo.html',
    styleUrls: const ['drawer_demo.css'],
    directives: const [
      SkawaDrawerComponent,
      SkawaSidebarItemComponent,
      SkawaNavItemComponent,
      SkawaAppbarComponent,
      skawaCardDirectives,
      MaterialButtonComponent,
      MaterialIconComponent,
      ROUTER_DIRECTIVES,
      NgFor
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class DrawerDemoComponent {
  void navigate(String url) {
    window.open(url, '_blank');
  }

  List<Route> get Routes => ROUTES;
}
