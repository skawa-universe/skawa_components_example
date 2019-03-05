import 'dart:html';
import 'package:angular/core.dart';
import 'package:skawa_components/infobar/infobar.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'infobar-demo',
    templateUrl: 'infobar_demo.html',
    directives: [SkawaInfobarComponent, DemoHeaderComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class InfobarDemoComponent {
  void alert() {
    window.alert('Triggered!');
  }
}
