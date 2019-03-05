import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'sidebar-item-demo',
    templateUrl: 'sidebar_item_demo.html',
    directives: [MaterialButtonComponent, DemoHeaderComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class SidebarItemDemoComponent implements OnDestroy {
  final StreamController<Null> _openController = new StreamController<Null>();

  @Output('open')
  Stream<Null> get onOpen => _openController.stream;

  void open() => _openController.add(null);

  @override
  void ngOnDestroy() => _openController.close();
}
