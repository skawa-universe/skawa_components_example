import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/table_row.dart';

@Component(
    selector: 'car-table',
    templateUrl: 'car_table.html',
    directives: [SkawaDataTableComponent, SkawaDataTableSortDirective],
    directiveTypes: [Typed<SkawaDataTableComponent<Car>>()],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CarTableComponent {
  static const List<Car> cars = <Car>[
    Car('Trabant', 'Eastern delight'),
    Car('Jaguar', 'Hrrrrr'),
    Car('Ford', 'Something for everybody'),
    Car('Renault', 'Well, RedBull F1 team uses them, why not?'),
  ];

  TableRows<Car> rowData;

  List<SkawaDataTableColumn<Car>> columns;

  CarTableComponent() {
    rowData = TableRows(null)
      ..addRow(cars.first, classes: ["trabant"])
      ..addRows(cars.skip(1));

    columns = [
      SkawaDataTableColumn()..header = "Car make"
      ..titleAccessor = makeAccessor
      ..accessor = makeAccessor,
      SkawaDataTableColumn()..header = "My strong opinion"
        ..accessor = opinionAccessor
    ];
  }

  static String makeAccessor(Car row) => row.name;

  static String opinionAccessor(Car row) => row.opinion;
}

class Car {
  final String name;

  final String opinion;

  const Car(this.name, this.opinion);
}
