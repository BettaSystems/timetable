import 'dart:math';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:remind_timetable/src/utils.dart';
import 'package:remind_timetable/timetable.dart';

// A basic EventProvider containing a single event:
// eventProvider: EventProvider.list([
//   BasicEvent(
//     id: 0,
//     title: 'My Event',
//     color: Colors.blue,
//     start: LocalDate.today().at(LocalTime(13, 0, 0)),
//     end: LocalDate.today().at(LocalTime(15, 0, 0)),
//   ),
// ]),

// For a demo of overlapping events, use this one instead:
// eventProvider: positioningDemoEventProvider,

// Or even this short example using a Stream:
// eventProvider: EventProvider.stream(
//   eventGetter: (range) => Stream.periodic(
//     Duration(milliseconds: 16),
//     (i) {
//       final start =
//           LocalDate.today().atMidnight() + Period(minutes: i * 2);
//       return [
//         BasicEvent(
//           id: 0,
//           title: 'Event',
//           color: Colors.blue,
//           start: start,
//           end: start + Period(hours: 5),
//         ),
//       ];
//     },
//   ),
// ),

// _dateController.page.addListener(() {
//   print('New page: ${_dateController.page.value}');
// });
// _timeController.addListener(() {
//   print('New time range: ${_timeController.value}');
// });

final positioningDemoEvents = <BasicEvent>[
  // _DemoEvent(1, 1, 1.hours, 3.hours),
  _DemoEvent(0, -3, -3.hours, -2.hours),
  _DemoEvent(0, -2, -2.hours, -1.hours),
  _DemoEvent(0, -1, -1.hours, 0.hours),
  _DemoEvent(0, 0, 0.hours, 1.hours),
  _DemoEvent(0, 1, 1.hours, 2.hours),
  _DemoEvent(0, 2, 2.hours, 3.hours),
  _DemoEvent(0, 3, 3.hours, 4.hours),
  _DemoEvent(0, 4, 4.hours, 5.hours),
  _DemoEvent(0, 5, 5.hours, 6.hours),
  _DemoEvent(0, 6, 6.hours, 7.hours),
  _DemoEvent(0, 18, 18.hours, 19.hours),
  _DemoEvent(0, 23, 23.hours, 24.hours),
  _DemoEvent(0, 24, 24.hours, 25.hours),
  BasicEvent(
      id: "123",
      title: "My Event at 12 UTC - 13 UTC",
      backgroundColor: Colors.greenAccent,
      start: DateTime.now().atStartOfDay.copyWith(isUtc: true, hour: 12),
      end: DateTime.now().atStartOfDay.copyWith(isUtc: true, hour: 13)),
  BasicEvent(
      id: "124",
      title: "My Event at 12 - 13",
      backgroundColor: Colors.greenAccent,
      start: DateTime.now().atStartOfDay.copyWith(isUtc: false, hour: 12),
      end: DateTime.now().atStartOfDay.copyWith(isUtc: false, hour: 13)),
  // _DemoEvent(0, 0, const Duration(hours: 10), const Duration(hours: 11)),
  // _DemoEvent(0, 1, const Duration(hours: 11), const Duration(hours: 12)),
  // _DemoEvent(0, 2, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(1, 0, const Duration(hours: 10), const Duration(hours: 12)),
  // _DemoEvent(1, 1, const Duration(hours: 10), const Duration(hours: 12)),
  // _DemoEvent(1, 2, const Duration(hours: 14), const Duration(hours: 16)),
  // _DemoEvent(
  //   1,
  //   3,
  //   const Duration(hours: 14, minutes: 15),
  //   const Duration(hours: 16)
  // ),
  // _DemoEvent(2, 0, const Duration(hours: 10), const Duration(hours: 20)),
  // _DemoEvent(2, 1, const Duration(hours: 10), const Duration(hours: 12)),
  // _DemoEvent(2, 2, const Duration(hours: 13), const Duration(hours: 15)),
  // _DemoEvent(3, 0, const Duration(hours: 10), const Duration(hours: 20)),
  // _DemoEvent(3, 1, const Duration(hours: 12), const Duration(hours: 14)),
  // _DemoEvent(3, 2, const Duration(hours: 12), const Duration(hours: 15)),
  // _DemoEvent(4, 0, const Duration(hours: 10), const Duration(hours: 13)),
  // _DemoEvent(
  //   4,
  //   1,
  //   const Duration(hours: 10, minutes: 15),
  //   const Duration(hours: 13),
  // ),
  // _DemoEvent(
  //   4,
  //   2,
  //   const Duration(hours: 10, minutes: 30),
  //   const Duration(hours: 13),
  // ),
  // _DemoEvent(
  //   4,
  //   3,
  //   const Duration(hours: 10, minutes: 45),
  //   const Duration(hours: 13),
  // ),
  // _DemoEvent(4, 4, const Duration(hours: 11), const Duration(hours: 13)),
  // _DemoEvent(
  //   5,
  //   0,
  //   const Duration(hours: 10, minutes: 30),
  //   const Duration(hours: 13, minutes: 30),
  // ),
  // _DemoEvent(
  //   5,
  //   1,
  //   const Duration(hours: 10, minutes: 30),
  //   const Duration(hours: 13, minutes: 30),
  // ),
  // _DemoEvent(
  //   5,
  //   2,
  //   const Duration(hours: 10, minutes: 30),
  //   const Duration(hours: 12, minutes: 30),
  // ),
  // _DemoEvent(
  //   5,
  //   3,
  //   const Duration(hours: 8, minutes: 30),
  //   const Duration(hours: 18),
  // ),
  // _DemoEvent(
  //   5,
  //   4,
  //   const Duration(hours: 15, minutes: 30),
  //   const Duration(hours: 16),
  // ),
  // _DemoEvent(5, 5, const Duration(hours: 11), const Duration(hours: 12)),
  // _DemoEvent(5, 6, const Duration(hours: 1), const Duration(hours: 2)),
  // _DemoEvent(
  //   6,
  //   0,
  //   const Duration(hours: 9, minutes: 30),
  //   const Duration(hours: 15, minutes: 30),
  // ),
  // _DemoEvent(6, 1, const Duration(hours: 11), const Duration(hours: 13)),
  // _DemoEvent(
  //   6,
  //   2,
  //   const Duration(hours: 9, minutes: 30),
  //   const Duration(hours: 11, minutes: 30),
  // ),
  // _DemoEvent(
  //   6,
  //   3,
  //   const Duration(hours: 9, minutes: 30),
  //   const Duration(hours: 10, minutes: 30),
  // ),
  // _DemoEvent(6, 4, const Duration(hours: 10), const Duration(hours: 11)),
  // _DemoEvent(6, 5, const Duration(hours: 10), const Duration(hours: 11)),
  // _DemoEvent(
  //   6,
  //   6,
  //   const Duration(hours: 9, minutes: 30),
  //   const Duration(hours: 10, minutes: 30),
  // ),
  // _DemoEvent(
  //   6,
  //   7,
  //   const Duration(hours: 9, minutes: 30),
  //   const Duration(hours: 10, minutes: 30),
  // ),
  // _DemoEvent(
  //   6,
  //   8,
  //   const Duration(hours: 9, minutes: 30),
  //   const Duration(hours: 10, minutes: 30),
  // ),
  // _DemoEvent(
  //   6,
  //   9,
  //   const Duration(hours: 10, minutes: 30),
  //   const Duration(hours: 12, minutes: 30),
  // ),
  // _DemoEvent(6, 10, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(6, 11, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(6, 12, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(6, 13, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(
  //   6,
  //   14,
  //   const Duration(hours: 6, minutes: 30),
  //   const Duration(hours: 8),
  // ),
  // _DemoEvent(
  //   7,
  //   0,
  //   const Duration(hours: 2, minutes: 30),
  //   const Duration(hours: 4, minutes: 30),
  // ),
  // _DemoEvent(
  //   7,
  //   1,
  //   const Duration(hours: 2, minutes: 30),
  //   const Duration(hours: 3, minutes: 30),
  // ),
  // _DemoEvent(7, 2, const Duration(hours: 3), const Duration(hours: 4)),
  // _DemoEvent(
  //   8,
  //   0,
  //   const Duration(hours: 20),
  //   const Duration(hours: 4),
  //   endDateOffset: 1,
  // ),
  // _DemoEvent(9, 1, const Duration(hours: 12), const Duration(hours: 16)),
  // _DemoEvent(9, 2, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(9, 3, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(9, 4, const Duration(hours: 12), const Duration(hours: 13)),
  // _DemoEvent(9, 5, const Duration(hours: 15), const Duration(hours: 16)),
  // _DemoEvent.allDay(0, 0, 1),
  // _DemoEvent.allDay(1, 1, 1),
  // _DemoEvent.allDay(2, 0, 2),
  // _DemoEvent.allDay(3, 2, 2),
  // _DemoEvent.allDay(4, 2, 2),
  // _DemoEvent.allDay(5, 1, 2),
  // _DemoEvent.allDay(6, 3, 2),
  // _DemoEvent.allDay(7, 4, 4),
  // _DemoEvent.allDay(8, -1, 4),
  // _DemoEvent.allDay(9, -1, 2),
  // _DemoEvent.allDay(10, 1, 3),
  // _DemoEvent.allDay(11, -2, 2),
  // _DemoEvent.allDay(12, -3, 2),
];

class _DemoEvent extends BasicEvent {
  _DemoEvent(
    int demoId,
    int eventId,
    Duration start,
    Duration end, {
    int endDateOffset = 0,
  }) : super(
          id: '$demoId-$eventId',
          title: '$demoId-$eventId',
          backgroundColor: _getColor('$demoId-$eventId'),
          start: DateTime.now().atStartOfDay + demoId.days + start,
          end: DateTime.now().atStartOfDay + (demoId + endDateOffset).days + end,
        );

  // ignore: unused_element
  _DemoEvent.allDay(int id, int startOffset, int length)
      : super(
          id: 'a-$id',
          title: 'a-$id',
          backgroundColor: _getColor('a-$id'),
          start: DateTime.now().atStartOfDay + startOffset.days,
          end: DateTime.now().atStartOfDay + (startOffset + length).days,
        );

  static Color _getColor(String id) {
    final r = Random(id.hashCode).nextInt(255);
    final g = Random(id.hashCode).nextInt(255);
    final b = Random(id.hashCode).nextInt(255);

    return Color.fromRGBO(r, g, b, 1);
  }
}

List<TimeOverlay> positioningDemoOverlayProvider(
  BuildContext context,
  DateTime date,
) {
  assert(date.debugCheckIsValidTimetableDate());

  final widget = ColoredBox(color: Theme.of(context).colorScheme.onBackground.withOpacity(.1));

  if (DateTime.monday <= date.weekday && date.weekday <= DateTime.friday) {
    return [
      TimeOverlay(start: 0.hours, end: 8.hours, widget: widget),
      TimeOverlay(start: 20.hours, end: 24.hours, widget: widget),
    ];
  } else {
    return [TimeOverlay(start: 0.hours, end: 24.hours, widget: widget)];
  }
}
