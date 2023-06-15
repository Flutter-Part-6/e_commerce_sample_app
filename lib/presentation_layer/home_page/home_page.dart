import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_app/common/dependency_injection/injection_injectable.dart';
import 'package:sample_app/data_layer/data_source/local_storage/display_dao.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import 'package:sample_app/presentation_layer/home_page/component/collections_bar/collections_bar.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../data_layer/entity/display/data_source/data_source.entity.dart';
import '../common/component/home_place_holder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    VolumeController().listener((volume) {
      _showServerSelector(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartBloc>()..add(CartInitialized()),
      child: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsBloc, CollectionsState>(
      builder: (context, state) {
        final collections = state.collections;
        switch (state.status) {
          case CollectionsStatus.initial:
            return const HomePlaceholder();
          case CollectionsStatus.loading:
            return CollectionsBar(
              storeType: state.storeType,
              collections: collections,
              key: ValueKey<StoreType>(state.storeType),
            );
          case CollectionsStatus.success:
            return CollectionsBar(
              storeType: state.storeType,
              collections: collections,
            );
          case CollectionsStatus.failure:
            return const HomePlaceholder();
        }
      },
    );
  }
}

void _showServerSelector(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) {
      return _ServerSelector();
    },
  );
}

class _ServerSelector extends StatelessWidget {
  const _ServerSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, widget) {
        return AlertDialog(
          title: const Text('데이터 소스를 선택해주세요'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            RadioListTile<int>(
              value: 0,
              groupValue: box.get('source'),
              onChanged: (value) {
                print(value);
                box.put('source', value);
              },
              title: Text('Remote Api'),
            ),
            RadioListTile<int>(
              value: 1,
              groupValue: box.get('source'),
              onChanged: (value) {
                box.put('source', value);
              },
              title: Text('Mock Api'),
            ),
          ]),
          actions: [
            ElevatedButton(
              onPressed: () {
                box.put('source', box.get('source'));
                Navigator.of(context).pop();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
