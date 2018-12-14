import 'package:angular/core.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/row_data.dart';

// TODO: make note that all displayable rows need to implement `RowData`
// TODO: explain the weird accessor method
// TODO: create complex example
// TODO: align-left use case
@Component(
  selector: 'skawa-data-table-demo',
  templateUrl: 'data_table_demo.html',
  directives: const [SkawaDataTableComponent, SkawaDataTableColComponent, SkawaDataTableSortDirective],
)
class DataTableDemoApp {
  List<RowData> rowData = <SampleRowData>[
    new SampleRowData('Trabant', 'Definitely not!'),
    new SampleRowData('Barkasz', 'Same as Trabant!'),
    new SampleRowData('Lada', 'Let the Russians have it!'),
    new SampleRowData('Renault', 'Well, RedBull F1 team uses them, why not?'),
  ];

  String makeAccessor(RowData row) => (row as SampleRowData).name;

  String opinionAccessor(RowData row) => (row as SampleRowData).opinion;

  List<RowData> selectableRowData = <SampleNumericData>[
    new SampleNumericData('2. class', 11, 18, false),
    new SampleNumericData('3. class', 13, 13, false),
    new SampleNumericData('1. class', 15, 12, false),
    new SampleNumericData('4. class', 20, 13, false),
  ];

  String categoryAccessor(RowData row) => (row as SampleNumericData).category;

  String maleAccessor(RowData row) => (row as SampleNumericData).male.toString();

  String femaleAccessor(RowData row) => (row as SampleNumericData).female.toString();

  String peopleAccessor(RowData row) =>
      ((row as SampleNumericData).female + (row as SampleNumericData).male).toString();

  String aggregate(DataTableAccessor<RowData> accessor) {
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
      selectableRowData.sort((a, b) => (a as SampleNumericData).category.compareTo((b as SampleNumericData).category));
    } else {
      selectableRowData.sort((a, b) {
        if (column.header == 'Male') {
          return column.sortModel.isAscending
              ? (a as SampleNumericData).male - (b as SampleNumericData).male
              : (b as SampleNumericData).male - (a as SampleNumericData).male;
        } else if (column.header == 'Female') {
          return column.sortModel.isAscending
              ? (a as SampleNumericData).female - (b as SampleNumericData).female
              : (b as SampleNumericData).female - (a as SampleNumericData).female;
        } else if (column.header == 'All') {
          return ((b as SampleNumericData).male + (b as SampleNumericData).female) -
              ((a as SampleNumericData).male + (a as SampleNumericData).female);
        }
      });
    }
  }

  List<RowData> wrRowData = <WrRowData>[
    new WrRowData('Calvin Johnson', 'DET', 122, 1964, 92, false),
    new WrRowData('Brandon Marshall', 'CHI', 118, 1508, 75, false),
    new WrRowData('Wes Welker', 'NE', 118, 1354, 72, false),
    new WrRowData('Andre Johnson', 'HOU', 112, 1598, 79, false),
    new WrRowData('Jason Witten', 'DAL', 110, 1039, 56, false),
    new WrRowData('Reggie Wayne', 'IND', 106, 1355, 73, false),
    new WrRowData('A.J. Green', 'CIN', 97, 1530, 61, false),
    new WrRowData('Demaryius Thomas', 'DEN', 94, 1434, 60, false),
    new WrRowData('Tony Gonzalez', 'ATL', 93, 930, 65, false),
    new WrRowData('Dez Bryant', 'DAL', 92, 1382, 54, false),
  ];

  String nameAccessor(RowData row) => (row as WrRowData).name;

  String teamAccessor(RowData row) => (row as WrRowData).team;

  String recAccessor(RowData row) => (row as WrRowData).rec.toString();

  String yardsAccessor(RowData row) => (row as WrRowData).yards.toString();

  String avgAccessor(RowData row) => ((row as WrRowData).yards / (row as WrRowData).rec).toStringAsFixed(2);

  String yardPerGameAccessor(RowData row) => ((row as WrRowData).yards / 16).toStringAsFixed(2);

  String firstDownAccessor(RowData row) => (row as WrRowData).firstDowns.toString();

  String firstDownPctAccessor(RowData row) =>
      ((row as WrRowData).firstDowns / (row as WrRowData).rec * 100).toStringAsFixed(2);
}

class SampleRowData extends RowData {

  final String name;

  final String opinion;

  SampleRowData(this.name, this.opinion): super(false);
}

class SampleNumericData extends RowData {
  final String category;
  final int male;
  final int female;

  SampleNumericData(this.category, this.male, this.female, bool selected) : super(selected);
}

class WrRowData extends RowData {
  final String name;
  final String team;
  final int rec;
  final int yards;
  final int firstDowns;

  WrRowData(this.name, this.team, this.rec, this.yards, this.firstDowns, bool checked) : super(checked);
}
