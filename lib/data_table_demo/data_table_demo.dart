import 'package:angular/core.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';
import 'car_table/car_table.dart';
import 'school_table/school_table.dart';
import 'wr_table/wr_table.dart';

// TODO: make note that all displayable rows need to implement `RowData`
// TODO: explain the weird accessor method
// TODO: create complex example
// TODO: align-left use case
@Component(
    selector: 'data-table-demo',
    templateUrl: 'data_table_demo.html',
    directives: [CarTableComponent, SchoolTableComponent, WrTableComponent, DemoHeaderComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class DataTableDemoComponent {}
