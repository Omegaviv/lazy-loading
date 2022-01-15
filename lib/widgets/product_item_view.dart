
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_excel/models/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItemView extends StatelessWidget {
  final Product product;


  ProductItemView(this.product);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width-20,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                offset: Offset(4,4),
                blurRadius: 15,
                spreadRadius: 1


            ),
            BoxShadow(

                color: Colors.white,
                offset: Offset(-4,-4),
                blurRadius: 15,
                spreadRadius: 1

            )
          ]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 10,),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: product.productUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),),
            ),

            SizedBox(width: 15,),

            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Container(
                        height: 25,
                        //width: 100,
                        child: Text(product.productName, style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(width: 50,),

                      Container(
                        height: 25,
                        //width: 100,
                        child: RatingBar.builder(
                          initialRating: product.productRating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 15,

                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ) ,
                      )
                    ],
                  ),

                  Container(
                    height: 50,
                    width: 230,
                    child: Text(product.productDes, softWrap: true,),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
