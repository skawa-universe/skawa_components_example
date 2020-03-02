import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:skawa_components/sidebar_item/sidebar_item.dart';
import 'banner_demo/banner_demo.dart';
import 'card_demo/card_demo.dart';
import 'ckeditor_demo/ckeditor_demo.dart';
import 'data_table_demo/data_table_demo.dart';
import 'extended_material_icon_demo/extended_material_icon_demo.dart';
import 'grid_demo/grid_demo.dart';
import 'hex_colorize_pipe_demo/hex_colorize_pipe_demo.dart';
import 'infobar_demo/infobar_demo.dart';
import 'markdown_demo/markdown_demo.dart';
import 'nav_item_demo/nav_item_demo.dart';
import 'sidebar_item_demo/sidebar_item_demo.dart';
import 'snackbar_demo/snackbar_demo.dart';

@Component(
    selector: 'app-cmp',
    templateUrl: 'app_component.html',
    styleUrls: ['app_component.css', 'package:angular_components/app_layout/layout.scss.css'],
    directives: [
      CardDemoComponent,
      InfobarDemoComponent,
      DataTableDemoComponent,
      CkeditorDemoComponent,
      GridDemoComponent,
      SnackbarDemoComponent,
      NavItemDemoComponent,
      SidebarItemDemoComponent,
      HexColorizePipeDemoComponent,
      MarkdownDemoComponent,
      MaterialIconComponent,
      MaterialButtonComponent,
      SkawaSidebarItemComponent,
      ExtendedMaterialIconDemoComponent,
      MaterialPersistentDrawerDirective,
      BannerDemoComponent
    ],
    providers: [materialProviders],
    changeDetection: ChangeDetectionStrategy.OnPush)
class AppComponent {}
