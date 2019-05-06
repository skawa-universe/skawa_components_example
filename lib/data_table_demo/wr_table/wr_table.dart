import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/selection/selection_options.dart';
import 'package:angular_components/model/ui/has_factory.dart';
import 'package:angular_components/model/ui/icon.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/row_data.dart';
import 'first_down_percent/first_down_percent.dart';
import 'first_down_percent/first_down_percent.template.dart' as fpc;

@Component(
    selector: 'wr-table',
    templateUrl: 'wr_table.html',
    styleUrls: ['wr_table.css'],
    directives: [
      skawaDataTableDirectives,
      MaterialDropdownSelectComponent,
      MaterialButtonComponent,
      MaterialIconComponent,
      NgFor,
      NgIf
    ],
    directiveTypes: [
      Typed<SkawaDataTableComponent<WrRowData>>(),
      Typed<SkawaDataTableColComponent<WrRowData>>(),
      Typed<SkawaDataColRendererDirective<WrRowData>>(),
      Typed<MaterialDropdownSelectComponent<SkawaDataTableColComponent<WrRowData>>>(),
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class WrTableComponent implements OnInit {
  static final FactoryRenderer<FirstDownPercentComponent, WrRowData> firstDownPercentRenderer =
      (RowData row) => fpc.FirstDownPercentComponentNgFactory;
  final SelectionModel<SkawaDataTableColComponent<WrRowData>> columnModel =
      SelectionModel<SkawaDataTableColComponent<WrRowData>>.multi(selectedValues: _columns);
  final SelectionOptions<SkawaDataTableColComponent<WrRowData>> columnOptions =
      SelectionOptions<SkawaDataTableColComponent<WrRowData>>.fromList(_columns);
  final List<WrRowData> wrRowData = <WrRowData>[
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

  List<SkawaDataTableColComponent<WrRowData>> columns = _columns;

  Icon icon = Icon('more_vert');

  static final List<SkawaDataTableColComponent<WrRowData>> _columns = [
    SkawaDataTableColComponent<WrRowData>(null)
      ..header = 'Player'
      ..accessor = nameAccessor
      ..classString = 'text-column',
    SkawaDataTableColComponent<WrRowData>(null)
      ..header = 'Team'
      ..accessor = teamAccessor
      ..classString = 'text-column',
    SkawaDataTableColComponent<WrRowData>(null)
      ..header = 'Rec'
      ..accessor = recAccessor,
    SkawaDataTableColComponent<WrRowData>(null)
      ..header = 'Yards'
      ..accessor = yardsAccessor,
    SkawaDataTableColComponent<WrRowData>(null)
      ..header = 'Avg'
      ..accessor = avgAccessor,
    SkawaDataTableColComponent<WrRowData>(null)
      ..header = 'Yds/G'
      ..accessor = yardPerGameAccessor,
    SkawaDataTableColComponent<WrRowData>(null)
      ..header = '1st'
      ..accessor = firstDownAccessor,
    SkawaDataTableColComponent<WrRowData>(
        SkawaDataColRendererDirective<WrRowData>()..factoryRenderer = firstDownPercentRenderer)
      ..header = '1st%'
  ];

  String itemRenderer(SkawaDataTableColComponent<WrRowData> row) => row.header;

  static String nameAccessor(WrRowData row) => row.name;

  static String teamAccessor(WrRowData row) => row.team;

  static String recAccessor(WrRowData row) => row.rec.toString();

  static String yardsAccessor(WrRowData row) => row.yards.toString();

  static String avgAccessor(WrRowData row) => (row.yards / row.rec).toStringAsFixed(2);

  static String yardPerGameAccessor(WrRowData row) => (row.yards / 16).toStringAsFixed(2);

  static String firstDownAccessor(WrRowData row) => row.firstDowns.toString();

  @ViewChild(SkawaDataTableComponent)
  SkawaDataTableComponent dataTableComponent;

  @override
  void ngOnInit() => columnModel.selectionChanges.listen((_) {
        columns = _columns.where((row) => columnModel.selectedValues.contains(row)).toList();
        dataTableComponent.changeDetectorRef.markForCheck();
      });
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
