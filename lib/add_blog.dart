import 'package:flutter/material.dart';
import 'package:project/repository.dart';

class AddBlog extends StatefulWidget {
  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  Repository repository = Repository();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddBlog'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(hintText: 'Content'),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postData(
                      _titleController.text, _contentController.text);

                  print(response);
                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    print('Post Data Gagal');
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
