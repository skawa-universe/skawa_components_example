import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:skawa_components/appbar/appbar.dart';
import 'package:skawa_components/card/card.dart';
import '../app_component.dart';

@Component(
    selector: 'appbar-demo',
    templateUrl: 'appbar_demo.html',
    styleUrls: const ['appbar_demo.css'],
    directives: const [
      SkawaAppbarComponent,
      MaterialButtonComponent,
      MaterialIconComponent,
      skawaCardDirectives,
      ROUTER_DIRECTIVES,
      NgFor,
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class AppbarDemoComponent {
  void navigate(String url) {
    window.open(url, '_blank');
  }

  List<Route> get Routes => ROUTES;
}
