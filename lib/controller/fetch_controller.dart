import 'package:app/generated/l10n.dart';
import 'package:get/get.dart';

abstract class FetchController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = RxnString();

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void setError(String? message) {
    errorMessage.value = message;
  }

  Future<T?> fetchData<T>(Future<Response<T>> Function() provider, T Function(dynamic) parser) async {
    setLoading(true);
    setError(null);
    try {
      final response = await provider();
      if (response.status.isOk) {
        return parser(response.body);
      } else {
        setError(response.statusText ?? S().unknown_error);
        return null;
      }
    } catch (e) {
      setError(e.toString());
      return null;
    } finally {
      setLoading(false);
    }
  }
}
