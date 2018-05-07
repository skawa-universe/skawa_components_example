import 'package:angular/core.dart';
import 'package:angular/src/common/directives/ng_if.dart';
import 'package:skawa_material_components/card/card.dart';
import 'package:angular_components/angular_components.dart';

@Component(
    selector: 'card-demo',
    templateUrl: 'card_demo.html',
    directives: const [skawaCardDirectives, MaterialButtonComponent, MaterialIconComponent, NgIf],
    styles: const [
      '.color--primary-action { color: #2196F3; font-weight: 700; }',
      'skawa-card { margin-bottom: 16px; }'
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CardDemoComponent {}
