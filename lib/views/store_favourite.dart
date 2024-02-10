import 'package:diabetes/widgets/doctore_card_fav.dart';
import 'package:diabetes/widgets/doctore_fav.dart';
import 'package:flutter/material.dart';
class StoreFavourities extends StatelessWidget {
  const StoreFavourities({Key? key}) : super(key: key);
static String id = 'StoreFavourities';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title:const Text("المفضله"),
            centerTitle: true,
            leading: IconButton(
                onPressed: (){},
                icon:const Icon(Icons.arrow_forward_ios)),
          ),
          body:CustomScrollView(
            slivers: [
           const   SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsets.only(right: 10),
                  child: Text("اخر المفضلات"),
                ),
              ),
              SliverToBoxAdapter(
                child:SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index)=>const DoctorCardFavourite(),
                    itemCount: 5,
                  ),
                ) ,
              ),
          const    SliverToBoxAdapter(
                child:Padding(
                  padding:  EdgeInsets.only(right: 10),
                  child: Text("المفضلات السابقه"),
                ) ,
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                  shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemBuilder:(context,index)=>const DoctorFavourite(),
                  itemCount: 20,
                ),
              )
            ],
          )
        ));
  }
}
