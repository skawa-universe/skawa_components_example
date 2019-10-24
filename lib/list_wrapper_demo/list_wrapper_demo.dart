import 'package:angular/angular.dart';
import 'package:skawa_components/list_wrapper/list_wrapper.dart';
import 'package:skawa_components/list_wrapper/skawa_for_directive.dart';
import 'package:skawa_components/pipes/hex_colorize_pipe.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';

@Component(
    selector: 'list-wrapper-demo',
    templateUrl: 'list_wrapper_demo.html',
    styleUrls: ['list_wrapper_demo.css'],
    directives: [DemoHeaderComponent, SkawaListWrapperComponent, SkawaForDirective],
    pipes: [SkawaHexColorizePipe],
    changeDetection: ChangeDetectionStrategy.OnPush)
class ListWrapperDemoComponent {
  SkawaForSource<String> list = SkawaForSource<String>(sampleList, true, 20);
}

List<String> sampleList =
    '''Lorem ipsum dolor sit amet, quo at esse clita, dolorum accusata mei id. Dicam quidam petentium mea et, sit cu numquam tractatos, nec et etiam viderer legimus. Nam eu malis graece dissentiunt. Nibh mutat discere ius id. In everti menandri vix, duo tale altera molestiae ei, vim veritus molestie no. Ex usu eius deseruisse moderatius, nec te aeque detracto mentitum.
Te semper docendi invenire mei, laudem primis graeco eos te. Epicurei eloquentiam ius an, vim ex sumo wisi eloquentiam. Putant audiam expetendis an has, habeo abhorreant qui eu. Per altera propriae ne, nec at magna aliquam urbanitas. Dolorum propriae deterruisset eu vis, tale congue decore ei usu.
Eu qui illum novum elitr, prodesset persequeris eu mea. Ad eum postulant mediocrem hendrerit, vim omnes facete dissentiunt no. Te erant cotidieque vis. Mel ex atqui sanctus, ut has nusquam luptatum.
Ad per ferri sonet copiosae, veri indoctum ut mea. Melius senserit recteque eam et, homero vivendo ea eos, facilis signiferumque per eu. Id eros aliquip hendrerit ius. Diam oportere intellegat cum te. His ad delenit lobortis interesset.
Sit id case scaevola. Ad velit appareat vel, cu sea natum facilisi. Mel semper persius ocurreret at. Est diam stet fabellas ex, sea ullum iriure comprehensam et, ea atomorum sensibus mel. Pri ea meliore fastidii. Ex percipit assentior his, ut vix vidisse offendit. '''
        .split(' ');
