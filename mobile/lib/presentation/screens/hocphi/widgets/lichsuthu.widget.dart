import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/notifiers/hocphi.notifer.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class LichThuThu extends StatelessWidget {
  const LichThuThu({super.key});

  @override
  Widget build(BuildContext context) {
    final f = NumberFormat("###,###", "en_US");
    return Consumer<HocPhiNotifier>(builder: (context, hocPhi, _) {
      return FutureBuilder(
          future: hocPhi.getLichSuThu(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoading.Loading(context: context);
            } else if (!snapshot.hasData) {
              return CustomDataEntyWidget.KhongCoDuLieu();
            } else {
              var data = snapshot.data;
              return ListView.builder(
                padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: ExpansionTile(
                    backgroundColor: AppColors.color1,
                    collapsedBackgroundColor: AppColors.color1,
                    title: Text(
                      data[index]["Reason"],
                      style: CustomTextWidget.bodyTextS14B(),
                    ),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        margin: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        constraints: const BoxConstraints(
                          minHeight: 100.0,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 15.0,
                                color: AppColors.blackShadow,
                                offset: Offset(
                                  0,
                                  15.0,
                                ),
                                spreadRadius: 13.0,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: AppColors.blueGrey,
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.monetization_on,
                                      color: Colors.green,
                                      size: 50.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text("Số biên lai",
                                                style: CustomTextWidget
                                                    .bodyTextS14B()),
                                            Text(
                                              data[index]["ReceiptNo"],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("Số tiền",
                                                style: CustomTextWidget
                                                    .bodyTextS14B()),
                                            Text(
                                              f
                                                  .format(data[index]
                                                      ['TotalMoney']!)
                                                  .toString(),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            vSizedBox1,
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.blueGrey,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("Ngày thu",
                                          style:
                                              CustomTextWidget.bodyTextS14B()),
                                      Text(
                                        data[index]["ReceiptDate"],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Trạng thái",
                                          style:
                                              CustomTextWidget.bodyTextS14B()),
                                      Text(data[index]['PaymentStatusName']!)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Hình thức nộp",
                                          style:
                                              CustomTextWidget.bodyTextS14B()),
                                      Text(data[index]['PaymentMethodName']!)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          });
    });
  }
}
