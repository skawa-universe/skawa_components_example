import 'package:angular/angular.dart';
import 'package:skawa_components/diff/dff.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';
import 'package:diff_match_patch/diff_match_patch.dart';

@Component(
    selector: 'diff-demo',
    templateUrl: 'diff_demo.html',
    directives: [DiffComponent, DemoHeaderComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class DiffDemoComponent {
  List<Diff> diffList;

  DiffDemoComponent() {
    var a = DiffMatchPatch();
    diffList = a.diff(
        'Additional non Material Design components for AngularDart.',
        'Additional components for AngularDart based on Material Design principles. These reusable components are not part of the official  Material Components (https://material.io/design/components/) library.');
    a.diffCleanupSemantic(diffList);
  }
}
