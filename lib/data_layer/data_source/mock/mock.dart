import '../../dto/response_wrapper/response_wrapper.dart';
import '../remote/display_api.dart';
import '../../dto/display.dto.dart';
import '../../../common/constants.dart';
import 'mock_data.dart';

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
            'https://storage.googleapis.com/gcs-fastcampus-production-www/assets/img/common/share-fastcampus.jpg?572bf9e6b8e44f2c67526431fd66a4f7',
      );

  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType({
    required String mallType,
  }) {
    print('[test] mallType : $mallType');
    // throw SocketException('no internet');

    return mallType == MallType.market.name
        ? Future(
            () => ResponseWrapper(
              status: 'SUCCESS',
              code: '7777',
              message: '갱신에 실패했습니다.',
              data: <MenuDto>[
                const MenuDto(tabId: 10001, title: "F-추천"),
                const MenuDto(tabId: 10002, title: "신상품"),
                const MenuDto(tabId: 10003, title: "베스트"),
                const MenuDto(tabId: 10004, title: "알뜰쇼핑"),
                const MenuDto(tabId: 10005, title: "특가/혜택"),
              ],
            ),
          )
        : Future(
            () => ResponseWrapper(
              status: 'SUCCESS',
              code: '0000',
              message: '성공입니다.',
              data: <MenuDto>[
                const MenuDto(tabId: 20001, title: "F-추천"),
                const MenuDto(tabId: 20002, title: "LUXURY"),
                const MenuDto(tabId: 20003, title: "신상품"),
                const MenuDto(tabId: 20004, title: "베스트"),
                const MenuDto(tabId: 20005, title: "특가/혜택"),
                const MenuDto(tabId: 20005, title: "브랜드"),
              ],
            ),
          );
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>>
      getViewModulesByMallTypeAndTabId({
    required String mallType,
    required int tabId,
    required int page,
  }) {
    if (page >= 3) {
      return Future(
        () => ResponseWrapper(
          status: 'SUCCESS',
          code: '0000',
          message: '성공',
          data: [],
        ),
      );
    }

    return mallType == MallType.market.name
        ? (tabId == 10001)
            ? Future.delayed(Duration(seconds: 2), () {
                return ResponseWrapper(
                  status: 'SUCCESS',
                  code: '0000',
                  message: '성공',
                  data: (page == 1) ? marketPageOne : marketPageTwo,
                );
              })
            : Future.delayed(Duration(seconds: 2), () {
                return ResponseWrapper(
                  status: 'SUCCESS',
                  code: '0000',
                  message: '성공',
                  data: (page == 1) ? marketPageTwo : marketPageOne,
                );
              })
        : (tabId == 20001)
            ? Future.delayed(Duration(seconds: 2), () {
                return ResponseWrapper(
                  status: 'SUCCESS',
                  code: '0000',
                  message: '성공',
                  data: (page == 1) ? beautyPageOne : marketPageTwo,
                );
              })
            : Future.delayed(
                Duration(seconds: 2),
                () {
                  return ResponseWrapper(
                    status: 'SUCCESS',
                    code: '0000',
                    message: '성공',
                    data: (page == 1) ? marketPageTwo : beautyPageOne,
                  );
                },
              );
  }

  List<ViewModuleDto> marketPageOne = [
    ViewModuleDto(
      type: 'carousel_view_module',
      title: '이 상품 어때요?',
      products: [
        MockData.marketImg1,
        MockData.marketImg2,
        MockData.marketImg3,
        MockData.marketImg4,
        MockData.marketImg5,
      ],
    ),
    ViewModuleDto(
      type: 'scroll_view_module',
      title: '이 상품 어때요?',
      products: [
        MockData.apple,
        MockData.lemon,
        MockData.pineApple,
        MockData.tuna,
        MockData.pasta1,
        MockData.pasta2,
      ],
    ),
    ViewModuleDto(
      type: 'special_price_view_module',
      title: '24시간 특가',
      subtitle: '24시간 동안만 만날 수 있는 특별한 가격!',
      time: DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch,
      products: [
        MockData.barbecue,
        MockData.chicken,
      ],
    ),
    ViewModuleDto(
      type: 'scroll_view_module',
      title: '놓치면 후회할 가격',
      products: [
        MockData.pasta1,
        MockData.pasta2,
        MockData.pineApple,
        MockData.tuna,
        MockData.lemon,
      ],
    ),
    ViewModuleDto(
      type: 'banner_view_module',
      imageUrl:
          'https://images.unsplash.com/photo-1637488875853-871f85500fa6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80',
    ),
  ];

  List<ViewModuleDto> marketPageTwo = [
    ViewModuleDto(
      type: 'scroll_view_module',
      title: '최고 인기 상품 모음',
      subtitle: '최근 2주간 판매량이 가장 많았어요',
      products: [
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
      ],
    ),
    ViewModuleDto(
      type: 'category_product_view_module',
      title: 'MD의 추천',
      products: [
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
      ],
      tabs: [
        '가전, 가구 특가',
        '프리미엄 주방 특가',
        '뷰티 특가',
        '프리미엄 식품 특가',
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
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
      ],
    ),
    ViewModuleDto(
      type: 'scroll_view_module',
      title: '지금 가장 핫한 상품',
      products: [
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
      ],
    ),
    ViewModuleDto(
      type: 'scroll_view_module',
      title: '가성비 최고의 상품들',
      subtitle: '100g 당 가격으로 환산해보면 진짜 저렴해요!',
      products: [
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
        MockData.defaultData,
      ],
    ),
  ];

  List<ViewModuleDto> beautyPageOne = [
    ViewModuleDto(
      type: 'carousel_view_module',
      title: '이 상품 어때요?',
      products: [
        MockData.beautyImg1,
        MockData.beautyImg2,
        MockData.beautyImg3,
        MockData.beautyImg4,
      ],
    ),
    ViewModuleDto(
      type: 'scroll_view_module',
      title: '오늘의 한정특가!',
      subtitle: '어디에서도 볼 수없는 혜택을 누려보세요.🍀',
      products: [
        MockData.serum,
        MockData.lotion,
        MockData.bodyCare,
      ],
    ),
    ViewModuleDto(
      type: 'special_price_view_module',
      title: '24시간 특가',
      subtitle: '24시간 동안만 만날 수 있는 특별한 가격!',
      time: DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch,
      products: [
        MockData.barbecue,
        MockData.chicken,
      ],
    ),
    ViewModuleDto(
      type: 'scroll_view_module',
      title: '놓치면 후회할 가격',
      products: [
        MockData.pasta1,
        MockData.pasta2,
        MockData.pineApple,
        MockData.tuna,
        MockData.lemon,
      ],
    ),
    ViewModuleDto(
      type: 'banner_view_module',
      imageUrl:
          'https://images.unsplash.com/photo-1464692805480-a69dfaafdb0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    ),
  ];
}
