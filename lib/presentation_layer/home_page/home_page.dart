import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/common/dependency_injection/injection_injectable.dart';
import 'package:sample_app/common/placeholders.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import 'package:sample_app/presentation_layer/home_page/component/collections_bar/collections_bar.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            // return const LoadingCollectionsBar();
            return const HomePlaceholder();
          case CollectionsStatus.loading:
            // return const LoadingCollectionsBar();
            return const HomePlaceholder();
          case CollectionsStatus.success:
            return CollectionsBar(
              storeType: state.storeType,
              collections: collections,
            );
          case CollectionsStatus.failure:
            // return const LoadingCollectionsBar();
            return const HomePlaceholder();
        }
      },
    );
  }
}

class HomePlaceholder extends StatelessWidget {
  const HomePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CarouselPlaceholder(),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: BannerPlaceholder(),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
