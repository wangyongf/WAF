class DateUtils {
  static formatDateSimple(DateTime dt) {
    StringBuffer sb = StringBuffer();
    sb.write(dt.year.toString());
    sb.write(dt.month.toString().padLeft(2, '0'));
    sb.write(dt.day.toString().padLeft(2, '0'));
    return sb.toString();
  }

  static formatDate(int time) {
    var dt = DateTime.fromMillisecondsSinceEpoch(time);

    StringBuffer sb = StringBuffer();
    sb.write(dt.year);
    sb.write('-');
    sb.write(dt.month.toString().padLeft(2, '0'));
    sb.write('-');
    sb.write(dt.day.toString().padLeft(2, '0'));
    sb.write(' ');
    sb.write(dt.hour.toString().padLeft(2, '0'));
    sb.write(':');
    sb.write(dt.minute.toString().padLeft(2, '0'));
    sb.write(':');
    sb.write(dt.second.toString().padLeft(2, '0'));
    return sb.toString();
  }

  static formatDateWithWeek(DateTime dt) {
    StringBuffer sb = StringBuffer();
    sb.write(dt.year.toString());
    sb.write('年');
    sb.write(dt.month.toString());
    sb.write('月');
    sb.write(dt.day.toString());
    sb.write('日');
    sb.write('   ');
    switch (dt.weekday) {
      case DateTime.monday:
        sb.write('星期一');
        break;
      case DateTime.tuesday:
        sb.write('星期二');
        break;
      case DateTime.wednesday:
        sb.write('星期三');
        break;
      case DateTime.thursday:
        sb.write('星期四');
        break;
      case DateTime.friday:
        sb.write('星期五');
        break;
      case DateTime.saturday:
        sb.write('星期六');
        break;
      case DateTime.sunday:
        sb.write('星期天');
        break;
    }

    return sb.toString();
  }

  static DateTime formatExpiresTime(String str) {
    var expiresTime =
        RegExp("Expires[^;]*;").stringMatch(str).split(" ")[1].split("-");
    var year = expiresTime[2];
    var day = expiresTime[0];
    var mounth = _getMounthByStr(expiresTime[1]);
    return DateTime.parse("$year$mounth$day");
  }

  static DateTime getDaysAgo(int days) {
    return DateTime.now().subtract(Duration(days: days));
  }

  static int _getMounthByStr(String str) {
    int output = 1;
    switch (str) {
      case "Jan":
        output = 1;
        break;
      case "Feb":
        output = 2;
        break;
      case "Mar":
        output = 3;
        break;
      case "Apr":
        output = 4;
        break;
      case "May":
        output = 5;
        break;
      case "Jun":
        output = 6;
        break;
      case "Jul":
        output = 7;
        break;
      case "Aug":
        output = 8;
        break;
      case "Sep":
        output = 9;
        break;
      case "Oct":
        output = 10;
        break;
      case "Nov":
        output = 11;
        break;
      case "Dec":
        output = 12;
        break;
    }
    return output;
  }
}
