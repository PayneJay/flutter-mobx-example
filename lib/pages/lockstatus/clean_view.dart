part of 'view.dart';

Widget buildCleanView(BuildContext context, LockStatusStore store) {
  return Container(
    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 260),
    constraints: BoxConstraints(maxHeight: 145),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
      boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(1, 1), blurRadius: 15),
        BoxShadow(
          color: Colors.white,
        )
      ],
    ),
    child: Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          height: 45,
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            children: <Widget>[
              Icon(
                IconFont.qiantai_shixin,
                color: AppColors.color58BC62,
                size: 18,
              ),
              Padding(padding: EdgeInsets.only(left: 13)),
              Text(
                '脏净状态',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.color58BC62,
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          color: AppColors.colorEAEAEA,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Observer(
                  builder: (_) => Text(
                    store.isClean ? '净' : '脏',
                    style: TextStyle(
                      fontSize: 37,
                      color: AppColors.color58BC62,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(left: 15, right: 15),
              ),
              FlatButton(
                onPressed: () => switchCleanStatus(store),
                child: Chip(
                  backgroundColor: AppColors.color58BC62,
                  label: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    constraints: BoxConstraints(maxHeight: 45),
                    alignment: Alignment.center,
                    child: Observer(
                      builder: (_) => Text(
                        store.isClean ? '置为脏房' : '置为净房',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          flex: 2,
        )
      ],
    ),
  );
}
