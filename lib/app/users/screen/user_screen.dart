import 'package:codixel/app/users/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class UserScreen extends GetView<UserController> {
  UserScreen({super.key});
  var format = DateFormat.yMMMMd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: controller.obx(
        (state) => Center(
          child: Container(
            color: Colors.grey,
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  state!.avatar,
                  width: 150,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
                const SizedBox(height: 40),
                // TODO: use first_name & last_name fields from json
                Text("${state.firstName} ${state.lastName}",
                    style: ThemeData().textTheme.labelLarge),
                // TODO: phone_number
                Text(" ${state.phoneNumber} ",
                    style: ThemeData().textTheme.labelLarge),
                // TODO: format date_of_birth properly
                Text(format.format(state.dateOfBirth),
                    style: ThemeData().textTheme.labelLarge),
              ],
            ),
          ),
        ),
        onError: (error) => Text("$error"),
        onLoading: const Center(
          child: SizedBox(
              height: 90,
              width: 90,
              child: RiveAnimation.asset(
                'assets/loading_new.riv',
              )),
        ),
        onEmpty: const Center(child: Text("No Data"),)
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          
          controller.getUser();
        },
      ),
    );
  }
}
