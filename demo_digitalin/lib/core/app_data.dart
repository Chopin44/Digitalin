import 'package:flutter/material.dart';
import 'package:demo_digitalin/core/app_asset.dart';
import 'package:demo_digitalin/src/model/furniture.dart';
import 'package:demo_digitalin/src/model/subcription_color.dart';
import '../src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  static const dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  static List<Furniture> furnitureList = [
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Netflix 1 tahun',
      description: dummyText,
      price: 469.99,
      score: 3.5,
      images: [
        AppAsset.netflix,
        // AppAsset.youtube,
        // AppAsset.xbox,
        // AppAsset.ps,
        // AppAsset.hbo,
        // AppAsset.appletv,
        // AppAsset.disney,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF616161), isSelected: true),
        FurnitureColor(color: const Color(0xFF424242)),
      ],
    ),
    Furniture(
      isFavorite: false,
      quantity: 1,
      title: 'Xbox GamePass 1 bulan',
      description: dummyText,
      price: 299.99,
      score: 4.5,
      images: [AppAsset.xbox],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF5d4037), isSelected: true),
        FurnitureColor(color: const Color(0xFF424242)),
      ],
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Playstation Plus 3 Bulan',
      description: dummyText,
      price: 659.99,
      score: 3.0,
      images: [
        AppAsset.ps,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF616161), isSelected: true),
        FurnitureColor(color: const Color(0xFF212121)),
      ],
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'HBO Max 1 Bulan',
      description: dummyText,
      price: 349.99,
      score: 2.5,
      images: [
        AppAsset.hbo,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF455a64), isSelected: true),
        FurnitureColor(color: const Color(0xFF263238)),
      ],
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Apple TV 1 Bulan',
      description: dummyText,
      price: 499.99,
      score: 2.8,
      images: [
        AppAsset.appletv,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF5d4037), isSelected: true),
        FurnitureColor(color: const Color(0xFF455a64)),
      ],
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(const Icon(Icons.home), 'Home'),
    BottomNavigationItem(
        const Icon(Icons.add_shopping_cart_rounded), 'Shopping cart'),
    BottomNavigationItem(const Icon(Icons.bookmark), 'Favorite'),
    BottomNavigationItem(
        const Icon(Icons.shopping_cart_checkout_rounded), 'Orderan'),
    BottomNavigationItem(const Icon(Icons.person), 'Profile')
  ];
}
