import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/notifiers/notifylist.notifer.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:provider/provider.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotifyListNotifier>(builder: (context, notify, _) {
      return SafeArea(
          top: false,
          child: Scaffold(
            appBar: CustomAppbar("Thông báo", context),
            backgroundColor: AppColors.creamColor,
            body: notify.counter == 0
                ? CustomDataEntyWidget.KhongCoDuLieu()
                : ListView.builder(
                    padding: const EdgeInsets.all(5.0),
                    itemCount: notify.datas.length,
                    itemBuilder: (context, index) {
                      var item = notify.datas[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            item.title,
                            style: CustomTextWidget.bodyTextS18Cblue(),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  Text(item.sentDate),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.home),
                                  Text(item.senderName),
                                ],
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.blueGrey,
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                width: double.infinity,
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  item.content,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ));
    });
  }
}
