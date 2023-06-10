import 'package:flutter/material.dart';
import 'package:todoapp/database/db_helper.dart';
import 'package:todoapp/models/notes.dart';
import 'package:todoapp/screens/add_data_screen.dart';
import 'package:todoapp/screens/update_data_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple[200],
        title: const Text('TODO Notes App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: notesList,
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 3.0,
                                mainAxisSpacing: 5.0),
                        shrinkWrap: true,
                        reverse: false,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            color: Colors.deepPurple[200],
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Text(
                                      snapshot.data![index].title.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].description
                                        .toString(),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            final updateData =
                                                await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UpdateDataScreen()),
                                            );
                                            await dbHelper!.update(NotesModel(
                                              id: snapshot.data![index].id,
                                              title: updateData['title'],
                                              description:
                                                  updateData['description'],
                                            ));
                                            setState(() {
                                              notesList =
                                                  dbHelper!.getNotesList();
                                            });
                                          },
                                          child:
                                              const Icon(Icons.edit_document)),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              dbHelper!.delete(
                                                  snapshot.data![index].id!);
                                              notesList =
                                                  dbHelper!.getNotesList();
                                              snapshot.data!.remove(
                                                  snapshot.data![index]);
                                            });
                                          },
                                          child:
                                              const Icon(Icons.delete_forever)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple[300],
          child: const Icon(Icons.add),
          onPressed: () async {
            final addData = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddDataScreen()),
            );

            if (dbHelper == null) {
              return;
            } else {
              await dbHelper!
                  .insert(NotesModel(
                title: addData['title'],
                description: addData['description'],
              ))
                  .then((value) {
                setState(() {
                  {
                    notesList = dbHelper!.getNotesList();
                  }
                });
              }).onError((error, stackTrace) {});
              if (addData != null) {
                setState(() {});
              }
            }
          }),
    );
  }
}
