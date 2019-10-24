import 'package:angular/angular.dart';
import 'package:angular_components/material_progress/material_progress.dart';
import 'package:angular_components/model/ui/has_renderer.dart';

@Component(
    selector: 'percent-renderer',
    templateUrl: 'percent_renderer.html',
    styleUrls: ['percent_renderer.css'],
    directives: [MaterialProgressComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class PercentRendererComponent extends RendersValue<PercentRendererConfig> {
  @override
  PercentRendererConfig value;
}

class PercentRendererConfig {
  final int value;
  final int maxValue;

  PercentRendererConfig(this.value, this.maxValue);
}