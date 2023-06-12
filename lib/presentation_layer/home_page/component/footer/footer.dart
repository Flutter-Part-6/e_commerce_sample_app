import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      margin: const EdgeInsets.only(top: 40.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 100)
            .add(const EdgeInsets.symmetric(horizontal: 20)),
        child: const Column(children: [
          Row(children: [
            GreyInfo('회사 소개', fontWeight: FontWeight.w600),
            SizedBox(width: 18),
            GreyInfo('이용 약관', fontWeight: FontWeight.w600),
            SizedBox(width: 18),
            GreyInfo('개인정보처리방침', fontWeight: FontWeight.w600),
          ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              GreyInfo('주식회사 커머스'),
              Divider(),
              GreyInfo('대표자 : 김패캠'),
            ]),
            GreyInfo('개인정보보호책임자 : 박다트'),
            Row(children: [
              GreyInfo('사업자등록번호 : 111-22-3333'),
              SizedBox(width: 4),
              HighlightInfo('사업자 정보 확인'),
            ]),
            GreyInfo('통신판매업 : 1호'),
            GreyInfo('주소 : 서울시 강동구'),
          ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [GreyInfo('입점문의 : '), HighlightInfo('입점문의하기')]),
            Row(children: [
              GreyInfo('제휴문의 : '),
              HighlightInfo('commerce@commerce.com'),
            ]),
            Row(children: [
              GreyInfo('팩스 : 111-2222-3333'),
              Divider(),
              Row(children: [
                GreyInfo('이메일 : '),
                HighlightInfo('commerce@commerce.com'),
              ]),
            ]),
            Row(children: [
              GreyInfo('고객 센터 : '),
              HighlightInfo('02-3333-3333'),
            ]),
          ]),
        ]),
      ),
    );
  }
}

class GreyInfo extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;

  const GreyInfo(
    this.text, {
    Key? key,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey,
            fontWeight: fontWeight,
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
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300,
          ),
    );
  }
}
