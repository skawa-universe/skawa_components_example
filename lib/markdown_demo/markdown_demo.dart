import 'package:angular/angular.dart';
import 'package:skawa_components/markdown_editor/editor_render_target.dart';
import 'package:skawa_components/markdown_renderer/markdown_renderer.dart';
import 'package:skawa_components/markdown_renderer/raw_markdown_renderer.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'markdown-demo',
    templateUrl: 'markdown_demo.html',
    directives: [SkawaMarkdownRendererComponent, SkawaRawMarkdownRendererComponent, DemoHeaderComponent],
    providers: [Provider(EditorRenderer, useClass: MarkdownRenderer)],
    changeDetection: ChangeDetectionStrategy.OnPush)
class MarkdownDemoComponent {
  String markdown = '''
  ## Fuissem ibat manus et negata

  Arduus suus frustra, alite et sociamque spes quique turba faciem. Nos huius
  populos nostra iamdudum tibi, sic positos numquam parvos umidus *acutis* suae
  quo maturus frequentant equidem. Ostentare opem arva: Assyrii intellegit dei
  quies pariter de utinam recognoscit, et sanguine fratres adsimulavit virgo?
  Pretium Turnus instigant, verba nam actaque virent **altum**, induitur.

  > Segnibus o templis collo. Est tum, et quaeris pulsat mollitaque, puta est
  > ingens. Puellam luctisono orbem.
''';
}
