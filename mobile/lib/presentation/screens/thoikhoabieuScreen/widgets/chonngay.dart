import 'package:flutter/material.dart';
import 'package:mobile/core/notifiers/thoikhoabieu.notifier.dart';

// ignore: non_constant_identifier_names
void ChonNgay(BuildContext context, ThoiKhoaBieuNotifier thoikhoabieu) async {
  final DateTimeRange? result = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2000, 1, 1),
    lastDate: DateTime(2130, 12, 31),
    saveText: 'Chọn ngày',
  );
  if (result != null) {
    // Rebuild the UI
    thoikhoabieu.setdate(result.start, result.end);
    // ignore: use_build_context_synchronously
    thoikhoabieu.getDataFromAPI(context: context);
  }
}
