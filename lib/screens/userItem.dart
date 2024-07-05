import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserItem extends StatelessWidget {
  const UserItem(
      {super.key,
      required this.name,
      required this.telephone,
      required this.id});

  final String name;
  final String telephone;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 0.1.h,
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.indigo,
            child: Image.asset("assets/images/Avatar-20.png"),
          ),
          title: Text(
            name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            telephone,
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
        ),
        Divider(
          thickness: 0.1,
        )
      ],
    );
  }
}
