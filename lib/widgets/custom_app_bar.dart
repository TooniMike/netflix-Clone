import 'package:flutter/material.dart';
import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, 
  this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color:
      Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: const _CustomAppBarMobile()
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
          Expanded(
            child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(title: 'Tv Show', onTap: () => print('Tv, Shows'),),
              _AppBarButton(title: 'Movies', onTap: () => print('Movies'),),
              _AppBarButton(title: 'My List', onTap: () => print('My List'),),
            ],
          ))
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const _AppBarButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(title, 
      style: const TextStyle(
        color: Colors.white, 
        fontWeight: FontWeight.w600, 
        fontSize: 16
        ),),
    );
  }
}