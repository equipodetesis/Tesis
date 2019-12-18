import 'package:cloud_functions/cloud_functions.dart';

final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
  functionName: 'YOUR_CALLABLE_FUNCTION_NAME',
);
dynamic resp = await callable.call(<String, dynamic>{
'YOUR_PARAMETER_NAME': 'YOUR_PARAMETER_VALUE',
});
class CloudFunc {

  void setCliente
}