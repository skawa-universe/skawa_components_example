import 'package:angular2/angular2.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';
import 'package:skawa_components_example/src/appbar_demo/appbar_demo.dart';
import 'package:skawa_components_example/src/drawer_demo/drawer_demo.dart';
import 'package:skawa_components_example/src/non_layout_examples/non_layout_demo.dart';
import 'package:skawa_components_example/src/sidebar_demo/sidebar_demo.dart';

@Component(
    selector: 'app-cmp',
    templateUrl: 'app_component.html',
    styleUrls: const [
      'app_component.css'
    ],
    directives: const [
      ROUTER_DIRECTIVES,
    ],
    providers: const [
      ROUTER_PROVIDERS,
      const Provider(LocationStrategy, useClass: HashLocationStrategy),
    ])
@RouteConfig(ROUTES)
class AppComponent {}

const List<Route> ROUTES = const [
  const Route(
      path: '/drawer-demo',
      name: 'Drawer Demo',
      component: DrawerDemoComponent),
  const Route(
      path: '/non-layout-shell',
      name: 'Non Layout Demo',
      component: NonLayoutDemoComponent,
      useAsDefault: true),
  const Route(
      path: '/appbar-demo',
      name: 'Appbar Demo',
      component: AppbarDemoComponent),
  const Route(
      path: '/sidebar-demo',
      name: 'Sidebar Demo',
      component: SidebarDemoComponent),
];
