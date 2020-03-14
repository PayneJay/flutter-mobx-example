part of 'view.dart';

Widget buildSelectedListView(BuildContext context, AssignStore store) {
  return Scrollbar(
    child: SingleChildScrollView(
      child: Wrap(
        spacing: 10.0,
        runSpacing: 5.0,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: store.selectedList
            .map(
              (label) => Container(
                height: 30,
                child: Chip(
                  backgroundColor: Colors.white,
                  label: Container(
                    child: Text(
                      label.name,
                      style: TextStyle(color: AppColors.color333330, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  deleteIcon: Icon(
                    Icons.cancel,
                    size: 16,
                  ),
                  deleteIconColor: Colors.red,
                  onDeleted: () => deleteLabel(context, store, label),
                ),
              ),
            )
            .toList(),
      ),
    ),
  );
}
