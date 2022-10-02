import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:yalla_delivery/service_locator.dart';

import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationsCubit>(),
      child: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {} ,
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, i) => NotificationItem(),
            ),
          );
        }
      ),
    );
  }
}
