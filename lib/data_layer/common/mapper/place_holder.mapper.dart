import 'package:sample_app/data_layer/dto/place_holder.dto.dart';
import 'package:sample_app/domain_layer/model/place_holder_sample.model.dart';

extension PostEx on PostDto {
  Post toModel() {
    return Post(
      userId: userId ?? 0,
      id: id ?? 0,
      title: title ?? '',
      body: body ?? '',
    );
  }
}

extension UserEx on UserDto {
  User toModel() {
    return User(
      id: id ?? 0,
      name: name ?? '',
      username: username ?? '',
      email: email ?? '',
      phone: phone ?? '',
    );
  }
}
