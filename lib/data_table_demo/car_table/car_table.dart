import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/table_row.dart';

@Component(
    selector: 'car-table',
    templateUrl: 'car_table.html',
    directives: [SkawaDataTableComponent, SkawaDataTableColComponent, SkawaDataTableSortDirective],
    directiveTypes: [Typed<SkawaDataTableComponent<Car>>(), Typed<SkawaDataTableColComponent<Car>>()],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CarTableComponent {
  static const List<Car> cars = <Car>[
    Car('Trabant', 'Eastern delight'),
    Car('Jaguar', 'Hrrrrr'),
    Car('Ford', 'Something for everybody'),
    Car('Renault', 'Well, RedBull F1 team uses them, why not?'),
  ];

  TableRows<Car> _rowData;

  TableRows<Car> get rowData {
    if (_rowData == null) {
      _rowData = TableRows();
      _rowData.addRow(cars.first, classes: ["trabant"]);
      _rowData.addRows(cars.skip(1));
    }
    return _rowData;
  }

  String makeAccessor(Car row) => row.name;

  String opinionAccessor(Car row) => row.opinion;
}

class Car {
  final String name;

  final String opinion;

  const Car(this.name, this.opinion);
}
