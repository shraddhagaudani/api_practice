import 'package:api_practice/pagination/page.dart';
import 'package:api_practice/pixabay_api/pixabayapi_page.dart';
import 'package:api_practice/user_api/user_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'news_api/newspage.dart';

void main() {
  runApp(
    GetMaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/pagination_page',
      getPages: [
        GetPage(name: '/', page: () =>  const Apipage()),
        GetPage(name: '/news_page', page: () =>  const Newspage()),
        GetPage(name: '/user_page', page: ()=> const User_page()),
        GetPage(name: '/pagination_page', page: ()=>  PostScreen()),
      ],
      
    ),

  );
}
