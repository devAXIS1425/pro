import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_connect_tz/bloc/main/main_bloc.dart';
import 'package:pro_connect_tz/bloc/navigation/navigation_bloc.dart';
import 'package:pro_connect_tz/presentatsia/screens/description_screen.dart';
import 'package:pro_connect_tz/service/constants/colors.dart';
import 'package:pro_connect_tz/service/constants/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool value = false;
  List<String> saver =[];

  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(MainAllDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    /// #MultiBloc Listener
    return Scaffold(
      /// #Background Color
      backgroundColor: TXTColors.txtBackgroundColor,

      /// #AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Notifications",
                style: StyleText.appBarSty,
              )),
          TextButton(
              onPressed: () {
                value = true;
                setState(() {});
              },
              child: const Text(
                "Mark all read",
                style: StyleText.appBarSty,
              )),
        ],
      ),

      /// #Body // MultiBlocProvider
      body: MultiBlocListener(
        listeners: [
          BlocListener<MainBloc, MainState>(listener: (context, state) {
            if (state is MainAllDataSuccessState) {
              debugPrint(state.message);
            }
            if (state is MainDataFailure) {
              debugPrint(state.message);
            }
          }),
          BlocListener<NavigationBloc, NavigationState>(
              listener: (context, state) {
            if (state is NavigatorSucceedState) {
              debugPrint(state.message);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DescriptionScreen(id: state.id)));
            }
            if (state is NavigatorFailureState) {
              debugPrint(state.message);
            }
          }),
        ],
        child: CustomScrollView(
          slivers: [
            /// #Sliver App Bar
            SliverAppBar(
              floating: true,
              snap: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 28, bottom: 20),
                        child: Text(
                          "Featured",
                          style: StyleText.featuredAndNewsSty,
                        ),
                      ),
                      BlocBuilder<MainBloc, MainState>(
                        builder: (context, state) {
                          return CarouselSlider.builder(
                            itemCount: state.list.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              final post = state.list[itemIndex];
                              return GestureDetector(
                                onTap: (){
                                  context.read<NavigationBloc>().add(NavigationDataEvent(post.id));
                                },
                                child: Container(
                                  height: 300,
                                  width: MediaQuery.sizeOf(context).width,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 30),
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.bottomLeft,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(post.imageUrl),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 40, right: 68),
                                    child: Text(
                                      post.title,
                                      style: StyleText.wpyrqSty,
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: true,
                              height: 300,
                              // aspectRatio: 3,
                              viewportFraction: 1,
                              autoPlayInterval: const Duration(seconds: 3),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// #Sliver To Box Adaptive
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Latest news",
                  style: StyleText.featuredAndNewsSty,
                ),
              ),
            ),

            /// #Sliver ListView builder
            BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return SliverList.builder(
                  itemCount: state.list.length,
                  itemBuilder: (_, i) {
                    final post = state.list[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<NavigationBloc>()
                              .add(NavigationDataEvent(post.id));
                        },
                        child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: value == false
                                  ? TXTColors.txtWhiteColor
                                  : TXTColors.txtReadColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(9)),
                              boxShadow:  const [
                                      BoxShadow(
                                          offset: Offset(4, 4),
                                          color: Color(0x1A000000),
                                          blurRadius: 20,
                                          spreadRadius: 0),
                                      BoxShadow(
                                          offset: Offset(-4, -4),
                                          color: Color(0xffffffff),
                                          blurRadius: 8,
                                          spreadRadius: 0)
                                    ]),
                          child: ListTile(
                            leading: Container(
                              height: 60,
                              width: 90,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(post.imageUrl),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                            ),
                            title: Text(
                              post.title,
                              style: StyleText.cardTitleAndDescSty,
                            ),
                            subtitle: Text(
                              post.publicationDate.toString(),
                              style: StyleText.cardSubtitleSty,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
