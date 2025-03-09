

class DateUtil {

  /// 입력받은 시간이 오늘인지 판단하는 메서드
  bool isToday(DateTime dateTime) {
    // 현재 날짜 가져오기
    final today = DateTime.now();

    // 오늘 날짜와 비교 (시간은 무시하고 날짜만 비교)
    return dateTime.year == today.year &&
        dateTime.month == today.month &&
        dateTime.day == today.day;
  }
}