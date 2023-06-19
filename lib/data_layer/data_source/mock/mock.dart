import 'package:sample_app/data_layer/data_source/remote/display_api.dart';
import 'package:sample_app/data_layer/dto/api_response/response_wrapper.dart';
import 'package:sample_app/data_layer/dto/display.dto.dart';

import '../../../common/constants.dart';

class MockApi implements DisplayApi {
  ProductInfoDto get sampleProduct => ProductInfoDto(
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
            'https://images.unsplash.com/photo-1661956603025-8310b2e3036d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      );

  @override
  Future<ResponseWrapper<List<CollectionDto>>> getCollectionsByStoreType({
    required String storeType,
  }) {
    print('[test] storeType : $storeType');
    // throw SocketException('no internet');

    return storeType == StoreType.market.name
        ? Future(
            () => ResponseWrapper(
              status: 'SUCCESS',
              code: '7777',
              message: '갱신에 실패했습니다.',
              data: <CollectionDto>[
                const CollectionDto(tabId: 10001, title: "컬리추천"),
                const CollectionDto(tabId: 10002, title: "신상품"),
                const CollectionDto(tabId: 10003, title: "베스트"),
                const CollectionDto(tabId: 10004, title: "알뜰쇼핑"),
                const CollectionDto(tabId: 10005, title: "특가/혜택"),
              ],
            ),
          )
        : Future(
            () => ResponseWrapper(
              status: 'SUCCESS',
              code: '0000',
              message: '성공입니다.',
              data: <CollectionDto>[
                const CollectionDto(tabId: 20001, title: "컬리추천"),
                const CollectionDto(tabId: 20002, title: "LUXURY"),
                const CollectionDto(tabId: 20003, title: "신상품"),
                const CollectionDto(tabId: 20004, title: "베스트"),
                const CollectionDto(tabId: 20005, title: "특가/혜택"),
                const CollectionDto(tabId: 20005, title: "브랜드"),
              ],
            ),
          );
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>>
      getViewModulesByStoreTypeAndTabId({
    required String storeType,
    required int tabId,
    required int page,
  }) {
    if (page > 3) {
      return Future(
        () => ResponseWrapper(
          status: 'SUCCESS',
          code: '0000',
          message: '성공',
          data: [],
        ),
      );
    }

    return storeType == StoreType.market.name
        ? Future.delayed(
            Duration(seconds: 2),
            () {
              return ResponseWrapper(
                status: 'SUCCESS',
                code: '0000',
                message: '성공',
                data: <ViewModuleDto>[
                  ViewModuleDto(
                    type: 'carousel_view_module',
                    title: '이 상품 어때요?',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '이 상품 어때요?',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'special_price_view_module',
                    title: '24시간 특가',
                    subtitle: '24시간 동안만 만날 수 있는 특별한 가격!',
                    time: DateTime.now()
                        .add(Duration(hours: 1))
                        .millisecondsSinceEpoch,
                    products: [
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '놓치면 후회할 가격',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'banner_view_module',
                    imageUrl: sampleProduct.imageUrl,
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '최고 인기 상품 모음',
                    subtitle: '최근 2주간 판매량이 가장 많았어요',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'category_product_view_module',
                    title: 'MD의 추천',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'brand_product_view_module',
                    title: '알뜰 상품 모음전',
                    subtitle: r'비싸고 좋은 상품을 찾기는 쉽습니다. '
                        r'하지만 값싸고 좋은 상품을 찾기란 하늘의 별따기 만큼 어렵죠. '
                        r'여기까지 찾아온 여러분의 노력이 헛되이지 않게 가성비, '
                        r'가심비를 모두 잡을 수 있는 상품을 준비했습니다.',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '지금 가장 핫한 상품',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '가성비 최고의 상품들',
                    subtitle: '100g 당 가격으로 환산해보면 진짜 저렴해요!',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                ],
              );
            },
          )
        : Future.delayed(
            Duration(seconds: 2),
            () {
              return ResponseWrapper(
                status: 'SUCCESS',
                code: '0000',
                message: '성공',
                data: <ViewModuleDto>[
                  ViewModuleDto(
                    type: 'special_price_view_module',
                    title: '24시간 특가',
                    subtitle: '24시간 동안만 만날 수 있는 특별한 가격!',
                    time: DateTime.now()
                        .add(Duration(hours: 1))
                        .millisecondsSinceEpoch,
                    products: [
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '놓치면 후회할 가격',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'banner_view_module',
                    imageUrl: sampleProduct.imageUrl,
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '최고 인기 상품 모음',
                    subtitle: '최근 2주간 판매량이 가장 많았어요',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'category_product_view_module',
                    title: 'MD의 추천',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'brand_product_view_module',
                    title: '알뜰 상품 모음전',
                    subtitle: r'비싸고 좋은 상품을 찾기는 쉽습니다. '
                        r'하지만 값싸고 좋은 상품을 찾기란 하늘의 별따기 만큼 어렵죠. '
                        r'여기까지 찾아온 여러분의 노력이 헛되이지 않게 가성비, '
                        r'가심비를 모두 잡을 수 있는 상품을 준비했습니다.',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '지금 가장 핫한 상품',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                  ViewModuleDto(
                    type: 'scroll_view_module',
                    title: '가성비 최고의 상품들',
                    subtitle: '100g 당 가격으로 환산해보면 진짜 저렴해요!',
                    products: [
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                      sampleProduct,
                    ],
                  ),
                ],
              );
            },
          );
  }
}
