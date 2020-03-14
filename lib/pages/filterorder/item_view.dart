part of 'view.dart';

Widget buildItemView(
    BuildContext context, FilterOrderStore store, FilterType type) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    child: Container(
      height: 45,
      padding: EdgeInsets.only(left: 12, right: 4),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Text(
              itemTitles[FilterTypeValues[type]],
              style: TextStyle(color: AppColors.color333333, fontSize: 15),
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Observer(
                  builder: (_) => Expanded(
                    child: Text(
                      setText(store, type),
                      style: TextStyle(
                        color: _setColor(store, type),
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors.colorCCCCCC,
                )
              ],
            ),
            flex: 3,
          ),
        ],
      ),
    ),
    onTap: () => showPickerByType(context, store, type),
  );
}

Color _setColor(FilterOrderStore store, FilterType type) {
  if (type == FilterType.startTime) {
    DateTime startTime = getStartTime(store);
    return (startTime == null) ? AppColors.colorCCCCCC : AppColors.color333333;
  } else if (type == FilterType.endTime) {
    DateTime endTime = getEndTime(store);
    return (endTime == null) ? AppColors.colorCCCCCC : AppColors.color333333;
  }
  return AppColors.color333333;
}

const List itemTitles = [
  '状态',
  '渠道',
  '开始时间',
  '结束时间',
];
