import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../widgets/orderitem.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({
    Key? key,
  }) : super(key: key);
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    controller!.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (controller!.indexIsChanging) {
      switch (controller!.index) {
        case 0:
          break;
        case 1:
          break;
      }
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.height * 0.1),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20),
              child: TabBar(
                indicator: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.transparent, width: 0)),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: controller,
                onTap: (v) {
                  if (v == 0) {
                  } else {}
                },
                isScrollable: true,
                tabs: const [
                  Tab(
                    child: Text(
                      'الطلبات المقبولة',
                      style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الطلبات المرفوضة',
                      style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, i) => const OrdersItem(
              isAcceptd: true,
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, i) => const OrdersItem(
              isAcceptd: false,
            ),
          ),
        ],
      ),
    );
  }
}
