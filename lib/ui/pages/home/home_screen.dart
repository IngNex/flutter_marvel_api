import 'package:flutter/material.dart';
import 'package:flutter_marvel_api/api/api.dart';
import 'package:flutter_marvel_api/domain/models/character_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Character>> futureCharacter;
  @override
  void initState() {
    // TODO: implement initState
    futureCharacter =
        Api.getCharacters('https://gateway.marvel.com/v1/public/characters');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Marvel Characters',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: FutureBuilder<List<Character>>(
                  future: futureCharacter,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length == 0) {
                        return Center(
                          child: Text("No hay cursos disponibles"),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final path =
                                snapshot.data![index].thumbnail['path'];
                            final extension =
                                snapshot.data![index].thumbnail['extension'];
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data![index].name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 10),
                                          snapshot.data![index].description
                                                      .length !=
                                                  0
                                              ? Text(
                                                  snapshot
                                                      .data![index].description,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              : const Text(
                                                  'Not Description...'),
                                          const SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Marvel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints.tight(
                                            const Size(150, 150)),
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          '$path.$extension',
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
