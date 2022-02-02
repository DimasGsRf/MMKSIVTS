abstract class BaseMapper<OUTPUT> {
  OUTPUT convert(Map<String, dynamic> response);
}
