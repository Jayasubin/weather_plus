String toLocalDate(DateTime input) => input.toLocal().toString().split(' ')[0];
String toLocalTime(DateTime input) =>
    input.toLocal().toString().split(' ')[1].split('.')[0];
