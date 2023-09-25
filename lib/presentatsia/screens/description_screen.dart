import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_connect_tz/bloc/description/description_bloc.dart';
import 'package:pro_connect_tz/bloc/main/main_bloc.dart';
import 'package:pro_connect_tz/presentatsia/screens/home_screen.dart';
import 'package:pro_connect_tz/presentatsia/screens/views/desc_view.dart';
import 'package:pro_connect_tz/service/constants/colors.dart';
import 'package:pro_connect_tz/service/constants/styles.dart';

class DescriptionScreen extends StatefulWidget {
  String id;

  DescriptionScreen({super.key, required this.id});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DescriptionBloc>().add(DescriptionDataEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TXTColors.txtBackgroundColor,

      /// #CustomScrollView
      body: MultiBlocListener(
        listeners: [
          BlocListener<MainBloc, MainState>(listener: (context, state) {
            if(state is MainAllReverstDataSuccessState){
              context.read<MainBloc>().add(MainAllReverstDataEvent());
            }
          }),
          BlocListener<DescriptionBloc, DescriptionState>(
              listener: (context, state) {}),
        ],
        child: BlocBuilder<DescriptionBloc, DescriptionState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: TXTColors.txtWhiteColor,),
                  ),
                  expandedHeight: MediaQuery
                      .sizeOf(context)
                      .height / 2.2,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
            alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(state.item.imageUrl),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 40),
                        child:Text(state.item.title,style: StyleText.wpyrqSty,) ,
                      ),

                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                    child: Text(
                        "${state.item.description}",
                      style: StyleText.cardTitleAndDescSty,
                    ),
                  ),
                ),
                BlocBuilder<MainBloc, MainState>(
                  builder: (context, state) {
                    return SliverList.builder(
                        itemCount: state.list.length -1,
                        itemBuilder: (context, index) {
                          final post = state.list[index+2];
                          return DescriptionView(
                              text: post.description, image: post.imageUrl);
                        });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
