import 'package:angular/angular.dart';
import 'package:angular_components/material_progress/material_progress.dart';
import 'package:angular_components/model/ui/has_renderer.dart';
import 'package:skawa_components_example/data_table_demo/wr_table/wr_table.dart';

@Component(
    selector: 'first-down-percent',
    templateUrl: 'first_down_percent.html',
    styleUrls: ['first_down_percent.css'],
    directives: [MaterialProgressComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class FirstDownPercentComponent extends RendersValue<WrRowData> {
  @override
  WrRowData value;
}
