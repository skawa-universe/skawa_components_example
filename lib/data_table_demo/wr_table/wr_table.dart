import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/selection/selection_options.dart';
import 'package:angular_components/model/ui/icon.dart';
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/table_row.dart';

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
      Typed<SkawaDataTableComponent<PlayerStats>>(),
      Typed<MaterialDropdownSelectComponent<SkawaDataTableColComponent<PlayerStats, dynamic>>>(),
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class WrTableComponent implements OnInit {
  final SelectionModel<SkawaDataTableColComponent<PlayerStats, dynamic>> columnModel =
      SelectionModel<SkawaDataTableColComponent<PlayerStats, dynamic>>.multi(selectedValues: _columns);

  final SelectionOptions<SkawaDataTableColComponent<PlayerStats, dynamic>> columnOptions =
      SelectionOptions<SkawaDataTableColComponent<PlayerStats, dynamic>>.fromList(_columns);

  static const List<PlayerStats> playerStats = <PlayerStats>[
    PlayerStats('Calvin Johnson', 'DET', 122, 1964, 92, 4400),
    PlayerStats('Brandon Marshall', 'CHI', 118, 1508, 75, 6900),
    PlayerStats('Wes Welker', 'NE', 118, 1354, 72, 9300),
    PlayerStats('Andre Johnson', 'HOU', 112, 1598, 79, 7700),
    PlayerStats('Jason Witten', 'DAL', 110, 1039, 56, 1100),
    PlayerStats('Reggie Wayne', 'IND', 106, 1355, 73, 5500),
    PlayerStats('A.J. Green', 'CIN', 97, 1530, 61, 8800),
    PlayerStats('Demaryius Thomas', 'DEN', 94, 1434, 60, 2800),
    PlayerStats('Tony Gonzalez', 'ATL', 93, 930, 65, 9000),
    PlayerStats('Dez Bryant', 'DAL', 92, 1382, 54, 7200),
  ];

  TableRows<PlayerStats> _wrRowData;

  TableRows<PlayerStats> get wrRowData {
    _wrRowData ??= TableRows(playerStats);
    return _wrRowData;
  }

  List<SkawaDataTableColComponent<PlayerStats, dynamic>> columns = _columns;

  Icon icon = Icon('more_vert');

  static final List<SkawaDataTableColComponent<PlayerStats, dynamic>> _columns = [
    SkawaDataTableColComponent<PlayerStats, String>()
      ..header = 'Player'
      ..accessor = nameAccessor
      ..classString = 'text-column',
    SkawaDataTableColComponent<PlayerStats, String>()
      ..header = 'Team'
      ..accessor = teamAccessor
      ..classString = 'text-column',
    SkawaDataTableColComponent<PlayerStats, String>()
      ..header = 'Rec'
      ..accessor = recAccessor,
    SkawaDataTableColComponent<PlayerStats, String>()
      ..header = 'Yards'
      ..accessor = yardsAccessor,
    SkawaDataTableColComponent<PlayerStats, String>()
      ..header = 'Avg'
      ..accessor = avgAccessor,
    SkawaDataTableColComponent<PlayerStats, String>()
      ..header = 'Yds/G'
      ..accessor = yardPerGameAccessor,
    SkawaDataTableColComponent<PlayerStats, String>()
      ..header = '1st'
      ..accessor = firstDownAccessor,
    SkawaDataTableColComponent<PlayerStats, int>()
      ..factoryRenderer = ((dynamic row) => fpc.FirstDownPercentComponentNgFactory)
      ..accessor = firstDownPercentAccessor
      ..header = '1st%',
    SkawaDataTableColComponent<PlayerStats, int>()
      ..factoryRenderer = ((dynamic row) => fpc.FirstDownPercentComponentNgFactory)
      ..accessor = ((PlayerStats row) => row.popularity)
      ..header = 'Popularity'
  ];

  String itemRenderer(SkawaDataTableColComponent<PlayerStats, dynamic> row) => row.header;

  static String nameAccessor(PlayerStats row) => row.name;

  static String teamAccessor(PlayerStats row) => row.team;

  static String recAccessor(PlayerStats row) => row.rec.toString();

  static String yardsAccessor(PlayerStats row) => row.yards.toString();

  static String avgAccessor(PlayerStats row) => (row.yards / row.rec).toStringAsFixed(2);

  static String yardPerGameAccessor(PlayerStats row) => (row.yards / 16).toStringAsFixed(2);

  static String firstDownAccessor(PlayerStats row) => row.firstDowns.toString();

  static int firstDownPercentAccessor(PlayerStats row) => row.firstDownPercent;

  @ViewChild(SkawaDataTableComponent)
  SkawaDataTableComponent dataTableComponent;

  @override
  void ngOnInit() => columnModel.selectionChanges.listen((_) {
        columns = _columns.where((row) => columnModel.selectedValues.contains(row)).toList();
        dataTableComponent.changeDetectorRef.markForCheck();
      });
}

class PlayerStats {
  final String name;
  final String team;
  final int rec;
  final int yards;
  final int firstDowns;
  final int popularity;

  const PlayerStats(this.name, this.team, this.rec, this.yards, this.firstDowns, this.popularity);

  int get firstDownPercent => (firstDowns / rec * 10000).toInt();
}
