import 'package:angular/core.dart';
import 'package:angular/src/common/directives/ng_if.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';
import 'package:skawa_material_components/card/card.dart';
import 'package:skawa_material_components/grid/grid_component.dart';

import 'package:angular_components/angular_components.dart';

@Component(
    selector: 'grid-demo',
    templateUrl: 'grid_demo.html',
    directives: const [
      GridComponent,
      GridTileDirective,
      skawaCardDirectives,
      MaterialButtonComponent,
      MaterialIconComponent,
      NgIf,
      DemoHeaderComponent
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class GridDemoComponent {}
