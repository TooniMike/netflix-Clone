import 'package:flutter/material.dart';
import 'package:netflixui/models/content_model.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {

  final Content featuredContent;

  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return _contentHeaderMobile(featuredContent: featuredContent,);
  }
}

class _contentHeaderMobile extends StatelessWidget {
  final Content featuredContent;
  const _contentHeaderMobile({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
              )
          ),
        ),

        // for the Gradient
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black, 
                Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
                )
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add, 
                title: 'List',
                onTap: () => print('My List'),
              ),
              _playButton(),
              VerticalIconButton(
                icon: Icons.info_outline, 
                title: 'Info',
                onTap: () => print('Info '),
                )
            ],
            ),
          )
      ],
    );
  }
}


class _playButton extends StatelessWidget {
  const _playButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
      child: TextButton.icon(
        onPressed: () => print('Play'), 
        style: TextButton.styleFrom(backgroundColor: Colors.white),
        icon: const Icon(Icons.play_arrow,
        size: 30.0,
        color: Colors.black,), 
        label: const Text('Play ', style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),)
        ),
    );
  }
}