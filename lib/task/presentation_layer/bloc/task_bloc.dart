import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/task/presentation_layer/components/components.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
 factory TaskBloc.get ()=> TaskBloc();




 int currentTabIndex = 0 ;
 List<Widget> tabs = const [
   CategoriesTab() ,
   ServicesTab() ,
   NoOrderTab()
 ];
 Widget currentTab = const CategoriesTab();
 TaskBloc() : super(TaskInitial()) {

    on<TaskEvent>((event, emit) {
    if ( event is ChangeTabEvent) {
      currentTabIndex = event.index ;
    print("object");
    currentTab = tabs [currentTabIndex];
      emit(ChangeTabState());
    }
    });
  }
}
