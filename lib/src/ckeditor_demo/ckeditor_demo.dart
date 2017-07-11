import 'package:angular2/core.dart';
import 'package:skawa_components/src/components/ckeditor/ckeditor.dart';

@Component(
  selector: 'ckeditor-demo',
  templateUrl: 'ckeditor_demo.html',
  directives: const [
    SkawaCkeditorComponent
  ],)
class CkeditorDemoComponent implements OnInit {
  final ChangeDetectorRef ref;

  var plugins = [new ExtraPlugin('justify', '/ckeditor/justify/plugin.js', '')];

  CkeditorDemoComponent(this.ref);

  @override
  void ngOnInit() {
    ref.detectChanges();
  }
}
