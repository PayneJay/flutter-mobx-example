part of 'view.dart';

Widget buildExpandListView(BuildContext context, AssignStore store) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) => ExpansionTile(
          title: Text(
            '豪华大床房 $index',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.color333333,
            ),
          ),
          backgroundColor: Colors.white,
          initiallyExpanded: false,
          trailing: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          children: <Widget>[
            Container(
              color: AppColors.colorF6F6F6,
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: rooms
                      .map(
                        (label) => buildLabelView(context, store, label),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.colorEAEAEA,
          height: 1,
        ),
        itemCount: rooms.length,
      ),
    ),
  );
}
