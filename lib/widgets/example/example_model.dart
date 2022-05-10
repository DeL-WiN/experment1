import 'package:experment1/domain/api_clients/api_client.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entity/post.dart';

class ExampleWidgetsModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _posts = <Post>[];
  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    print('111123123');
   final posts = await apiClient.getPost();
    _posts += posts;
    notifyListeners();
  }
  void createpost() {
    print('dsdsdsdsd');
  }
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetsModel model;
  const ExampleModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
      key: key,
      notifier: model,
      child: child,
  );

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }
  static  ExampleModelProvider? read(BuildContext context){
    final widget = context.getElementForInheritedWidgetOfExactType()?.widget;
return widget is  ExampleModelProvider ? widget : null;
  }

}
