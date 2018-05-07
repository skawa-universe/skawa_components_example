import 'package:angular/angular.dart';
import 'card_demo/card_demo.dart';
import 'ckeditor_demo/ckeditor_demo.dart';
import 'data_table_demo/data_table_demo.dart';
import 'grid_demo/grid_demo.dart';
import 'infobar_demo/infobar_demo.dart';

@Component(
    selector: 'non-layout-demo',
    templateUrl: 'non_layout_demo.html',
    styleUrls: const ['non_layout_demo.css'],
    directives: const [
      CardDemoComponent,
      InfobarDemoApp,
      DataTableDemoApp,
      CkeditorDemoComponent,
      GridDemoComponent,
      NgFor
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class NonLayoutDemoComponent {}
