import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'newscontroller/news_controller.dart';
import 'newsmodel/news_model.dart';

class Newspage extends StatelessWidget {
  const Newspage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Api"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<NewsController>(builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: newsController.searchtTextEditingController,
                    onChanged: (_) => newsController.search(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        "Search",
                      ),
                      hintText: "Enter search category",
                    ),
                  ),
                ),
                (newsController.alldata.value == null)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        flex: 12,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: newsController.alldata.value?.articles.length,
                          itemBuilder: (context, i) {
                            return SizedBox(
                              height: 200,
                              width: 300,
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (newsController.isloading.value)
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Text(
                                            "${newsController.alldata.value?.articles[i].description}"),

                                    // (newsController.alldata.value?.articles[i].urlToImage == null)
                                    //     ? const Center(
                                    //         child: Text("No data found.."),
                                    //       )
                                    //     : Image.network(
                                    //         newsController.alldata.value!.articles[i].urlToImage
                                    //             .toString(),
                                    //         fit: BoxFit.cover,
                                    //       )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                // Expanded(
                //   flex: 12,
                //   child: StreamBuilder(
                //     stream: newsController.alldata.stream,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasError) {
                //         return Text("Error:${snapshot.error}");
                //       } else if (snapshot.hasData) {
                //         NewsModel? data = snapshot.data;
                //
                //         print("data:${data}");
                //
                //         if (data == null) {
                //           return const Text("No available data..");
                //         } else {
                //           return ListView.builder(
                //               itemCount: data.articles.length,
                //               itemBuilder: (context, i) {
                //                 return Container(
                //                   height: 300,
                //                   width: 300,
                //                   child: Card(
                //                     elevation: 3,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.center,
                //                       children: [Image.network(data.articles[i].urlToImage.toString(),fit: BoxFit.cover,)],
                //                     ),
                //                   ),
                //                 );
                //               });
                //         }
                //       }
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     },
                //   ),
                // ),
              ],
            );
          })),
    );
  }
}
