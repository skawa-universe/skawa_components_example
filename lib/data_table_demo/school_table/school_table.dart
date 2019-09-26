import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/table_row.dart';

@Component(
    selector: 'school-table',
    templateUrl: 'school_table.html',
    directives: [SkawaDataTableComponent, SkawaDataTableColComponent, SkawaDataTableSortDirective],
    directiveTypes: [
      Typed<SkawaDataTableComponent<SchoolClass>>(),
      Typed<SkawaDataTableColComponent<SchoolClass>>()
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class SchoolTableComponent {
  List<SchoolClass> selectedRows = [];

  final TableRows<SchoolClass> data = TableRows(schoolClasses);

  String categoryAccessor(SchoolClass row) => row.category;

  String maleAccessor(SchoolClass row) => row.male.toString();

  String femaleAccessor(SchoolClass row) => row.female.toString();

  String peopleAccessor(SchoolClass row) => (row.female + row.male).toString();

  String aggregate(DataTableAccessor<SchoolClass> accessor) {
    Iterable<String> mapped = selectedRows.map(accessor);
    return mapped.isNotEmpty ? mapped.reduce(_aggregateReducer) : '-';
  }

  String _aggregateReducer(String a, String b) {
    if (a == null || b == null) return a ?? b;
    return (int.parse(a) + int.parse(b)).toString();
  }

  void SelectionChange(List<SchoolClass> selectedRows) {

  }

  void sort(SkawaDataTableColComponent column) {
    if (!column.sortModel.isSorted) {
      // Apply default sorting when no sort is specified
      data.rows.sort((a, b) => a.data.category.compareTo(b.data.category));
    } else {
      data.rows.sort((a, b) {
        int order = 0;
        if (column.header == 'Male') {
          order = column.sortModel.isAscending ? a.data.male - b.data.male : b.data.male - a.data.male;
        } else if (column.header == 'Female') {
          order = column.sortModel.isAscending ? a.data.female - b.data.female : b.data.female - a.data.female;
        } else if (column.header == 'All') {
          order = (b.data.male + b.data.female) - (a.data.male + a.data.female);
        }
        return order;
      });
    }
  }

  static const List<SchoolClass> schoolClasses = const <SchoolClass>[
    SchoolClass('2. class', 11, 18),
    SchoolClass('3. class', 13, 13),
    SchoolClass('1. class', 15, 12),
    SchoolClass('4. class', 20, 13),
  ];
}

class SchoolClass {
  final String category;
  final int male;
  final int female;

  const SchoolClass(this.category, this.male, this.female);
}
