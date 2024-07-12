import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/data/repo/repo-prouduct/proudect-repo.dart';
import '../../../constant/constant-massege.dart';
import '../../../constant/endpoint.dart';
import '../../../model/prouductresponse.dart';
@Injectable(as: RepoProuduct)
class RepoProuductImpl extends RepoProuduct {
  final InternetConnectionChecker internetConnectionChecker;

  RepoProuductImpl(this.internetConnectionChecker);

  @override
  Future<List<Products>> getprouduct() async {
    Uri uri = Uri.parse(EndPoints.products);
    try {
      if (await internetConnectionChecker.hasConnection) {
        Response response = await get(uri);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          ProudecResponse productResponse = ProudecResponse.fromJson(jsonDecode(response.body));
          if (productResponse.products != null) {
            return productResponse.products!;
          } else {
            throw Constants.defaultErrorMessage!;
          }
        } else {
          throw Constants.defaultErrorMessage!;
        }
      }
      else {
        throw Constants.internetErrorMessage!;
      }
    } catch (e) {
      print('Error in API call: $e');
      throw e; // Re-throw the error for higher level handling
    }
  }
}
