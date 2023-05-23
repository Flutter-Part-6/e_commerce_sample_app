import 'package:flutter/material.dart';

List<String> images = [
  'https://images.unsplash.com/photo-1589010588553-46e8e7c21788?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=960&q=80',
  'https://images.unsplash.com/photo-1613892735667-5bfb98d16ba8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
  'https://images.unsplash.com/photo-1582138079379-4d3f79f61269?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
  'https://images.unsplash.com/photo-1577161618325-2663fcfb4636?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1029&q=80',
];

class CarouselViewModule extends StatefulWidget {
  const CarouselViewModule({Key? key}) : super(key: key);

  @override
  State<CarouselViewModule> createState() => _CarouselViewModuleState();
}

class _CarouselViewModuleState extends State<CarouselViewModule> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String src = images[index % images.length];
              return Image.network(
                src,
                fit: BoxFit.cover,
              );
            },
            onPageChanged: (page) {
              setState(() {
                currentPage = page % images.length + 1;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: PageCountWidget(
                currentPage: currentPage,
                totalPage: 10,
              ),
            ),
          )
        ],
      ),
    );
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
    return Text('$currentPage / $totalPage');
  }
}
