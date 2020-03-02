import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:skawa_components_example/demo_header/demo_header.dart';
import 'package:skawa_material_components/skawa_banner/skawa_banner.dart';

@Component(
    selector: 'banner-demo',
    templateUrl: 'banner_demo.html',
    styleUrls: ['banner_demo.css'],
    directives: [SkawaBannerComponent, MaterialButtonComponent, DemoHeaderComponent],
    providers: [SkawaBannerService])
class BannerDemoComponent {
  final SkawaBannerService _bannerService;

  SkawaBannerMessage warningMessage;
  SkawaBannerMessage infoMessage;
  SkawaBannerMessage errorMessage;

  BannerDemoComponent(this._bannerService);

  void showWarning() {
    warningMessage = SkawaBannerMessage.warning("This is a warning");
    _bannerService.showMessage(warningMessage);
  }

  void showInfo(bool priority) {
    infoMessage =
        infoMessage = SkawaBannerMessage.info("This is an info", beforeDispatch: priority ? null : () => false);
    _bannerService.showMessage(infoMessage);
  }

  void showError() {
    errorMessage = SkawaBannerMessage.error("This is an error");
    _bannerService.showMessage(errorMessage);
  }
}
