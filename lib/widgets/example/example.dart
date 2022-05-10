import 'package:experment1/widgets/example/example_model.dart';
import 'package:flutter/material.dart';

import '../../domain/api_clients/api_client.dart';

class Example extends StatefulWidget {
   Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final model = ExampleWidgetsModel();

  @override
  Widget build(BuildContext context) {
    print('Example');
    return Scaffold(
      body: SafeArea(
        child: ExampleModelProvider(
          model: model,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              _ReloadButton(),
              _CreatButton(),
              Expanded(
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _PostWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('dadadad');
    return ElevatedButton(
      onPressed: () =>
          ExampleModelProvider
              .read(context)
              ?.model
              .reloadPosts(),
      child: const Text('OBNOVU'),
    );
  }
}

class _CreatButton extends StatelessWidget {
  const _CreatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: () {
        print('3232323');
          ExampleModelProvider
    
              .read(context)
              ?.model
              .createpost();
              
               },
      child: const Text('Duvus'),
    );
  }
}

class _PostWidget extends StatelessWidget {
  const _PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ExampleModelProvider
            .watch(context)
            ?.model
            .posts
            .length ?? 0,
        itemBuilder: (BuildContext context, int index) {
    return _PostsRowWidget(index: index);
    }
    );
  }
}

class _PostsRowWidget extends StatelessWidget {
  final int index;
  const _PostsRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = ExampleModelProvider.read(context)!.model.posts[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.id.toString()),
        const SizedBox(height: 10,),
        Text(post.title),
        const SizedBox(height: 10,),
        Text(post.body),
        const SizedBox(height: 10,),
      ],
    );
  }
}


