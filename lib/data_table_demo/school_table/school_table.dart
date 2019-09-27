import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/table_row.dart';

@Component(
    selector: 'school-table',
    templateUrl: 'school_table.html',
    directives: [skawaDataTableDirectives],
    directiveTypes: [
      Typed<SkawaDataTableComponent<SchoolClass>>(),
      Typed<SkawaDataTableColComponent<SchoolClass, int>>(),
      Typed<SkawaDataTableColComponent<SchoolClass, String>>(on: "classColumn"),
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class SchoolTableComponent {
  List<SchoolClass> selectedRows = [];

  TableRows<SchoolClass> data = TableRows(schoolClasses);

  static String categoryAccessor(SchoolClass row) => row.category;

  static int maleAccessor(SchoolClass row) => row.male;

  static int femaleAccessor(SchoolClass row) => row.female;

  static int peopleAccessor(SchoolClass row) => row.female + row.male;

  String aggregate(DataTableAccessor<SchoolClass, int> accessor) {
    Iterable<int> mapped = selectedRows.map(accessor);
    int result = mapped.isNotEmpty ? mapped.reduce(_aggregateReducer) : null;
    return result?.toString() ?? '-';
  }

  int _aggregateReducer(int a, int b) {
    if (a == null || b == null) return a ?? b;
    return a + b;
  }

  void SelectionChange(List<SchoolClass> selectedRows) {}

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
