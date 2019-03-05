import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';
import 'package:skawa_material_components/snackbar/snackbar.dart';

@Component(
    selector: 'snackbar-demo',
    templateUrl: 'snackbar_demo.html',
    directives: [SkawaSnackbarComponent, MaterialButtonComponent, DemoHeaderComponent],
    providers: [SnackbarService],
    changeDetection: ChangeDetectionStrategy.OnPush)
class SnackbarDemoComponent {
  final SnackbarService _snackbarService;

  SnackbarDemoComponent(this._snackbarService);

  void showMessage() => _snackbarService.showMessage('Feedback what happend');

  void showMessageWithCallback() {
    SnackAction action = new SnackAction()
      ..label = 'Click me'
      ..callback = () {
        window.alert('Triggered!');
      };
    _snackbarService.showMessage('For more information', duration: Duration(seconds: 10), action: action);
  }
}
