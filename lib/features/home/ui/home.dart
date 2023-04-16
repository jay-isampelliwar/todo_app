import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/constant/const_sizebox.dart';
import 'package:todo_app/features/home/bloc/home_bloc.dart';
import 'package:todo_app/features/todo/ui/todo.dart';

import '../../../core/constant/app_font_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState

    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: AppColors.blackColor,
              ),
            );
          },
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
          ),
          child: BlocConsumer<HomeBloc, HomeState>(
            bloc: homeBloc,
            listenWhen: (previous, current) => current is HomeActionState,
            buildWhen: (previous, current) => current is! HomeActionState,
            listener: (context, state) {
              if (state is HomeTaskClickedActionState) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoPage()));
              }
            },
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Container();
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What's Up, Jay!",
                      style: AppTextStyle.text44(),
                    ),
                    constHightSizedBox(0.02, size.height),

                    // Container(
                    //   height: size.height * 0.16,
                    //   width: size.width,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(24),
                    //   ),
                    //   child: ListView.builder(
                    //     padding: EdgeInsets.zero,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 4,
                    //     shrinkWrap: true,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    //           if (index == 0) {
                    //             homeBloc.add(HomeAllTaskCardClickedEvent());
                    //           }
                    //           if (index == 1) {
                    //             homeBloc.add(HomeUrgentCardClickedEvent());
                    //           }
                    //           if (index == 2) {
                    //             homeBloc.add(HomeBusinessCardClickedEvent());
                    //           }
                    //           if (index == 3) {
                    //             homeBloc.add(HomePersonalCardClickedEvent());
                    //           }
                    //         },
                    //         child: const TaskCategoryCard(),
                    //       );
                    //     },
                    //   ),
                    // ),
                    constHightSizedBox(0.03, size.height),
                    Text(
                      "All Task",
                      style: AppTextStyle.text24(true)
                          .copyWith(color: AppColors.greyTextColor),
                    ),
                    constHightSizedBox(0.03, size.height),
                    SizedBox(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                //!pass tapped task
                                homeBloc.add(HomeTaskClickedActionEvent());
                                log("Hello");
                              },
                              child: const TaskCard());
                        },
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            right: size.width * 0.03, bottom: size.height * 0.04),
        child: FloatingActionButton(
          onPressed: () {
            //! Navigate to Taskpage
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TodoPage()));
          },
          child: const Text("+"),
        ),
      ),
    );
  }

  // String getText(HomeState state) {
  //   switch (state.runtimeType) {
  //     case HomeBusinessCardClickedState:
  //       return "Business";
  //     case HomePersonalCardClickedState:
  //       return "Personal";
  //     case HomeUrgentCardClickedState:
  //       return "Urgent";
  //     default:
  //       return "All Task";
  //   }
  // }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.urgentColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Row(
          // mainAxisAlignment: mai,
          children: [
            GestureDetector(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.businessColor,
                    width: 4,
                  ),
                ),

                //!status
                child: Image.asset(
                  'lib/assets/done.png',
                  fit: BoxFit.cover,
                  color: Colors.green,
                ),
              ),
            ),
            constWidthSizedBox(0.06, size.width),
            Text(
              "Lunch with Monica",
              style: AppTextStyle.text24(false),
            )
          ],
        ),
      ),
    );
  }
}

class TaskCategoryCard extends StatelessWidget {
  const TaskCategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      width: size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.personalColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.01,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Business",
            style: AppTextStyle.text24(true),
          ),
          constHightSizedBox(0.01, size.height),
          Text(
            "40 Tasks",
            style: AppTextStyle.text20(true).copyWith(
              color: AppColors.greyTextColor,
            ),
          ),
          constHightSizedBox(0.01, size.height),
          Text("Complete", style: AppTextStyle.text16(true)),
          Text("Incomplete", style: AppTextStyle.text16(true)),
        ]),
      ),
    );
  }
}
