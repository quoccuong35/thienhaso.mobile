// ignore_for_file: use_build_context_synchronously

import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/constants/app.functions.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/api/schedulelist.api.dart';
import 'package:mobile/core/models/schedulelist.dart';
import 'package:mobile/core/utils/snackbar.util.dart';

class ThoiKhoaBieuNotifier extends ChangeNotifier {
  late DateTime fromdate;
  late DateTime todate;
  late int selectedIndexTab;
  late List<ScheduleList> datas = List.empty();
  late List<ScheduleList> serachedScheduleList = List.empty();
  late String titlesearch = "";
  late bool isLoading = true;
  late bool lichhoc = false;
  late bool lichthi = false;
  final f = DateFormat('dd/MM/yyyy');
  final fApi = DateFormat('yyyy-MM-dd');
  ScheduleListApi scheduleListApi = ScheduleListApi();
  ThoiKhoaBieuNotifier() {
    fromdate = AppFunctions.startDateTheWeek(DateTime.now());
    todate = AppFunctions.lastDateTheWeek(DateTime.now());
    selectedIndexTab = 0;
    titlesearch = "${f.format(fromdate)} - ${f.format(todate)}";
  }

  loadData() {
    //serachedThoiKhoaBieu.clear();
    if (selectedIndexTab == 0) {
      serachedScheduleList = datas;
      if (lichhoc != lichthi) {
        if (lichhoc) {
          serachedScheduleList =
              datas.where((it) => it.isTestSchedule == 0).toList();
        } else if (lichthi) {
          serachedScheduleList =
              datas.where((it) => it.isTestSchedule == 1).toList();
        }
      }
    } else if (selectedIndexTab == 1) {
      serachedScheduleList =
          datas.where((it) => it.isTestSchedule == 0).toList();
    } else if (selectedIndexTab == 2) {
      serachedScheduleList =
          datas.where((it) => it.isTestSchedule == 1).toList();
    }
    notifyListeners();
  }

  Future<void> onItemTapped(int value) async {
    selectedIndexTab = value;
    loadData();
  }

  setdate(DateTime from, DateTime to) {
    fromdate = from;
    todate = to;
    setTitle();
  }

  setTitle() {
    titlesearch = "${f.format(fromdate)} - ${f.format(todate)}";
  }

  onChangedLichHoc(bool value) {
    lichhoc = value;
    loadData();
  }

  onChangedLichThi(bool value) {
    lichthi = value;
    loadData();
  }

  Future getDataFromAPI({required BuildContext context}) async {
    if (!isLoading) {
      isLoading = !isLoading;
      notifyListeners();
    }

    String token = "";
    await ReadCache.getString(key: AppKeys.token).then((value) {
      if (value != null) {
        token = value;
      }
    });
    String username = "";
    await ReadCache.getString(key: AppKeys.username).then((value) {
      if (value != null) {
        username = value;
      }
    });
    int studentID = 0;
    await ReadCache.getInt(key: AppKeys.studentID).then((value) {
      if (value != null) {
        studentID = value;
      }
    });
    if (token != "" && username != "" && studentID > 0) {
      var result = await scheduleListApi.getScheduleList(
          token: token,
          username: username,
          studentID: studentID,
          fromDate: fApi.format(fromdate),
          toDate: fApi.format(todate),
          context: context);
      datas = List.empty();
      if (result['responseCode'] == 0) {
        datas = List.from(result['body'])
            .map((e) => ScheduleList.fromJson(e))
            .toList();
      } else {
        showSnackBar(text: result['responseDesc'], context: context);
      }
      isLoading = !isLoading;
      loadData();
    }
  }
}
