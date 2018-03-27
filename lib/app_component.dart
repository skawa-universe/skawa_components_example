import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'appbar_demo/appbar_demo.dart';
import 'drawer_demo/drawer_demo.dart';
import 'non_layout_examples/non_layout_demo.dart';
import 'sidebar_demo/sidebar_demo.dart';

@Component(selector: 'app-cmp', templateUrl: 'app_component.html', styleUrls: const [
  'app_component.css'
], directives: const [
  ROUTER_DIRECTIVES
], providers: const [
  ROUTER_PROVIDERS,
  const Provider(LocationStrategy, useClass: HashLocationStrategy),
])
@RouteConfig(ROUTES)
class AppComponent {}

const List<Route> ROUTES = const [
  const Route(
      path: '/non-layout-shell', name: 'Non Layout Demo', component: NonLayoutDemoComponent, useAsDefault: true),
  const Route(path: '/appbar-demo', name: 'Appbar Demo', component: AppbarDemoComponent),
  const Route(path: '/sidebar-demo', name: 'Sidebar Demo', component: SidebarDemoComponent),
  const Route(path: '/drawer-demo', name: 'Drawer Demo', component: DrawerDemoComponent)
];
