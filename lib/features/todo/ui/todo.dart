import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/constant/app_font_styles.dart';
import 'package:todo_app/core/constant/const_sizebox.dart';
import 'package:todo_app/features/home/model/todo_data_model.dart';

import '../bloc/todo_bloc.dart';

class TodoPage extends StatefulWidget {
  Datum? todo;
  TodoPage({super.key, this.todo});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController todoTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TodoBloc todoBloc = TodoBloc();
  @override
  void initState() {
    // TODO: implement initState

    todoTextEditingController.text =
        widget.todo == null ? "" : widget.todo!.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        child: BlocConsumer<TodoBloc, TodoState>(
          bloc: todoBloc,
          listenWhen: (previous, current) => current is TodoActionState,
          buildWhen: (previous, current) => current is! TodoActionState,
          listener: (context, state) {
            if (state is TodoAddTaskButtonClickedActionState) {
            } else if (state is TodoCloseButtonClickedActionState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Column(children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      todoBloc.add(TodoCloseButtonClickedActionEvent());
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(
                        top: size.height * 0.04,
                        right: size.width * 0.04,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.blackColor,
                          width: 2,
                        ),
                      ),
                      child: Align(
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.greyTextColor,
                          size: 34,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              constHightSizedBox(0.2, size.height),
              Form(
                key: formKey,
                child: TextFormField(
                  autofocus: true,
                  maxLines: null,
                  maxLength: 60,
                  controller: todoTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Todo Title",
                    hintStyle: AppTextStyle.text20(
                      false,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  style: AppTextStyle.text20(false),
                  validator: (value) {
                    if (value!.isEmpty) return "Task name should not empty";
                    return null;
                  },
                ),
              ),
              constHightSizedBox(0.04, size.height),
              GestureDetector(
                onTap: () {
                  if (widget.todo == null) {
                    todoBloc.add(TodoAddTaskButtonClickedActionEvent(
                        title: todoTextEditingController.text));
                  } else {
                    todoBloc.add(TodoUpdateTaskButtonClickedActionEvent(
                        title: todoTextEditingController.text,
                        id: widget.todo!.datumId));
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                      child: Visibility(
                    replacement: const CircularProgressIndicator(),
                    visible: State is TodoButtonLoadingState,
                    child: Text(
                      "Add Todo",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  )),
                ),
              ),
              constHightSizedBox(0.04, size.height),
            ]);
          },
        ),
      ),
    );
  }
}
