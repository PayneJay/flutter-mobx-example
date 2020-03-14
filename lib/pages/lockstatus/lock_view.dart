part of 'view.dart';

Widget buildLockView(BuildContext context, LockStatusStore store) {
  return Container(
    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
    constraints: BoxConstraints(maxHeight: 245),
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
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.lock,
                      color: AppColors.color58BC62,
                      size: 18,
                    ),
                    Padding(padding: EdgeInsets.only(left: 13)),
                    Text(
                      '门锁信息',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.color58BC62,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                '客服电话：4006812010',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.color333333,
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
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.lock,
                  color: AppColors.color58BC62,
                  size: 38,
                ),
                margin: EdgeInsets.only(left: 15, right: 15),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '门锁正常',
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.color333333,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      '1.您可以购买5号南孚电池进行更换\n2.您可以使用未接电源开门后更换电池'.trim(),
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.color999999,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          flex: 2,
        ),
        Divider(
          height: 1,
          color: AppColors.colorEAEAEA,
        ),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.lock,
                    color: AppColors.color58BC62,
                    size: 38,
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '密码管家',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.color333333,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        '1.管家密码修改后将在下次办理入住时生效\n2.门锁通讯不加，管家密码可能无法使用'.trim(),
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.color999999,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () => modifyPassword(context, store),
          ),
          flex: 2,
        )
      ],
    ),
  );
}
