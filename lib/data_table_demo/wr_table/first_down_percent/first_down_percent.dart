import 'package:angular/angular.dart';
import 'package:angular_components/material_progress/material_progress.dart';
import 'package:angular_components/model/ui/has_renderer.dart';
import 'package:skawa_components_example/data_table_demo/wr_table/wr_table.dart';
import 'package:skawa_material_components/data_table/column_row_data.dart';

@Component(
    selector: 'first-down-percent',
    templateUrl: 'first_down_percent.html',
    styleUrls: ['first_down_percent.css'],
    directives: [MaterialProgressComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class FirstDownPercentComponent extends RendersValue<ColumnRowData<PlayerStats>> {
  @override
  ColumnRowData<PlayerStats> value;

  int get renderValue {
    int result = 0;
    var requestedProperty = value.parameters != null ? value.parameters["useProperty"] : null;
    if (requestedProperty == "firstDownPercent") {
      result = value.rowData.firstDownPercent;
    } else if (requestedProperty == "popularity") {
      result = value.rowData.popularity;
    }
    return result;
  }
}
