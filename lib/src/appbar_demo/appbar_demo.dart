import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular_components/src/components/glyph/glyph.dart';
import 'package:angular_components/src/components/material_button/material_button.dart';
import 'package:skawa_components/src/components/appbar/appbar.dart';
import 'package:skawa_components/src/components/card/card.dart';
import 'package:skawa_components_example/src/app_component.dart';

@Component(
  selector: 'appbar-demo',
  templateUrl: 'appbar_demo.html',
  styleUrls: const ['appbar_demo.css'],
  directives: const [
    SkawaAppbarComponent,
    MaterialButtonComponent,
    GlyphComponent,
    skawaCardDirectives,
    ROUTER_DIRECTIVES,
    NgFor,
  ],
)
class AppbarDemoComponent {
  navigate(String url) {
    window.open(url, '_blank');
  }

  List<Route> get Routes => ROUTES;
}
