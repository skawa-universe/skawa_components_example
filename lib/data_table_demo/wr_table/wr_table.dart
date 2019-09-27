import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/selection/selection_options.dart';
import 'package:angular_components/model/ui/has_factory.dart';
import 'package:angular_components/model/ui/has_renderer.dart';
import 'package:angular_components/model/ui/icon.dart';
import 'package:skawa_components_example/data_table_demo/wr_table/percent_renderer/percent_renderer.dart';
import 'package:skawa_components_example/data_table_demo/wr_table/percent_renderer/percent_renderer.template.dart'
    as pr;
import 'package:skawa_material_components/data_table/data_table.dart';
import 'package:skawa_material_components/data_table/data_table_column.dart';
import 'package:skawa_material_components/data_table/table_row.dart';

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
    directiveTypes: [Typed<SkawaDataTableComponent<PlayerStats>>(), Typed<MaterialDropdownSelectComponent<String>>()],
    changeDetection: ChangeDetectionStrategy.OnPush)
class WrTableComponent implements OnInit {
  final SelectionModel<String> columnModel = SelectionModel<String>.multi(selectedValues: allColumns);

  final SelectionOptions<String> columnOptions = SelectionOptions<String>.fromList(allColumns);

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
    PlayerStats('Dez Bryant', 'DAL', 92, 1382, 54, 72)
  ];

  TableRows<PlayerStats> wrRowData = TableRows(playerStats);

  List<SkawaDataTableColumn<PlayerStats>> columns;

  static final List<String> allColumns = ["Player", "Team", "Rec", "Yards", "Avg", "Yds/G", "1st"];

  Icon icon = Icon('more_vert');

  String itemRenderer(SkawaDataTableColumn<PlayerStats> row) => row.header;

  static String nameAccessor(PlayerStats row) => row.name;

  static String teamAccessor(PlayerStats row) => row.team;

  static String recAccessor(PlayerStats row) => row.rec.toString();

  static String yardsAccessor(PlayerStats row) => row.yards.toString();

  static String avgAccessor(PlayerStats row) => (row.yards / row.rec).toStringAsFixed(2);

  static String yardPerGameAccessor(PlayerStats row) => (row.yards / 16).toStringAsFixed(2);

  static String firstDownAccessor(PlayerStats row) => row.firstDowns.toString();

  static FactoryRenderer<RendersValue, PercentRendererConfig> percentRendererFactory =
      (PercentRendererConfig config) => pr.PercentRendererComponentNgFactory;

  static RenderValueProducer<PercentRendererConfig, PlayerStats> firstDownPercentProducer =
      ((PlayerStats stats) => PercentRendererConfig(stats.firstDownPercent, 10000));

  static RenderValueProducer<PercentRendererConfig, PlayerStats> popularityProducer =
      ((PlayerStats stats) => PercentRendererConfig(stats.popularity, 100));

  WrTableComponent() {
    columns = [
      SkawaDataTableColumn()
        ..header = "Player"
        ..accessor = nameAccessor,
      SkawaDataTableColumn()
        ..header = "Team"
        ..accessor = teamAccessor,
      SkawaDataTableColumn()
        ..header = "Rec"
        ..accessor = recAccessor,
      SkawaDataTableColumn()
        ..header = "Yards"
        ..accessor = yardsAccessor,
      SkawaDataTableColumn()
        ..header = "Avg"
        ..accessor = avgAccessor,
      SkawaDataTableColumn()
        ..header = "Yds/G"
        ..accessor = yardPerGameAccessor,
      SkawaDataTableColumn()
        ..header = "1st"
        ..accessor = firstDownAccessor,
      SkawaDataTableRenderColumn<PlayerStats, PercentRendererConfig>()..header = "1st%"
      ..factoryRenderer =percentRendererFactory
      ..valueProducer = firstDownPercentProducer,
      SkawaDataTableRenderColumn<PlayerStats, PercentRendererConfig>()..header = "Popularity"
        ..factoryRenderer =percentRendererFactory
        ..valueProducer = popularityProducer
    ];
  }

  @ViewChild(SkawaDataTableComponent)
  SkawaDataTableComponent dataTableComponent;

  @override
  void ngOnInit() => columnModel.selectionChanges.listen((_) {
//        columns = _columns.where((row) => columnModel.selectedValues.contains(row)).toList();
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
