String getMonthNameShortEnglish(DateTime dateTime) {
  const monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  return monthNames[dateTime.month - 1];
}

String getDayNameShort(DateTime dateTime) {
  const dayNames = [
    'Mon', // Monday
    'Tue', // Tuesday
    'Wed', // Wednesday
    'Thu', // Thursday
    'Fri', // Friday
    'Sat', // Saturday
    'Sun', // Sunday
  ];
  return dayNames[dateTime.weekday - 1];
}

String formatDateToShort(DateTime date) {
  const List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  String day = date.day.toString().padLeft(2, '0');
  String month = monthNames[date.month - 1];
  String year = date.year.toString();

  return "$day $month $year";
}

double calculateBMI(double weightKg, double heightCm) {
  double heightM = heightCm / 100;
  return weightKg / (heightM * heightM);
}
