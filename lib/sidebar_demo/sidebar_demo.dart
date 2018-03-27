import 'dart:html';
import 'package:angular/angular.dart';

import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:skawa_components/appbar/appbar.dart';
import 'package:skawa_components/nav_item/nav_item.dart';
import 'package:skawa_components/sidebar/sidebar.dart';
import 'package:skawa_components/sidebar_item/sidebar_item.dart';
import 'package:skawa_components/card/card.dart';
import 'package:angular_components/material_button/material_button.dart';
import '../app_component.dart';

@Component(
    selector: 'sidebar-demo',
    templateUrl: 'sidebar_demo.html',
    styleUrls: const ['sidebar_demo.css'],
    directives: const [
      SkawaSidebarComponent,
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
class SidebarDemoComponent {
  void navigate(String url) {
    window.open(url, '_blank');
  }

  List<Route> get Routes => ROUTES;
}
