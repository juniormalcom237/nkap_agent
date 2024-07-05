import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nkap_agent/api/api_controller.dart';
import 'package:nkap_agent/screens/userItem.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/process_indicator.dart';

class AddTransactionScreen extends StatefulWidget {
  AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final MyController c = Get.find();

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              child: Icon(
                CupertinoIcons.chevron_back,
              ),
            ),
          ),
        ),
        title: Text(
          "Collect money",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.h,
                ),
                Container(
                  // padding: EdgeInsets.only(top: 10),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5.0),
                  //   color: Colors.white,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey,
                  //       offset: Offset(0.0, 1.0), //(x,y)
                  //       blurRadius: 6.0,
                  //     ),
                  //   ],
                  // ),
                  child: UserItem(
                    id: c.localDB.read("selectedUser").id,
                    name: c.localDB.read("selectedUser").name,
                    telephone: "679475110",
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 20),
                  decoration: BoxDecoration(),
                  height: 5.5.h,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text(
                        "Add a note...",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      suffixIcon: Icon(
                        Ionicons.document_text_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text("Amount"),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 20),
                  decoration: BoxDecoration(),
                  height: 5.5.h,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: "Enter an amount",
                      prefixStyle: TextStyle(),
                      prefixText: "FCFA ",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Obx(() {
                  return Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(87.w, 5.5.h),
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      onPressed: !c.isLoading.value
                          ? () {
                              c.createCollect(
                                  amountController.text,
                                  c.localDB.read("userData")['id'],
                                  c.localDB.read("selectedUser").id);
                            }
                          : null,
                      child: c.isLoading.value
                          ? MyProgressIndicator()
                          : Text(
                              "Done",
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
