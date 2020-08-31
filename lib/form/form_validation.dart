import 'form_row.dart';

List formValidationErrors(List<TFormRow> rows) {
  List errors = [];
  rows.forEach((TFormRow row) {
    if (row.validator != null) {
      bool isSuccess = row.validator(row);
      if (!isSuccess) {
        errors.add(row.requireMsg ?? "${row.title} 不能为空");
      }
    } else {
      if ((row.require ?? false) && row.value?.length == 0) {
        errors.add(row.requireMsg ?? "${row.title} 不能为空");
      }
    }
  });
  return errors;
}