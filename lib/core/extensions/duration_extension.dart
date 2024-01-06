extension DateTimeExtension on Duration {
  String get parsed {
    final diff = inSeconds;
    final sec = (diff % 60).floor().toString().padLeft(2, '0');
    final min = ((diff / 60) % 60).floor().toString().padLeft(2, '0');
    final hr = (diff / (60 * 60)).floor().toString().padLeft(2, '0');
    return '$hr:$min:$sec';
  }
}
