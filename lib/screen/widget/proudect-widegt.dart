import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/model/prouductresponse.dart';
import 'package:task/screen/widget/apploader.dart';
import '../../constant/app-assets.dart';
import '../../constant/app-color.dart';

class ProductWidget extends StatefulWidget {
  final Products products;

  const ProductWidget(this.products, {super.key});

  @override
  State<ProductWidget> createState() => ProductState();
}

class ProductState extends State<ProductWidget> {
  bool isFavorite = false; // State to manage favorite status
  bool isExpanded = false; // State to manage expanded/collapsed state

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 6),
      height: 200,
      margin: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Appcolor.bluecolor),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CachedNetworkImage(
                imageUrl: widget.products.images![0] ?? "",
                placeholder: (_, __) => const AppLoader(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                width: double.infinity,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .16,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Image.asset(
                    isFavorite ? AppAssets.truefave : AppAssets.falsefave,
                  ),
                  onPressed: toggleFavorite,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            widget.products.title ?? "",
            textAlign: TextAlign.start,
            maxLines: 2,
            style: const TextStyle(height: 1),
          ),
          const Spacer(),
          Row(
            children: [
              Text("EGP ${widget.products.price}"),
              const Spacer(),
              Text(
                " ${(widget.products.price! / (1 - (widget.products.discountPercentage!.toDouble() / 100))).toStringAsFixed(2)}EGP",
                style:  TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Appcolor.bluecolor,
                  fontSize: 13
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text("Review(${widget.products.rating})"),
              const Icon(
                Icons.star,
                color: Colors.amberAccent,
              ),
              const Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  backgroundColor: Appcolor.bluecolor,
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Icon(
                    isExpanded ? Icons.remove : Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
