import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/row_data.dart';

@Component(
    selector: 'car-table',
    templateUrl: 'car_table.html',
    directives: [SkawaDataTableComponent, SkawaDataTableColComponent, SkawaDataTableSortDirective],
    directiveTypes: [Typed<SkawaDataTableComponent<CarRowData>>(), Typed<SkawaDataTableColComponent<CarRowData>>()],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CarTableComponent {
  List<CarRowData> rowData = <CarRowData>[
    CarRowData('Trabant', 'Eastern delight', classes: ['trabant']),
    CarRowData('Jaguar', 'Hrrrrr'),
    CarRowData('Ford', 'Something for everybody'),
    CarRowData('Renault', 'Well, RedBull F1 team uses them, why not?'),
  ];

  String makeAccessor(CarRowData row) => row.name;

  String opinionAccessor(CarRowData row) => row.opinion;
}

class CarRowData extends RowData {
  final String name;

  final String opinion;

  CarRowData(this.name, this.opinion, {List<String> classes}) : super(false, classes: classes);
}
