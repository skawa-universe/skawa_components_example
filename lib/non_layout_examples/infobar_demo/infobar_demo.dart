import 'dart:html';
import 'package:angular/core.dart';
import 'package:skawa_components/infobar/infobar.dart';

@Component(
    selector: 'infobar-demo',
    template: '''
      <h3>Simple inforbar without icon</h3>
      <skawa-infobar>No icon, no url</skawa-infobar>
      <h3>Inforbar with icon</h3>
      <skawa-infobar icon="info">Info icon, still no url</skawa-infobar>
      <h3>Inforbar with url</h3>
      <skawa-infobar icon="open_in_new" url="https://github.com">Clicking icon will redirect if URL is specified</skawa-infobar>
      <h3>Infobar which alerting when the icon triggers</h3>
      <skawa-infobar icon="lightbulb_outline" (trigger)="alert()">Can also subscribe to primary action with (trigger)</skawa-infobar>
    ''',
    directives: const [SkawaInfobarComponent])
class InfobarDemoApp {
  void alert() {
    window.alert('Triggered!');
  }
}
