import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'api_controller.dart';
import 'api_model.dart';

class Apipage extends StatefulWidget {
  const Apipage({super.key});

  @override
  State<Apipage> createState() => _ApipageState();
}

class _ApipageState extends State<Apipage> {
  ApiController apiController = Get.put(ApiController());

  // late Future<ApiModel?> alldata;

  // @override
  // void initState() {
  //   alldata = ApiHelper.apiHelper.fetchAllData(Search: "Lion");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Handling"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ApiController>(
          builder: (_) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: apiController.searchTextEditingController,
                    onChanged: (_) => apiController.search(),
                    // onSubmitted: (_) => apiController.search(),

                    // onChanged: (val) {
                    //   setState(() {
                    //     apiController.alldata = ApiHelper.apiHelper.fetchAllData(Search: val);
                    //   });
                    // },
                    // onChanged: (val) {
                    //   setState(() {
                    //     alldata = ApiHelper.apiHelper.fetchAllData(Search: val);
                    //   });
                    // },
                    //
                    decoration: InputDecoration(
                      hintText: "Enter Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 14,
                  child: StreamBuilder(
                    stream: apiController.alldata.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("ERROR:${snapshot.error}");
                      } else if (snapshot.hasData) {
                        ApiModel? data = snapshot.data;
                        // print("data==${data}");

                        int? total = data?.total;

                        print('total:$total');

                        if (data == null || data.hits.isEmpty) {
                          return const Text("No available data...");
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.hits.length,
                            itemBuilder: (context, i) {
                              // int hits = data.hits.length;
                              return Container(
                                height: 200,
                                width: 100,
                                // color: Colors.redAccent.shade100,
                                child: Card(
                                  elevation: 1,
                                  color: Colors.purple.shade100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${i + 1}",
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data.hits[i].user.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 70,
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          data.hits[i].largeImageUrl,
                                          height: 150,
                                          width: 300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
