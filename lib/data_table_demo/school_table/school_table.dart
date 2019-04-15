import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/row_data.dart';

@Component(
    selector: 'school-table',
    templateUrl: 'school_table.html',
    directives: [SkawaDataTableComponent, SkawaDataTableColComponent, SkawaDataTableSortDirective],
    directiveTypes: [
      Typed<SkawaDataTableComponent<SchoolRowData>>(),
      Typed<SkawaDataTableColComponent<SchoolRowData>>()
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class SchoolTableComponent {
  List<SchoolRowData> selectableRowData = <SchoolRowData>[
    SchoolRowData('2. class', 11, 18, false),
    SchoolRowData('3. class', 13, 13, false),
    SchoolRowData('1. class', 15, 12, false),
    SchoolRowData('4. class', 20, 13, false),
  ];

  String categoryAccessor(SchoolRowData row) => row.category;

  String maleAccessor(SchoolRowData row) => row.male.toString();

  String femaleAccessor(SchoolRowData row) => row.female.toString();

  String peopleAccessor(SchoolRowData row) => (row.female + row.male).toString();

  String aggregate(DataTableAccessor<SchoolRowData> accessor) {
    Iterable<String> mapped = selectableRowData.where((row) => row.checked).map(accessor);
    return mapped.isNotEmpty ? mapped.reduce(_aggregateReducer) : '-';
  }

  String _aggregateReducer(String a, String b) {
    if (a == null || b == null) return a ?? b;
    return (int.parse(a) + int.parse(b)).toString();
  }

  void sort(SkawaDataTableColComponent column) {
    if (!column.sortModel.isSorted) {
      // Apply default sorting when no sort is specified
      selectableRowData.sort((a, b) => a.category.compareTo(b.category));
    } else {
      selectableRowData.sort((a, b) {
        if (column.header == 'Male') {
          return column.sortModel.isAscending ? a.male - b.male : b.male - a.male;
        } else if (column.header == 'Female') {
          return column.sortModel.isAscending ? a.female - b.female : b.female - a.female;
        } else if (column.header == 'All') {
          return (b.male + b.female) - (a.male + a.female);
        }
      });
    }
  }
}

class SchoolRowData extends RowData {
  final String category;
  final int male;
  final int female;

  SchoolRowData(this.category, this.male, this.female, bool selected) : super(selected);
}
