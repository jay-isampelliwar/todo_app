import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/home/bloc/home_bloc.dart';
import 'package:todo_app/features/home/model/todo_data_model.dart';
import 'package:todo_app/features/todo/ui/todo.dart';

import '../../../core/constant/app_font_styles.dart';
import '../../../core/widgets/app_snacbar.dart';
import '../../auth/login/ui/login.dart';
import '../widget/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  final hiveBox = Hive.box("data_box");
  @override
  void initState() {
    if (hiveBox.get("Email") != null && hiveBox.get("Password") != null) {
      homeBloc.add(HomeUserLoginEventEvent());
    }
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              homeBloc.add(HomeLogoutButtonClickedActionEvent());
            },
            icon: Icon(
              Icons.logout_outlined,
              size: size.height * 0.03,
            ),
          ),
        ),
      ]),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoPage(todo: state.todo)));
              } else if (state is HomeErrorActionState) {
                ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                    size: size, message: state.message, color: Colors.red));
              } else if (state is HomeSuccessActionState) {
                ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                    size: size, message: state.message, color: Colors.green));
              } else if (state is HomeAddTaskButtonClickedActionState) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoPage()));
              } else if (state is HomeLoginNavigatorActionState) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              }
            },
            builder: (context, state) {
              if (state is HomeLoadingState) {
                log("Loading");
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                  ),
                  child: SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return loadingWidget(size);
                      },
                    ),
                  ),
                );
              } else if (state is HomeLoadingSuccessState) {
                final homeLoadingSuccessState = state;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeLoadingSuccessState.todoList.length,
                        itemBuilder: (context, index) {
                          Datum current =
                              homeLoadingSuccessState.todoList[index];
                          return GestureDetector(
                              onTap: () {
                                homeBloc.add(
                                    HomeTaskClickedActionEvent(todo: current));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TaskCard(
                                  todo: current,
                                  homeBloc: homeBloc,
                                ),
                              ));
                        },
                      ),
                    )
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            right: size.width * 0.03, bottom: size.height * 0.04),
        child: FloatingActionButton(
          backgroundColor: AppColors.blackColor,
          onPressed: () {
            homeBloc.add(HomeAddTaskButtonClickedActionEvent());
          },
          child: Text(
            "+",
            style: AppTextStyle.text24(false).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  Datum todo;
  HomeBloc homeBloc;
  TaskCard({required this.homeBloc, required this.todo, super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
            borderRadius: BorderRadius.circular(14),
            backgroundColor: Colors.red,
            onPressed: (context) {
              homeBloc.add(HomeTaskDeleteEvent(todo: todo));
            },
            icon: Icons.delete_rounded)
      ]),
      child: Container(
        height: size.height * 0.07,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-2, -2), color: Colors.white, blurRadius: 2),
              BoxShadow(offset: Offset(2, 2), color: Colors.grey, blurRadius: 2)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Row(
            children: [
              Text(
                todo.title,
                style: AppTextStyle.text24(false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
