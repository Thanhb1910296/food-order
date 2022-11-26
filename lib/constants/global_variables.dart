import 'package:flutter/material.dart';

String uri = 'http://10.0.2.2:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const Color secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Color.fromARGB(255, 71, 48, 48);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  //STATIC IMAGES
  static const List<String> carouselImages = [
    // 'https://vnn-imgs-f.vgcloud.vn/2018/09/18/12/cach-lam-bun-dau-mam-tom-ngon-nhu-cua-ba-noi-phim-gao-nep-gao-te-4.jpg',
    // 'https://www.hoidaubepaau.com/wp-content/uploads/2017/03/met-bun-dau-mam-tom.jpg',
    'https://gatrongcooking.com/media/2021/12/ga-ran/ga-ran-16x9.jpg',
    'https://cdn.tgdd.vn/Files/2020/08/24/1283274/cach-lam-chan-ga-sa-tac-coc-non-nghe-thoi-ma-da-muon-an-het-ca-dia-202202241129571232.jpg',
    'https://cdn.tgdd.vn/2021/08/CookRecipe/Avatar/goi-cuon-tom-thit-thumbnail-1.jpg'
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Bún đậu',
      'image': 'assets/images/bun-dau-mam-tom.jpg',
    },
    {
      'title': 'Chân gà',
      'image': 'assets/images/chan-ga-xa-tac.jpg',
    },
    {
      'title': 'Gà rán',
      'image': 'assets/images/ga-ran.jpg',
    },
    {
      'title': 'Gà ủ muối',
      'image': 'assets/images/ga-u-muoi.jpg',
    },
    {
      'title': 'Gỏi cuốn',
      'image': 'assets/images/goi-cuon.jpg',
    },
  ];
}