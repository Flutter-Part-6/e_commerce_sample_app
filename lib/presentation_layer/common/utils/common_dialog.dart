import 'package:flutter/material.dart';

class CommonDialog {
  CommonDialog();

  static Future<void> networkErrorDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('네트워크 에러가 발생했습니다 \n 잠시후에 다시 사용해주세요'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
          actionsPadding: EdgeInsets.zero,
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
        );
      },
    );
  }
}
