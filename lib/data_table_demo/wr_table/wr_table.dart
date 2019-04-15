import 'package:angular/core.dart';
import 'package:angular_components/model/ui/has_factory.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/row_data.dart';
import 'first_down_percent/first_down_percent.dart';
import 'first_down_percent/first_down_percent.template.dart' as fpc;

@Component(
    selector: 'wr-table',
    templateUrl: 'wr_table.html',
    directives: [skawaDataTableDirectives],
    directiveTypes: [
      Typed<SkawaDataTableComponent<WrRowData>>(),
      Typed<SkawaDataTableColComponent<WrRowData>>(),
      Typed<SkawaDataColRendererDirective<WrRowData>>()
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class WrTableComponent {
  final FactoryRenderer<FirstDownPercentComponent, WrRowData> firstDownPercentRenderer =
      (RowData row) => fpc.FirstDownPercentComponentNgFactory;

  List<WrRowData> wrRowData = <WrRowData>[
    WrRowData('Calvin Johnson', 'DET', 122, 1964, 92),
    WrRowData('Brandon Marshall', 'CHI', 118, 1508, 75),
    WrRowData('Wes Welker', 'NE', 118, 1354, 72),
    WrRowData('Andre Johnson', 'HOU', 112, 1598, 79),
    WrRowData('Jason Witten', 'DAL', 110, 1039, 56),
    WrRowData('Reggie Wayne', 'IND', 106, 1355, 73),
    WrRowData('A.J. Green', 'CIN', 97, 1530, 61),
    WrRowData('Demaryius Thomas', 'DEN', 94, 1434, 60),
    WrRowData('Tony Gonzalez', 'ATL', 93, 930, 65),
    WrRowData('Dez Bryant', 'DAL', 92, 1382, 54),
  ];

  String nameAccessor(WrRowData row) => row.name;

  String teamAccessor(WrRowData row) => row.team;

  String recAccessor(WrRowData row) => row.rec.toString();

  String yardsAccessor(WrRowData row) => row.yards.toString();

  String avgAccessor(WrRowData row) => (row.yards / row.rec).toStringAsFixed(2);

  String yardPerGameAccessor(WrRowData row) => (row.yards / 16).toStringAsFixed(2);

  String firstDownAccessor(WrRowData row) => row.firstDowns.toString();
}

class WrRowData extends RowData {
  final String name;
  final String team;
  final int rec;
  final int yards;
  final int firstDowns;

  WrRowData(this.name, this.team, this.rec, this.yards, this.firstDowns) : super(false);

  int get firstDownPctAccessor => (firstDowns / rec * 10000).toInt();
}
