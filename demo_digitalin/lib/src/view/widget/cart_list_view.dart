import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo_digitalin/core/app_extension.dart';
import 'package:demo_digitalin/core/app_style.dart';
import '../../model/furniture.dart';

class CartListView extends StatelessWidget {
  const CartListView(
      {Key? key, required this.counterButton, required this.furnitureItems})
      : super(key: key);

  final Widget Function(Furniture furniture) counterButton;
  final List<Furniture> furnitureItems;

  doCheckout(nama_barang) async {
    final GlobalKey<State> _keyLoader = GlobalKey<State>();
    print(nama_barang);
    Map<String, Object> Transaction = {
      "payment_type": "bank_transfer",
      "bank_transfer": {"bank": "permata"},
      "transaction_details": {"order_id": "C12550", "gross_amount": 10000},
      "nama_barang": "Xbox Pass"
    };

    try {
      final response = await http.post(Uri.parse("http://localhost:5000/api/"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "nama_barang": nama_barang,
            "status": "pending",
            "response_midtrans": Transaction
          }));

      final output = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print(response.body);
      }
    } catch (e) {
      // debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: furnitureItems.length,
      itemBuilder: (_, index) {
        Furniture furniture = furnitureItems[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    furniture.images[0],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(furniture.title.addOverFlow, style: h4Style),
                  const SizedBox(height: 5),
                  Text("Rp. ${furniture.price}", style: h2Style),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      doCheckout(furniture.title);
                    },
                    child: null,
                  )
                ],
              ),
              // Spacer(),
              counterButton(furniture)
            ],
          ).fadeAnimation(0.4 * index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}
