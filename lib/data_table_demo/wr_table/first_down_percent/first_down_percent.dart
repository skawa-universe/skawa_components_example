import 'package:angular/angular.dart';
import 'package:angular_components/material_progress/material_progress.dart';
import 'package:angular_components/model/ui/has_renderer.dart';

@Component(
    selector: 'first-down-percent',
    templateUrl: 'first_down_percent.html',
    styleUrls: ['first_down_percent.css'],
    directives: [MaterialProgressComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class FirstDownPercentComponent extends RendersValue<int> {
  @override
  int value;
}
