import 'package:angular/core.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';
import 'package:skawa_material_components/extended_material_icon/extended_material_icon.dart';

@Component(
    selector: 'extended-material-icon-demo',
    templateUrl: 'extended_material_icon_demo.html',
    styleUrls: ['extended_material_icon_demo.css'],
    directives: [DemoHeaderComponent, ExtendedMaterialIconComponent],
    changeDetection: ChangeDetectionStrategy.OnPush)
class ExtendedMaterialIconDemoComponent {}
