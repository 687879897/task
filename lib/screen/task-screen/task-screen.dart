import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constant/app-color.dart';
import 'package:task/di.dart';
import 'package:task/screen/task-screen/taskscreen-viewmodel.dart';
import 'package:task/screen/widget/apploader.dart';
import 'package:task/screen/widget/errorviwe.dart';
import '../../constant/app-assets.dart';
import '../../model/prouductresponse.dart';
import '../widget/proudect-widegt.dart';
import 'base/enums/base-screen-state.dart'; // Adjust import path as needed

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static String routeName = "taskscreen";

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Productviewmodel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.getallbrand();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        backgroundColor: Appcolor.whitecolor,
        elevation: 0,
        title: Image.asset(AppAssets.route),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: TextField(
                    onChanged: (query) {
                      viewModel.searchProducts(query); // Call search method
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          width: 0.8,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "What do you search for?",
                      hintStyle: TextStyle(color: Appcolor.bluecolor),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Appcolor.bluecolor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Appcolor.bluecolor,
                  size: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<Productviewmodel, BrandState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state.state == ApiState.success) {
                  return buildProductsListView(state.data);
                } else if (state.state == ApiState.error) {
                  return ErrorVeiw(
                    error: state.error,
                    refresh: () {
                      viewModel.getallbrand();
                    },
                  );
                } else {
                  return const AppLoader();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductsListView(List<Products> data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7, // Adjust aspect ratio as needed
          crossAxisSpacing: 4,
          mainAxisSpacing: 8,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ProductWidget(data[index]);
        },
      ),
    );
  }
}
