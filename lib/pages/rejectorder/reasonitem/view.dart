import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/pages/rejectorder/reasonitem/store.dart';

import '../reject_order.dart' show reasons;
import '../store.dart';
import 'effect.dart';

Widget buildView(BuildContext context, RejectItemStore store,
    RejectOrderStore parentStore, int index) {
  return Observer(
    builder: (_) => Column(
      children: <Widget>[
        ListTile(
          title: Text(reasons[index].name),
          trailing: Offstage(
            offstage: !(parentStore.groupValue.id == store.value.id),
            child: Icon(
              Icons.check,
              color: AppColors.color58BC62,
            ),
          ),
          onTap: () => onItemClick(context, store, parentStore, reasons[index]),
        ),
        Offstage(
          offstage: !(reasons[index].id == 0 &&
              parentStore.groupValue.id == store.value.id),
          child: Container(
            margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: TextField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: parentStore.otherReason ?? '',
                  selection: TextSelection.fromPosition(
                    TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: (parentStore.otherReason == null)
                            ? 0
                            : parentStore.otherReason.length),
                  ),
                ),
              ),
              autofocus: false,
              decoration: InputDecoration(
                hintText: "备注",
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.colorDDDDDD),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.colorDDDDDD),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
              keyboardType: TextInputType.text,
              onChanged: (selected) =>
                  onInputChanged(context, parentStore, selected),
              maxLength: 200,
              maxLines: 5,
            ),
          ),
        ),
      ],
    ),
  );
}
