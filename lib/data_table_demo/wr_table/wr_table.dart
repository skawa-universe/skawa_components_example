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
import 'package:skawa_material_components/data_table/table_row.dart';
import 'percent_renderer/percent_renderer.dart';
import 'percent_renderer/percent_renderer.template.dart' as pr;

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
      Typed<MaterialDropdownSelectComponent<String>>(),
      Typed<SkawaDataTableColComponent<PlayerStats, int>>(),
      Typed<SkawaDataTableColComponent<PlayerStats, String>>(on: "textColumn"),
      Typed<SkawaDataTableColComponent<PlayerStats, PercentRendererConfig>>(on: "percentColumn")
    ],
    changeDetection: ChangeDetectionStrategy.OnPush)
class WrTableComponent implements OnInit {
  final SelectionModel<String> columnModel = SelectionModel<String>.multi(selectedValues: _columns);

  final SelectionOptions<String> columnOptions = SelectionOptions<String>.fromList(_columns);

  List<String> columns = _columns;

  static const List<PlayerStats> playerStats = <PlayerStats>[
    PlayerStats('Calvin Johnson', 'DET', 122, 1964, 92, 44),
    PlayerStats('Brandon Marshall', 'CHI', 118, 1508, 75, 69),
    PlayerStats('Wes Welker', 'NE', 118, 1354, 72, 93),
    PlayerStats('Andre Johnson', 'HOU', 112, 1598, 79, 77),
    PlayerStats('Jason Witten', 'DAL', 110, 1039, 56, 11),
    PlayerStats('Reggie Wayne', 'IND', 106, 1355, 73, 55),
    PlayerStats('A.J. Green', 'CIN', 97, 1530, 61, 88),
    PlayerStats('Demaryius Thomas', 'DEN', 94, 1434, 60, 28),
    PlayerStats('Tony Gonzalez', 'ATL', 93, 930, 65, 90),
    PlayerStats('Dez Bryant', 'DAL', 92, 1382, 54, 72),
  ];

  TableRows<PlayerStats> _wrRowData;

  TableRows<PlayerStats> get wrRowData {
    _wrRowData ??= TableRows(playerStats);
    return _wrRowData;
  }

  Icon icon = Icon('more_vert');

  static String nameAccessor(PlayerStats row) => row.name;

  static String teamAccessor(PlayerStats row) => row.team;

  static int recAccessor(PlayerStats row) => row.rec;

  static int yardsAccessor(PlayerStats row) => row.yards;

  static String avgAccessor(PlayerStats row) => (row.yards / row.rec).toStringAsFixed(2);

  static String yardPerGameAccessor(PlayerStats row) => (row.yards / 16).toStringAsFixed(2);

  static int firstDownAccessor(PlayerStats row) => row.firstDowns;

  static PercentRendererConfig firstDownPercentAccessor(PlayerStats row) =>
      PercentRendererConfig(row.firstDownPercent, 10000);

  static PercentRendererConfig popularityAccessor(PlayerStats row) => PercentRendererConfig(row.popularity, 100);

  static FactoryRenderer percentRendererFactory = (config) => pr.PercentRendererComponentNgFactory;

  static const List<String> _columns = ["Player", "Team", "Rec", "Yards", "Avg", "Yds/G", "1st%", "Popularity"];

  @ViewChild(SkawaDataTableComponent)
  SkawaDataTableComponent dataTableComponent;

  @override
  void ngOnInit() => columnModel.selectionChanges.listen((_) {
        columns = _columns.where((String header) => columnModel.selectedValues.contains(header)).toList();
        dataTableComponent?.changeDetectorRef?.markForCheck();
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
