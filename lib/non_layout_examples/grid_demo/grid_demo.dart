import 'package:angular/core.dart';
import 'package:angular/src/common/directives/ng_if.dart';
import 'package:skawa_components/card/card.dart';
import 'package:skawa_components/grid/grid_component.dart';

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
      NgIf
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class GridDemoComponent {}
