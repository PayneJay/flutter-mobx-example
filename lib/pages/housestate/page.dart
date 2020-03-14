import 'package:flutter/material.dart';
import 'package:flutter_mobx_example/pages/lockstatus/lock_status.dart';

class HouseStatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text('房态'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LockStatusPage(),
            ),
          );
        },
      ),
    );
  }
}
