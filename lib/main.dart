import 'package:flutter/material.dart';
import 'package:project/add_blog.dart';
import 'package:project/model.dart';
import 'package:project/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/home": (context) => const MyHomePage(),
        "/add-blog": (context) => AddBlog()
      },
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(title: 'Post Data'),
      initialRoute: "/home",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> listBlog = [];
  Repository repository = Repository();

  getData() async {
    var hasil = await repository.getData();

    print(hasil);

    if (hasil.success) {
      setState(() {
        listBlog = hasil.data;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed('/add-blog'),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                listBlog[index].teks,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ]),
          );
        },
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: listBlog.length,
      ),
    );
  }
}
