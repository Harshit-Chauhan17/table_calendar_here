// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../customization/header_style.dart';
import '../shared/utils.dart' show CalendarFormat, DayBuilder;
import 'custom_icon_button.dart';
import 'format_button.dart';

class CalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final HeaderStyle headerStyle;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onHeaderTap;
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;
  final VoidCallback? onMonthTap;
  final VoidCallback? onYearTap;
  final bool? isMonthYearDisabled;

  const CalendarHeader({
    Key? key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required this.headerStyle,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onHeaderTap,
    required this.onHeaderLongPress,
    required this.onFormatButtonTap,
    required this.availableCalendarFormats,
    this.headerTitleBuilder,
    this.onMonthTap,
    this.onYearTap,
    this.isMonthYearDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ??
        DateFormat.yMMMM(locale).format(focusedMonth);

    return Container(
      decoration: headerStyle.decoration,
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.max,
        children: [
          if (headerStyle.leftChevronVisible)
            // CustomIconButton(
            //   icon: headerStyle.leftChevronIcon,
            //   onTap: onLeftChevronTap,
            //   margin: headerStyle.leftChevronMargin,
            //   padding: headerStyle.leftChevronPadding,
            // ),
            InkWell(
              onTap: onLeftChevronTap,
              child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffF4F5F5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  // padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.chevron_left,
                    size: 20,
                  )),
              //  Text(
              //   String.fromCharCode(CupertinoIcons.chevron_back.codePoint),
              //   style: TextStyle(
              //     inherit: false,
              //     color: Colors.black,
              //     fontSize: 16.0,
              //     fontWeight: FontWeight.w100,
              //     fontFamily: CupertinoIcons.chevron_back.fontFamily,
              //     package: CupertinoIcons.chevron_back.fontPackage,
              //   ),
              // )
            ),
          headerTitleBuilder?.call(context, focusedMonth) ??
              Row(
                children: [
                  InkWell(
                    onTap: onMonthTap,
                    // onLongPress: onHeaderLongPress,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                          color: isMonthYearDisabled == true
                              ? Colors.white
                              : Color(0xffF4F5F5),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        text.split(' ')[0],
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0XFF252E3D),
                            fontWeight: FontWeight.w600,
                            height: 1),
                        textAlign: headerStyle.titleCentered
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: onYearTap,
                    // onLongPress: onHeaderLongPress,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                          color: isMonthYearDisabled == true
                              ? Colors.white
                              : Color(0xffF4F5F5),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        text.split(' ')[1],
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0XFF252E3D),
                            fontWeight: FontWeight.w600,
                            height: 1),
                        textAlign: headerStyle.titleCentered
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
                    ),
                  )
                ],
              ),
          // if (headerStyle.formatButtonVisible &&
          //     availableCalendarFormats.length > 1)
          //   Padding(
          //     padding: const EdgeInsets.only(left: 8.0),
          //     child: FormatButton(
          //       onTap: onFormatButtonTap,
          //       availableCalendarFormats: availableCalendarFormats,
          //       calendarFormat: calendarFormat,
          //       decoration: headerStyle.formatButtonDecoration,
          //       padding: headerStyle.formatButtonPadding,
          //       textStyle: headerStyle.formatButtonTextStyle,
          //       showsNextFormat: headerStyle.formatButtonShowsNext,
          //     ),
          //   ),
          if (headerStyle.rightChevronVisible)
            // CustomIconButton(
            //   icon: headerStyle.rightChevronIcon,
            //   onTap: onRightChevronTap,
            //   margin: headerStyle.rightChevronMargin,
            //   padding: headerStyle.rightChevronPadding,
            // ),
            InkWell(
                onTap: onRightChevronTap,
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xffF4F5F5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                    ))
                // Text(
                //   String.fromCharCode(
                //       CupertinoIcons.chevron_forward.codePoint),
                //   style: TextStyle(
                //     inherit: false,
                //     color: Colors.black,
                //     fontSize: 16.0,
                //     fontWeight: FontWeight.w100,
                //     fontFamily: CupertinoIcons.chevron_back.fontFamily,
                //     package: CupertinoIcons.chevron_back.fontPackage,
                //   ),
                // )),
                )
        ],
      ),
    );
  }
}
