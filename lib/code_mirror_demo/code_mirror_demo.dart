import 'package:angular/angular.dart';
import 'package:skawa_components/code_mirror/code_mirror.dart';
import 'package:skawa_components/code_mirror/code_mirror_script_loader.dart';
import 'package:skawa_components/code_mirror/code_mirror_mode_with_link.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'code-mirror-demo',
    templateUrl: 'code_mirror_demo.html',
    directives: [DemoHeaderComponent, CodeMirrorComponent, NgIf],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CodeMirrorDemoComponent implements OnInit {
  final CodeMirrorModeWithLink mode = CodeMirrorModeWithLink.javascript;
  final CodeMirrorScriptLoader _codeMirrorScriptLoader = CodeMirrorScriptLoader();
  final ChangeDetectorRef _changeDetectorRef;

  bool loaded = false;

  CodeMirrorDemoComponent(this._changeDetectorRef);

  @override
  Future ngOnInit() async {
    await _codeMirrorScriptLoader.load(mode);
    loaded = true;
    _changeDetectorRef.markForCheck();
  }
}
