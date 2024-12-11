import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/state.dart';

void showTermsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
   return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
  return Padding(
  padding: const EdgeInsets.all(16.0),
  child: SingleChildScrollView(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.max,

  children: [
  Center(
  child: Container(
  // width: 50,
  // height: 5,
  decoration: BoxDecoration(
  color: Colors.grey[300],
  borderRadius: BorderRadius.circular(10),
  ),
  ),
  ),
  SizedBox(height: 16),
  Text(
  "الشروط والأحكام",
  style: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  ),
  ),
  SizedBox(height: 16),
  Text(
  "خسائر اللازمة ومطالبة حدة بل، الذكر الحلفاء أن غزو. اجعل وقامت عدد مع ظهر معركة الأمريكي، انه. بربع الإثنان الحقبة في، انتهت المحور حيث و هذه ما طرفاً عالمية استسلام. المضي بتخصيص حين بل، وفتح الصرب الصفحة كل غزو. أسر كافة الاستئناف بل، وبعض وتزويد الصفحة غزو كل ثم تعداد الجنوب.",
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
  ),
  SizedBox(height: 16),
  Text(
  "قصف المسرح واستمر الاتحاد في، ذات آسيا للغزو الخطة، و. الذكر الألمانية جهة بل في سحقت هيروشيما البريطاني يتم، يعبأه الإنذار الأيديولوجية من قصف. دور ويمة أستراليا بـ. ٣٠ استسلام المسلم الملازمة كما مدد بمثابة طوكيو. قد أدى قبل الدمار كل العمليات اليابانية إن.",
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
  ),
  SizedBox(height: 16),
  Text(
  "حتى هاربر موسكو، وتقوم المتنصرة دارت على. التي فهرست وجهان ثم، كانت الساحل التحرير أن وفي. ان النهاية باستخدام فهر، عن ضمنها الأراضي الأوروبية ذات.",
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
  ),
  SizedBox(height: 16),
  Text(
  "خسائر اللازمة ومطالبة حدة بل، الذكر الحلفاء أن غزو. اجعل وقامت عدد مع ظهر معركة الأمريكي، انه. بربع الإثنان الحقبة في، انتهت المحور حيث و هذه ما طرفاً عالمية استسلام. المضي بتخصيص حين بل، وفتح الصرب الصفحة كل غزو. أسر كافة الاستئناف بل، وبعض وتزويد الصفحة غزو كل ثم تعداد الجنوب.",
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.justify,
  ),
  ],
  ),
  ),
  );
    },
  );
}
  );}