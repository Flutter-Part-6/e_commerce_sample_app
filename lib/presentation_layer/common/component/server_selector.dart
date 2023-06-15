import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_app/common/constants.dart';

class ServerSelector extends StatelessWidget {
  const ServerSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, widget) {
        var source = box.get('dataSource') ?? 0;

        return AlertDialog(
          title: const Text('데이터 소스를 선택해주세요'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<int>(
                value: 0,
                groupValue: source,
                onChanged: (value) {
                  box.put('dataSource', value);
                },
                title: Text('Remote Api'),
              ),
              RadioListTile<int>(
                value: 1,
                groupValue: source,
                onChanged: (value) {
                  box.put('dataSource', value);
                },
                title: Text('Mock Api'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('앱을 재실행 해주세요.'),
                  backgroundColor: Theme.of(context).highlightColor,
                  behavior: SnackBarBehavior.floating,
                ));
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
