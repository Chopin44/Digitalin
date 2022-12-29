import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_digitalin/core/app_color.dart';
import 'package:demo_digitalin/core/app_style.dart';
import 'package:demo_digitalin/src/controller/subscription_controller.dart';
import 'package:demo_digitalin/src/view/widget/counter_button.dart';
import 'package:demo_digitalin/src/view/widget/empty_widget.dart';
import '../widget/bottom_bar.dart';
import '../widget/cart_list_view.dart';
import 'home_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Bayar", style: h2Style),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,
          icon: const Icon(
            Icons.delete,
            color: AppColor.lightBlack,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Total Harga",
            priceValue: "Rp.${controller.totalPrice.value.toStringAsFixed(2)}",
            buttonLabel: "Order",
            onTap: controller.totalPrice > 0 ? () {} : null,
          );
        },
      ),
      body: GetBuilder(
        builder: (OfficeFurnitureController controller) {
          return controller.cartFurniture.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: CartListView(
                      furnitureItems: controller.cartFurniture,
                      counterButton: (furniture) {
                        return CounterButton(
                            orientation: Axis.vertical,
                            onIncrementSelected: () =>
                                controller.increaseItem(furniture),
                            onDecrementSelected: () =>
                                controller.decreaseItem(furniture),
                            label: furniture.quantity);
                      }),
                )
              : const EmptyWidget(title: "Kosong");
        },
      ),
    );
  }
}
