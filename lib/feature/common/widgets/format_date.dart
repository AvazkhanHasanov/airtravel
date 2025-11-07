String formatDate(String dateStr) {
  DateTime date = DateTime.parse(dateStr);
  const months = ['yan', 'fev', 'mart', 'apr', 'may', 'iyun', 'iyul', 'avg', 'sen', 'okt', 'noy', 'dek'];

  String day = date.day.toString();
  String month = months[date.month - 1];

  return '$day $month';
}
