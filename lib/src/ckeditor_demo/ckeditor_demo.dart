import 'package:angular2/core.dart';
import 'package:skawa_components/src/components/ckeditor/ckeditor.dart';

@Component(selector: 'ckeditor-demo', templateUrl: 'ckeditor_demo.html', directives: const [SkawaCkeditorComponent])
class CkeditorDemoComponent {
  var plugins = [new ExtraPlugin('dartlogo', '/ckeditor/dartlogo/plugin.js', '')];
}
