import 'package:angular/angular.dart';
import 'package:skawa_components/pipes/hex_colorize_pipe.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'hex-colorize-pipe-demo',
    templateUrl: 'hex_colorize_pipe_demo.html',
    styleUrls: ['hex_colorize_pipe_demo.css'],
    directives: [NgFor, DemoHeaderComponent],
    pipes: [SkawaHexColorizePipe],
    changeDetection: ChangeDetectionStrategy.OnPush)
class HexColorizePipeDemoComponent {
  List<String> parts =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
          .split(' ');
}
