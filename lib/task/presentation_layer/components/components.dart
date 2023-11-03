import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:task/task/presentation_layer/bloc/task_bloc.dart';

class CategoryBuilder extends StatelessWidget {
  final String name ;
  final String iconPath ;
  const CategoryBuilder({super.key, required this.name, required this.iconPath});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: double.infinity,
      height: 30.sp,
      child: Row(
        children: [
          SizedBox(
            width: 30.sp,
            height: 30.sp,
            child: Image.asset(iconPath),
          ),
          Expanded(child: Text(name)),
          const Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}

class TabBuilder extends StatelessWidget {
  TaskBloc bloc ;
  String title ;
  int index ;
   TabBuilder({super.key , required this.bloc , required this.title , required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
  builder: (context, state) {
    return InkWell(
      onTap: (){
        bloc.add(ChangeTabEvent(index));
      },
      child: Container(
        width: 25.w,
        height: 30.sp,
        decoration: BoxDecoration(
          color: bloc.currentTabIndex == index ? Colors.deepOrange : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.sp)
        ),
        child: Center(
          child: Text(title , style:  TextStyle(
            color: bloc.currentTabIndex == index ? Colors.white : Colors.black
          ),),
        ),
      ),
    );
  },
);}
}


class CategoriesTab extends StatelessWidget {


  const CategoriesTab({super.key , });
  @override
  Widget build(BuildContext context) {
    List <String> names =["Constructions" ,"Accounting Services" ,
      "Buy & Sell" , "Legal"];
    List <String> icons =["assets/images/category_1.png" , "assets/images/category_2.png",
      "assets/images/category_3.png" ,"assets/images/category_4.png"];
    return SizedBox(
      height: 50.h ,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10.sp) ,
            child: Row(
              children: [
               const Text("Categories Views") ,
                const Spacer() ,
                TextButton(onPressed: (){}, child: const Text(
                  "See All"
                ))
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              
              child: ListView.separated
                (itemBuilder: (context , index){
                  return CategoryBuilder(name: names[index],
                      iconPath: icons[index]);
              },
                  separatorBuilder: (context , index){
                  return SizedBox(
                    height: 10.sp,
                  );
                  },
                  itemCount: names.length ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoOrderTab extends StatelessWidget {
  const NoOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset("assets/images/no orders.png"),
    );
  }
}
class ServicesTab  extends StatelessWidget {
  const ServicesTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}


