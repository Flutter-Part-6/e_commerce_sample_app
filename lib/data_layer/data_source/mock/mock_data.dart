import '../../dto/display/product_info/product_info.dto.dart';

class MockData {
  static final ProductInfoDto marketImg1 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1560008581-09826d1de69e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1344&q=80',
  );
  static final ProductInfoDto marketImg2 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1568724001336-2101ca2a0d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1291&q=80',
  );
  static final ProductInfoDto marketImg3 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1594969155368-f19485a9d88c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  );
  static final ProductInfoDto marketImg4 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  );
  static final ProductInfoDto marketImg5 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1607083206968-13611e3d76db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1215&q=80',
  );

  static final ProductInfoDto beautyImg1 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1571875257727-256c39da42af?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80',
  );
  static final ProductInfoDto beautyImg2 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1617897903246-719242758050?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
  );
  static final ProductInfoDto beautyImg3 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1614859095259-afa49fb8a8f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
  );
  static final ProductInfoDto beautyImg4 = ProductInfoDto(
    imageUrl:
        'https://images.unsplash.com/photo-1522338242992-e1a54906a8da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1288&q=80',
  );

  static final defaultData = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title:
        'FastCampus 플러터 강의 샘플 상품의 타이틀 입니다. 긴 문자를 노출했을 시 화면에서는 오버플로우가 발생할 수 있어 반드시 체크를 해야합니다.',
    subtitle:
        'This is sample product info. it has a long long subtitle text. plz check this!',
    price: 8000,
    originalPrice: 10000,
    discountRate: 20,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1560837616-fee1f3d8753a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
  );

  static final apple = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '맛있는 사과 10입',
    subtitle:
        'This is sample product info. it has a long long subtitle text. plz check this!',
    price: 4000,
    originalPrice: 5000,
    discountRate: 20,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1579613832125-5d34a13ffe2a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  );

  static final lemon = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '새콤한 레몬 2입',
    subtitle:
        'This is sample product info. it has a long long subtitle text. plz check this!',
    price: 1600,
    originalPrice: 2000,
    discountRate: 20,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1610833805553-43556a0f821d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1304&q=80',
  );

  static final pineApple = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '시원한 파인애플',
    subtitle:
        'This is sample product info. it has a long long subtitle text. plz check this!',
    price: 7200,
    originalPrice: 8000,
    discountRate: 10,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
  );

  static final tuna = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '신선한 참치',
    subtitle:
        'This is sample product info. it has a long long subtitle text. plz check this!',
    price: 28500,
    originalPrice: 30000,
    discountRate: 5,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1593819559713-743d364eb059?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
  );

  static final pasta1 = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '맛있는 파스타(1)',
    subtitle:
        'This is sample product info. it has a long long subtitle text. plz check this!',
    price: 16200,
    originalPrice: 18000,
    discountRate: 10,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1611270629569-8b357cb88da9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
  );

  static final pasta2 = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '맛있는 파스타(2)',
    subtitle:
        'This is sample product info. it has a long long subtitle text. plz check this!',
    price: 16200,
    originalPrice: 18000,
    discountRate: 10,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1608219992759-8d74ed8d76eb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
  );

  static final barbecue = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '직화 바베큐 1kg 파티용',
    subtitle: '오늘 이 시간에만 특별히!',
    price: 45000,
    originalPrice: 50000,
    discountRate: 10,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1558030006-450675393462?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1331&q=80',
  );

  static final chicken = ProductInfoDto(
    productId: DateTime.now().microsecondsSinceEpoch.toString(),
    title: '맛있는 양념 치킨',
    subtitle: '오늘 이 시간에만 특별히!',
    price: 20000,
    originalPrice: 25000,
    discountRate: 20,
    reviewCount: 10000000,
    imageUrl:
        'https://images.unsplash.com/photo-1567620832903-9fc6debc209f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1380&q=80',
  );
}
