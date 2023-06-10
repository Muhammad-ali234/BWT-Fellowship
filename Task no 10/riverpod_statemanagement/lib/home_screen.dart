import 'item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(itemListProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('Items Screen'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          final item = itemList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                item.img,
                height: 200,
                width: 100,
              ),
              trailing: Text(item.price),
              title: Text(
                item.title,
                textAlign: TextAlign.justify,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: item,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
