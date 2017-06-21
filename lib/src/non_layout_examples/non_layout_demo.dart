import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:skawa_components_example/src/app_component.dart';
import 'package:skawa_components_example/src/card_demo/card_demo.dart';
import 'package:skawa_components_example/src/data_table_demo/data_table_demo.dart';
import 'package:skawa_components_example/src/infobar_demo/infobar_demo.dart';

@Component(
  selector: 'non-layout-demo',
  templateUrl: 'non_layout_demo.html',
  styleUrls: const ['non_layout_demo.css'],
  directives: const [
    CardDemoComponent,
    InfobarDemoApp,
    DataTableDemoApp,
    ROUTER_DIRECTIVES
  ],
)
class NonLayoutDemoComponent {
  navigate(String url) {
    window.open(url, '_blank');
  }

  List<Route> get Routes => ROUTES;
}
