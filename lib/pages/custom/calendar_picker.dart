import 'package:flutter/material.dart';

class _CalendarPicker extends StatefulWidget {
  const _CalendarPicker({
    Key key,
    this.initialStartDate,
    this.initialEndDate,
    this.firstDate,
    this.lastDate,
    this.selectableDayPredicate,
  }) : super(key: key);

  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final SelectableDayPredicate selectableDayPredicate;

  @override
  _CalendarPickerState createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<_CalendarPicker> {
  List<DateTime> _selectRange = [];

  @override
  void initState() {
    super.initState();
    _selectRange =
        _Constant._dayDelta(widget.initialStartDate, widget.initialEndDate);
    print('initState initialStartDate : ${widget.initialStartDate}');
    print('initState initialEndDate : ${widget.initialEndDate}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                Color(int.parse('0xFF039FA7')),
                Color(int.parse('0xFF5AAD6E'))
              ]),
            ),
            child: _title(context),
          ),
          Container(
            height: 400,
            child: ListView(
              children: _buildItems(context),
            ),
          ),
          _padding(_confirmBtn(context), left: 15, right: 15),
        ],
      ),
    );
  }

  _title(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 28),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Text(
                    '请选择入离日期',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                Align(
                  child: GestureDetector(
                    onTap: () {
                      print('取消');
                      _cancelClick(context);
                    },
                    child: _padding(
                        Text('取消',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        right: 12),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
          ),
          _padding(_weekRow(context), bottom: 10),
        ],
      ),
    );
  }

  /// 周的标题
  _weekRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _weekRowItem(context, "日"),
        _weekRowItem(context, "一"),
        _weekRowItem(context, "二"),
        _weekRowItem(context, "三"),
        _weekRowItem(context, "四"),
        _weekRowItem(context, "五"),
        _weekRowItem(context, "六"),
      ],
    );
  }

  /// 周标题的item
  _weekRowItem(BuildContext context, String week) {
    return Container(
      width: 40,
      alignment: AlignmentDirectional.center,
      child: Text(
        week,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }

  /// 子view
  _buildItems(BuildContext context) {
    List<Widget> items = [];
    final int monthCount =
        _Constant._monthDelta(widget.firstDate, widget.lastDate);
    for (int i = 0; i < monthCount; i++) {
      List<Widget> views = _buildMonthWithDays(
          context, _Constant._addMonthsToMonthDate(widget.firstDate, i));
      for (int j = 0; j < views.length; j++) {
        items.add(views[j]);
      }
    }
    return items;
  }

  List<Widget> _buildMonthWithDays(BuildContext context, DateTime dateTime) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    List<Widget> items = [];
    final int year = dateTime.year;
    final int month = dateTime.month;
    final int daysInMonth = _Constant.getDaysInMonth(year, month);
    final int firstDayOffset =
        _Constant.computeFirstDayOffset(year, month, localizations);

    for (int i = 0; true; i += 1) {
      final int day = i - firstDayOffset + 1;
      if (day > daysInMonth) {
        break;
      }
      // print("day:$day");
      if (day < 1) {
        items.add(_dayBankItem(context));
      } else {
        final DateTime dayToBuild = DateTime(year, month, day);
        final bool isIODay = _Constant._contains(dayToBuild, _selectRange);
        final bool isCheckInDay =
            _Constant.isCheckInDay(dayToBuild, _selectRange);
        final bool isCheckInOnlyDay =
            _Constant._isOnlyCheckInDay(dayToBuild, _selectRange);
        final bool isCheckOutDay =
            _Constant.isCheckOutDay(dayToBuild, _selectRange);
        final bool disabled =
            _Constant.disabled(dayToBuild, widget.lastDate, widget.firstDate);
        if (isCheckInOnlyDay) {
          // print("if isCheckInOnlyDay");
          items.add(_dayOnlyFirstItem(context, dayToBuild));
        } else if (isCheckInDay) {
          // print("if isCheckInDay");
          items.add(_dayCheckInItem(context, dayToBuild));
        } else if (isCheckOutDay) {
          // print("if isCheckOutDay");
          items.add(_dayCheckOutItem(context, dayToBuild));
        } else if (isIODay) {
          // print("if isIODay");
          items.add(_dayIOItem(context, dayToBuild));
        } else if (disabled) {
          // print("if disabled");
          items.add(_dayDisableItem(context, dayToBuild));
        } else {
          // print("if else");
          items.add(_dayItem(context, dayToBuild));
        }
      }
    }

    int needItems = 0;
    if ((items.length) % 7 != 0) {
      needItems = 7 - (items.length) % 7;
    }
    for (int i = 0; i < needItems; i++) {
      items.add(_dayBankItem(context));
    }

    List<Widget> rowItems = [];
    var rowCount = (items.length) / 7;
    rowItems.add(_monthItem(context, dateTime));
    for (int i = 0; i < rowCount; i++) {
      rowItems.add(_dayInMonthRow(context, items.sublist(i * 7, i * 7 + 7)));
    }
    //print("${_Constant.getYearMonth(dateTime)}的items的size:${items.length}");
    return rowItems;
  }

  /// 2020年08月 item
  _monthItem(BuildContext context, DateTime dateTime) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _Constant.getYearMonth(dateTime),
            style: TextStyle(
              fontSize: 15,
              color: Color(int.parse('0xFF333333')),
            ),
          ),
        ],
      ),
    );
  }

  ///在月中的day的样式
  _dayInMonthRow(BuildContext context, List<Widget> items) {
    List<Widget> expandItems = [];
    items.forEach((item) {
      expandItems.add(Expanded(
        child: item,
        flex: 1,
      ));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: expandItems,
    );
  }

  _dayItem(BuildContext context, DateTime date) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    Container child = Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 40,
      height: 40,
      alignment: AlignmentDirectional.center,
      child: Text(
        localizations.formatDecimal(date.day),
        style: TextStyle(
          fontSize: 15,
          color: Color(int.parse("0xff333333")),
        ),
      ),
    );
    return _addClick(context, child, date);
  }

  _dayDisableItem(BuildContext context, DateTime date) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 40,
      height: 40,
      alignment: AlignmentDirectional.center,
      child: Text(
        localizations.formatDecimal(date.day),
        style: TextStyle(
          fontSize: 15,
          color: Color(int.parse("0xffcccccc")),
        ),
      ),
    );
  }

  _dayCheckInItem(BuildContext context, DateTime date) {
    Container child = Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(int.parse('0x8058BC62')),
      ),
      foregroundDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
          bottomLeft: Radius.circular(100),
        ),
//        color: Color(int.parse('0x33FF0000')),
        gradient: LinearGradient(
            begin: Alignment(-0.5, 0.0),
            colors: [Colors.transparent, Color(int.parse('0x3358BC62'))]),
      ),
      width: 40,
      height: 40,
      alignment: AlignmentDirectional.center,
      child: Text(
        '入住',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
    return _addClick(context, child, date);
  }

  _dayCheckOutItem(BuildContext context, DateTime date) {
    Container child = Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(int.parse('0xFF58BC62')),
      ),
      foregroundDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        gradient: LinearGradient(
            end: Alignment(0.5, 0.0),
            colors: [Color(int.parse('0x3358BC62')), Colors.transparent]),
      ),
      width: 40,
      height: 40,
      alignment: AlignmentDirectional.center,
      child: Text(
        '离店',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
    return _addClick(context, child, date);
  }

  _dayOnlyFirstItem(BuildContext context, DateTime date) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    Container child = Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(int.parse('0xFF58BC62')),
      ),
      width: 40,
      height: 40,
      alignment: AlignmentDirectional.center,
      child: Text(
        localizations.formatDecimal(date.day),
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
    return _addClick(context, child, date);
  }

  _dayIOItem(BuildContext context, DateTime date) {
    //print('_dayIOItem date :  ${date.toString()}');
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    Container child = Container(
      margin: EdgeInsets.only(bottom: 5),
      foregroundDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(int.parse('0x3358BC62')),
      ),
      height: 40,
      alignment: AlignmentDirectional.center,
      child: Text(
        localizations.formatDecimal(date.day),
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
    return _addClick(context, child, date);
  }

  _dayBankItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 40,
      height: 40,
      alignment: AlignmentDirectional.center,
      child: null,
    );
  }

  _addClick(BuildContext context, Widget child, DateTime date) {
    return GestureDetector(
      child: child,
      onTap: () {
        print('date: ${date.year}-${date.month}-${date.day}');
        setState(() {
          _dealDate(date);
        });
      },
    );
  }

  _cancelClick(BuildContext context) {
    Navigator.of(context).pop();
  }

  _confirmClick(BuildContext context) {
    print('确定');
    Navigator.of(context).pop();
  }

  Widget _padding(
    Widget child, {
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      child: child,
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    );
  }

  _dealDate(DateTime date) {
    // print('_dealDate _selectRange.length : ${_selectRange.length}');
    if (_selectRange.length == 0) {
      _selectRange.add(date);
    } else if (_selectRange.length == 1) {
      if (_selectRange[0].isAfter(date)) {
        _selectRange.clear();
        _selectRange.add(date);
      } else if (_Constant.isSame(_selectRange[0], date)) {
        _selectRange.clear();
      } else {
        _selectRange = _Constant._dayDelta(_selectRange[0], date);
      }
    } else {
      _selectRange.clear();
      _selectRange.add(date);
    }
  }

  _confirmBtn(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 44,
        decoration: BoxDecoration(
            color: Color(int.parse('0xFF58BC62')),
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            )),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '确定',
              style: TextStyle(fontSize: 17, color: Colors.white),
            )
          ],
        ),
      ),
      onTap: () {
        _confirmClick(context);
      },
    );
  }
}

class _Constant {
  static const List<int> _daysInMonth = <int>[
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) {
        return 29;
      }
      return 28;
    }
    return _daysInMonth[month - 1];
  }

  static bool disabled(DateTime day, DateTime last, DateTime first) {
//    print('day$day last:$last first:$first  day.isAfter(last) : ${day.isAfter(last)}  day.isBefore(first) : ${day.isBefore(first)}');
    return day == null || day.isAfter(last) || day.isBefore(first);
  }

  static bool isSame(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static String getYearMonth(DateTime dateTime) {
    String month =
        dateTime.month < 10 ? "0${dateTime.month}" : "${dateTime.month}";
    return '${dateTime.year}年$month月';
  }

  static int computeFirstDayOffset(
      int year, int month, MaterialLocalizations localizations) {
    // 0-based day of week, with 0 representing Monday.
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;
    // 0-based day of week, with 0 representing Sunday.
    final int firstDayOfWeekFromSunday = localizations.firstDayOfWeekIndex;
    // firstDayOfWeekFromSunday recomputed to be Monday-based
    final int firstDayOfWeekFromMonday = (firstDayOfWeekFromSunday - 1) % 7;
    // Number of days between the first day of week appearing on the calendar,
    // and the day corresponding to the 1-st of the month.
    return (weekdayFromMonday - firstDayOfWeekFromMonday) % 7;
  }

  static int _monthDelta(DateTime startDate, DateTime endDate) {
    return (endDate.year - startDate.year) * 12 +
        endDate.month -
        startDate.month;
  }

  /// Add months to a month truncated date.
  static DateTime _addMonthsToMonthDate(DateTime monthDate, int monthsToAdd) {
    return DateTime(
        monthDate.year + monthsToAdd ~/ 12, monthDate.month + monthsToAdd % 12);
  }

  static List<DateTime> _dayDelta(DateTime start, DateTime end) {
    List<DateTime> result = [];
    Duration duration = start.difference(end);
    int dayCount = duration.inDays.abs();
    // print('_dayDelta: $dayCount');
    // print('start: $start  end: $end');
    for (int i = 0; i <= dayCount; i++) {
      result.add(start.add(Duration(days: i)));
    }
    // print('result: $result');
    return result;
  }

  static bool _contains(DateTime time, List<DateTime> list) {
    if (list == null || time == null || list.length == 0) {
      return false;
    }
    for (int i = 0; i < list.length; i++) {
      // print('time: ${time.year}-${time.month}-${time.day}   list[$i]: ${list[i]}-${list[i]}-${list[i]}');
      if (isSame(time, list[i])) {
        return true;
      }
    }
    return false;
  }

  static bool isCheckInDay(DateTime time, List<DateTime> list) {
    if (list == null || time == null || list.length == 0) {
      return false;
    }
    return isSame(time, list[0]);
  }

  static bool isCheckOutDay(DateTime time, List<DateTime> list) {
    if (list == null || time == null || list.length <= 1) {
      return false;
    }
    return isSame(time, list[list.length - 1]);
  }

  static bool _isOnlyCheckInDay(DateTime time, List<DateTime> list) {
    if (list == null || time == null || list.length == 0) {
      return false;
    }
    return isSame(time, list[0]) && list.length == 1;
  }
}

Future<List<DateTime>> showBottomCalendarPicker({
  @required BuildContext context,
  @required DateTime initialStartDate,
  @required DateTime initialEndDate,
  @required DateTime firstDate,
  @required DateTime lastDate,
}) {
  Widget child = _CalendarPicker(
    initialStartDate: initialStartDate,
    initialEndDate: initialEndDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    builder: (context) {
      return Wrap(
        children: <Widget>[child],
      );
    },
  );
}
