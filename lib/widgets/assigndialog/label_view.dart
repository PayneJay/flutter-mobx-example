part of 'view.dart';

Widget buildLabelView(
    BuildContext context, AssignStore assignStore, CommonOption label) {
  return Container(
    height: 30,
    child: Observer(
      builder: (_) => ChoiceChip(
        backgroundColor: Colors.white,
        disabledColor: AppColors.colorEAEAEA,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: AppColors.colorEAEAEA,
            width: 0.5,
          ),
        ),
        avatar: Icon(
          Icons.lock,
          size: 14,
          color: assignStore.selectedList.contains(label)
              ? AppColors.colorAA58BC62
              : AppColors.color58BC62,
        ),
        label: Container(
          child: Text(
            label.name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelStyle: TextStyle(
            color: assignStore.selectedList.contains(label)
                ? AppColors.colorAA333330
                : AppColors.color333330,
            fontSize: 15),
        selected: assignStore.selectedList.contains(label),
        onSelected: (selected) =>
            selected ? addLabel(context, assignStore, label) : null,
      ),
    ),
  );
}
