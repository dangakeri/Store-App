import 'package:flutter/material.dart';
import 'package:movie/api%20Service/api_service.dart';
import 'package:movie/models/store_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<StoreModel> myStore;

  @override
  void initState() {
    // myStore = ApiService.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder<List<StoreModel>>(
          future: ApiService.getData(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data![index].category!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Image.network(
                          snapshot.data![index].image!,
                          height: 200,
                          width: 200,
                        ),
                        Text(snapshot.data![index].title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 10),
                        Text(snapshot.data![index].description!),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                });
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await ApiService.update(1, 'Alex mwangi muhari');
          ApiService.deleteData(1);
          ApiService.getData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
