import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../domain_layer/model/display.model.dart';
import 'core/view_module_widget.dart';

class CarouselViewModule extends StatefulWidget with ViewModuleWidget {
  const CarouselViewModule(this.info, {Key? key, required}) : super(key: key);

  final ViewModule info;

  @override
  State<CarouselViewModule> createState() => _CarouselViewModuleState();
}

class _CarouselViewModuleState extends State<CarouselViewModule> {
  int currentPage = 1;
  PageController pageController = PageController();

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = periodicTimer();
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
    pageController.dispose();
  }

  Timer periodicTimer() {
    return Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ProductInfo> products = widget.info.products;

    return RawGestureDetector(
      child: AspectRatio(
        aspectRatio: 390 / 354,
        child: Stack(children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (page) {
              setState(() {
                currentPage = page % products.length + 1;
              });
            },
            itemBuilder: (context, index) {
              String src = products[index % products.length].imageUrl;

              return Image.network(
                src,
                fit: BoxFit.cover,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: PageCountWidget(
                currentPage: currentPage,
                totalPage: products.length,
              ),
            ),
          ),
        ]),
      ),
      gestures: {
        CustomizedGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<CustomizedGestureRecognizer>(
          () => CustomizedGestureRecognizer(),
          (CustomizedGestureRecognizer instance) {
            instance.onDown = (_) {
              if (_timer.isActive) {
                _timer.cancel();
              }
            };
            instance.onCancel = () {
              if (!_timer.isActive) {
                _timer = periodicTimer();
              }
            };
            instance.onEnd = (_) {
              if (!_timer.isActive) {
                _timer = periodicTimer();
              }
            };
          },
        ),
      },
    );
  }
}

class CustomizedGestureRecognizer extends HorizontalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class AllowMultipleGestureRecognizer2 extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class PageCountWidget extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const PageCountWidget({
    Key? key,
    required this.currentPage,
    required this.totalPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text(
          '$currentPage / $totalPage',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    // return Text('$currentPage / $totalPage');
  }
}
