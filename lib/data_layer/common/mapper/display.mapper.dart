import 'package:sample_app/data_layer/dto/display.dto.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';

extension CollectionEx on CollectionDto {
  Collection toModel() {
    return Collection(
      tabId: tabId ?? 0,
      title: title ?? '',
    );
  }
}

extension ViewModuleEx on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(
      type: type ?? '',
      title: title ?? ''
    );
  }
}
