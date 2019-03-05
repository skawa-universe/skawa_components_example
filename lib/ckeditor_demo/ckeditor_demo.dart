import 'package:angular/core.dart';
import 'package:skawa_components/ckeditor/ckeditor.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'ckeditor-demo',
    templateUrl: 'ckeditor_demo.html',
    directives: [SkawaCkeditorComponent, DemoHeaderComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CkeditorDemoComponent {
  List<ExtraPlugin> plugins = [new ExtraPlugin('dartlogo', '/ckeditor/dartlogo/plugin.js', '')];
}
