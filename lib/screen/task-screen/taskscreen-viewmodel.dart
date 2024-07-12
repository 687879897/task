import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/repo/repo-prouduct/proudect-repo.dart';
import '../../model/prouductresponse.dart';
import 'base/enums/base-screen-state.dart';

@injectable
class Productviewmodel extends Cubit<BrandState> {
  final RepoProuduct repoProuduct;
  List<Products> allProducts = []; // Store all products here

  Productviewmodel(this.repoProuduct) : super(BrandState());

  void getallbrand() async {
    emit(BrandState(state: ApiState.loading));
    try {
      List<Products> data = await repoProuduct.getprouduct();
      allProducts = data; // Save the fetched products
      emit(BrandState(state: ApiState.success, data: data));
    } catch (e) {
      emit(BrandState(state: ApiState.error, error: e.toString()));
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(BrandState(state: ApiState.success, data: allProducts));
    } else {
      List<Products> filteredData = allProducts.where((product) {
        return product.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(BrandState(state: ApiState.success, data: filteredData));
    }
  }
}

class BrandState {
  final ApiState state;
  final List<Products> data;
  final String error;

  BrandState({
    this.state = ApiState.loading,
    this.data = const [],
    this.error = '',
  });
}
