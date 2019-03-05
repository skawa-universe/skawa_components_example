import 'package:angular/core.dart';
import 'package:angular/src/common/directives/ng_if.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';
import 'package:skawa_material_components/card/card.dart';
import 'package:angular_components/angular_components.dart';

@Component(
    selector: 'card-demo',
    templateUrl: 'card_demo.html',
    styleUrls: ['card_demo.css'],
    directives: [skawaCardDirectives, MaterialButtonComponent, MaterialIconComponent, NgIf, DemoHeaderComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CardDemoComponent {}
