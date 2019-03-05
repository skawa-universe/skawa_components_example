import 'package:angular/angular.dart';
import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:skawa_components/nav_item/nav_item.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'nav-item-demo',
    templateUrl: 'nav_item_demo.html',
    styleUrls: ['nav_item_demo.css', 'package:angular_components/app_layout/layout.scss.css'],
    directives: [SkawaNavItemComponent, MaterialTemporaryDrawerComponent, MaterialButtonComponent, DemoHeaderComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class NavItemDemoComponent {}
