import 'dart:io';

// dart run :dart_script
void main(List<String> arguments) async {
  await execute('dart --version');
}

Future<void> execute(String cmd, {String? dir, bool skipError = false}) async {
  print(cmd + (dir != null ? ' [on $dir]' : ''));

  var args = cmd.split(' ');
  var command = args.first;
  var options = args.length > 1
      ? args.getRange(1, args.length).toList()
      : [] as List<String>;

  var result = await Process.run(
    command,
    options,
    workingDirectory: dir,
  );

  print(result.stdout);
  if (!skipError && result.stderr != '') {
    throw Exception(result.stderr);
  }
}