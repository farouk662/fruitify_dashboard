import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/helper_functions/get_order_dummy_data.dart';
import '../../../domain/entities/data/models/order_entity.dart';
import 'filter_section.dart';
import 'orders_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});

  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const FilterSection(),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: OrdersItemsListView(orderModels: orders)),
        ],
      ),
    );
  }
}
