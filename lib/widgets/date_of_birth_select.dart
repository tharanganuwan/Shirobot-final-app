import 'package:flutter/material.dart';
import 'package:shiro_bot/widgets/app_dialogs.dart';
import 'package:shiro_bot/widgets/app_text.dart';

class DateOfBirthSelect extends StatefulWidget {
  final ValueChanged<String> onDateOfBirthChanged;

  const DateOfBirthSelect({Key? key, required this.onDateOfBirthChanged})
      : super(key: key);

  @override
  State<DateOfBirthSelect> createState() => _DateOfBirthSelectState();
}

class _DateOfBirthSelectState extends State<DateOfBirthSelect> {
  String? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String? _date = await AppDialogs.showdatepicker(context);
        if (_date != null) {
          _selectedDate = _date;

          widget.onDateOfBirthChanged(_date);
          setState(() {});
        }
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppText(
              text: _selectedDate != null ? _selectedDate!.split("-")[2] : "DD",
              color: _selectedDate != null
                  ? Colors.black
                  : const Color(0xFFC4C4C4),
              fontWeight:
                  _selectedDate != null ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppText(
              text: _selectedDate != null ? _selectedDate!.split("-")[1] : "MM",
              color: _selectedDate != null
                  ? Colors.black
                  : const Color(0xFFC4C4C4),
              fontWeight:
                  _selectedDate != null ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            height: 50,
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppText(
              text:
                  _selectedDate != null ? _selectedDate!.split("-")[0] : "YYYY",
              color: _selectedDate != null
                  ? Colors.black
                  : const Color(0xFFC4C4C4),
              fontWeight:
                  _selectedDate != null ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
