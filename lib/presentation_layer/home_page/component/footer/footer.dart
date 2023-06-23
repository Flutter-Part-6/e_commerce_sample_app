import 'package:flutter/material.dart';

import '../../../../theme/app_icons.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: Colors.grey[200],
      margin: const EdgeInsets.only(top: 40.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 100)
            .add(const EdgeInsets.symmetric(horizontal: 20)),
        child: Column(children: [
          Row(children: [
            GreyInfo('회사 소개', isBold: true),
            SizedBox(width: 20),
            GreyInfo('이용 약관', isBold: true),
            SizedBox(width: 20),
            GreyInfo('개인정보처리방침', isBold: true),
          ]),
          SizedBox(height: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              GreyInfo('주식회사 패캠마켓'),
              Container(
                height: 10,
                child: VerticalDivider(
                  color: colorScheme.contentTertiary,
                ),
              ),
              GreyInfo('대표자 : 김플러터'),
            ]),
            SizedBox(
              height: 4,
            ),
            GreyInfo('개인정보보호책임자 : 박다트'),
            SizedBox(
              height: 4,
            ),
            Row(children: [
              GreyInfo('사업자등록번호 : 111-22-3333'),
              SizedBox(width: 4),
              HighlightInfo('사업자 정보 확인'),
            ]),
            SizedBox(
              height: 4,
            ),
            GreyInfo('통신판매업 : 제 2023-서울강남-12345호'),
            SizedBox(
              height: 4,
            ),
            GreyInfo('주소 : 서울특별시 강남구 테헤란로 1'),
          ]),
          SizedBox(height: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [GreyInfo('입점문의 : '), HighlightInfo('입점문의하기')]),
            SizedBox(
              height: 4,
            ),
            Row(children: [
              GreyInfo('제휴문의 : '),
              HighlightInfo('facammarket@facammarket.com'),
            ]),
            SizedBox(
              height: 4,
            ),
            Row(children: [
              GreyInfo('팩스 : 111-2222-3333'),
              Container(
                height: 10,
                child: VerticalDivider(
                  color: colorScheme.contentTertiary,
                ),
              ),
              Row(children: [
                GreyInfo('이메일 : '),
                HighlightInfo('facammarket@facammarket.com'),
              ]),
            ]),
            SizedBox(
              height: 4,
            ),
            Row(children: [
              GreyInfo('고객 센터 : '),
              HighlightInfo('1234-5678'),
            ]),
            SizedBox(
              height: 4,
            ),
            Row(children: [
              GreyInfo('대량주문 문의 : '),
              HighlightInfo('대량주문 문의하기'),
            ]),
          ]),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SnsIcon(
                icon: AppIcons.instagram,
              ),
              SnsIcon(
                icon: AppIcons.fb,
              ),
              SnsIcon(
                icon: AppIcons.blog,
              ),
              SnsIcon(
                icon: AppIcons.naverpost,
              ),
              SnsIcon(
                icon: AppIcons.youtube,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '패캠마켓에서 판매되는 상품 중에는 패캠마켓에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다. 마켓플레이스(오픈마켓) 상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 패캠마켓은 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Theme.of(context).colorScheme.contentTertiary)
                .regular,
          ),
        ]),
      ),
    );
  }
}

class GreyInfo extends StatelessWidget {
  final String text;
  final bool isBold;

  const GreyInfo(
    this.text, {
    Key? key,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.contentTertiary,
        );

    textStyle = isBold ? textStyle.bold : textStyle.regular;

    return Text(
      text,
      style: textStyle,
    );
  }
}

class SnsIcon extends StatelessWidget {
  final String icon;

  const SnsIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Image.asset(
        icon,
        width: 25,
        height: 25,
      ),
    );
  }
}

class HighlightInfo extends StatelessWidget {
  final String text;

  const HighlightInfo(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(
            color: Theme.of(context).primaryColor,
          )
          .regular,
    );
  }
}
