import 'package:flutter/material.dart';
import 'package:newstrove/helper/data.dart';
import 'package:newstrove/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<CategoryModel> categories=<CategoryModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories=getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600),),
            Text("Trove",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
          ],
        ),
        elevation: 0.0 ,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
             Container(
               padding: EdgeInsets.symmetric(horizontal: 16),
               height: 70,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: categories.length,
                   itemBuilder: (context,index){
                      return CategoryCard(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                   }),
             )
          ],
        ),
      ),
    );
  }
}

// Categories Code write here
class CategoryCard extends StatelessWidget {
  final imageUrl,categoryName;
  CategoryCard({this.categoryName,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
              child: Image.network(imageUrl,width: 120,height: 60,fit: BoxFit.cover,)),
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 120,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black26
            ) ,
            child: Text(categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
          )
        ],
      ),
    );
  }
}

// Main blog code
class BlogTile extends StatelessWidget {
  final String imageUrl,title,des;
  BlogTile({required this.imageUrl,required this.title,required this.des});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(des),
        ],
      ),
    );
  }
}

