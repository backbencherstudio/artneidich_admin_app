import 'package:artneidich_admin/src/feature/common_widgets/appBar/appBar.dart';
import 'package:artneidich_admin/src/feature/common_widgets/delete_bottomsheet/delete_bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonWidget {
  static Widget appBar({String? title}) =>
      CustomAppbar(title: title,);


// static Widget deleteSheet({BuildContext?context ,void Function()? ontap})=> showDeleteSheet(context, ontap);
}
