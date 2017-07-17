import 'package:angular2/core.dart';
import 'package:angular2/src/common/directives/ng_if.dart';
import 'package:skawa_components/src/components/card/card.dart';
import 'package:skawa_components/src/components/grid/grid_component.dart';

import 'package:angular_components/angular_components.dart';

@Component(
    selector: 'grid-demo',
    templateUrl: 'grid_demo.html',
    directives: const [
      GridComponent,
      GridTileDirective,
      skawaCardDirectives,
      MaterialButtonComponent,
      GlyphComponent,
      NgIf,
    ]
)
class GridDemoComponent implements OnInit {
  final ChangeDetectorRef ref;

  GridDemoComponent(this.ref);

  @override
  void ngOnInit() {
    ref.detectChanges();
  }
}
