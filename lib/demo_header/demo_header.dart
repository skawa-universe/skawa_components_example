import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
    selector: 'demo-header',
    templateUrl: 'demo_header.html',
    styleUrls: ['demo_header.css'],
    directives: [MaterialIconComponent, MaterialButtonComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class DemoHeaderComponent {
  @Input()
  String title;

  @Input()
  String sourceHref;

  @Input()
  String exampleHref;
}
