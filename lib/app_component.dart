import 'package:angular/angular.dart';
import 'non_layout_examples/non_layout_demo.dart';

@Component(
    selector: 'app-cmp',
    templateUrl: 'app_component.html',
    styleUrls: const ['app_component.css'],
    directives: const [NonLayoutDemoComponent])
class AppComponent {}
