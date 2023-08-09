import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixui/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflixui/data/data.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
      BlocProvider.of<AppBarCubit>(context).setOffset(_scrollController!.offset);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0), 
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
          return 
          CustomAppBar(scrollOffset: scrollOffset);
        }),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ContentHeader(featuredContent: sintelContent),
            ),
            SliverPadding(
              padding: 
            const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                title: 'Previews', 
                contentList: previews,
                key: const PageStorageKey('preview'),
              ),
            ),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                contentList: myList,
                title: 'My List',
                key: const PageStorageKey('My List'),
                ),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                contentList: myList,
                title: 'Netflix Originals',
                isOriginals: true,
                key: const PageStorageKey('originals'),
                ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 20.0),
              sliver: SliverToBoxAdapter(
                child: ContentList(
                  contentList: trending, 
                  title: 'Trending',
                  key: const PageStorageKey('trending'),
                  ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('Cast'), 
          backgroundColor: Colors.grey[850],
          child: const Icon(Icons.cast),
          ),
    );
  }
}