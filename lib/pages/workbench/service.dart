import 'entity.dart';


/// 仅仅Demo
Future<WorkbenchEntity> requestWorkbench() async {
  await Future.delayed(Duration(milliseconds: 500));
  return WorkbenchEntity.fromJson(<String, dynamic>{"count": 2});
}