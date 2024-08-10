import 'dart:developer' as dev;

extension ColoredLog on Object? {
  // void log() => dev.log(toString());

  void printLog({
    String name = 'DEBUG_LOG',
    ANSICOLOR color = ANSICOLOR.yellow,
    ANSICOLOR? bgColor,
  }) {
    dev.log(
      '${bgColor == null ? ANSICOLOR.reset.colors : bgColor.colors[1]}${color.colors[0]}${toString()}${ANSICOLOR.reset.colors}',
      name:
          '${bgColor == null ? ANSICOLOR.reset.colors : bgColor.colors[1]}${color.colors[0]}$name${ANSICOLOR.reset.colors}',
    );
  }
}

enum ANSICOLOR {
  reset,
  black,
  white,
  red,
  green,
  yellow,
  blue,
  cyan,
  purple;

  dynamic get colors => switch (this) {
        ANSICOLOR.reset => '\x1B[0m',
        ANSICOLOR.black => ['\x1B[30m', '\x1B[40m'],
        ANSICOLOR.red => ['\x1B[31m', '\x1B[41m'],
        ANSICOLOR.green => ['\x1B[32m', '\x1B[42m'],
        ANSICOLOR.yellow => ['\x1B[33m', '\x1B[43m'],
        ANSICOLOR.purple => ['\x1B[35m', '\x1B[45m'],
        ANSICOLOR.blue => ['\x1B[34m', '\x1B[44m'],
        ANSICOLOR.cyan => ['\x1B[36m', '\x1B[46m'],
        ANSICOLOR.white => ['\x1B[37m', '\x1B[47m'],
      };
}
