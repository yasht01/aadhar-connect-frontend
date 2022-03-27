import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.gr.dart';
import '../widgets/transparent_button.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<int> content = [1, 2, 3];
    List<Widget> sliders = content
        .map(
          (e) => Text(e.toString()),
        )
        .toList();
    return Column(
      children: [
        Container(
          constraints: BoxConstraints.tight(const Size.square(400)),
          child: CarouselSlider(
            items: sliders,
            carouselController: _controller,
            options: CarouselOptions(
                aspectRatio: 0.5,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3].asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
        TransparentButton(
          callback: () => context.router.push(const HomeRoute()),
          icon: Icons.east,
          size: 60,
        ),
      ],
    );
  }
}