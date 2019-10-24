import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/table_row.dart';

@Component(
    selector: 'school-table',
    templateUrl: 'school_table.html',
    directives: [SkawaDataTableComponent, SkawaDataTableColComponent],
    directiveTypes: [
      Typed<SkawaDataTableComponent<SchoolClass>>(),
      Typed<SkawaDataTableColComponent<SchoolClass, String>>()
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class SchoolTableComponent {
  List<SchoolClass> selectedRows = [];

  TableRows<SchoolClass> _data;

  TableRows<SchoolClass> get data {
    _data ??= TableRows(schoolClasses);
    return _data;
  }

  static String categoryAccessor(SchoolClass row) => row.category;

  static String maleAccessor(SchoolClass row) => row.male.toString();

  static String femaleAccessor(SchoolClass row) => row.female.toString();

  static String peopleAccessor(SchoolClass row) => (row.female + row.male).toString();

  SortModel<SchoolClass> maleSort = SortModel<SchoolClass>(
      allowedDirections: SortDirection.values,
      sort: (TableRow<SchoolClass> a, TableRow<SchoolClass> b, SortDirection direction) =>
          direction == SortDirection.asc ? a.data.male - b.data.male : b.data.male - a.data.male);

  SortModel<SchoolClass> femaleSort = SortModel<SchoolClass>(
      allowedDirections: SortDirection.values,
      sort: (TableRow<SchoolClass> a, TableRow<SchoolClass> b, SortDirection direction) =>
          direction == SortDirection.asc ? a.data.female - b.data.female : b.data.female - a.data.female);

  SortModel<SchoolClass> allSort = SortModel<SchoolClass>(
      allowedDirections: [SortDirection.desc],
      sort: (TableRow<SchoolClass> a, TableRow<SchoolClass> b, SortDirection direction) =>
          (b.data.male + b.data.female) - (a.data.male + a.data.female));

  String aggregate(DataTableAccessor<SchoolClass, String> accessor) {
    Iterable<String> mapped = selectedRows.map(accessor);
    return mapped.isNotEmpty ? mapped.reduce(_aggregateReducer) : '-';
  }

  String _aggregateReducer(String a, String b) {
    if (a == null || b == null) return a ?? b;
    return (int.parse(a) + int.parse(b)).toString();
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
