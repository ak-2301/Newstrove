import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newstrove/helper/data.dart';
import 'package:newstrove/models/category_model.dart';
import 'package:newstrove/views/article_view.dart';
import 'package:newstrove/views/category_news.dart';
import '../helper/news.dart';
import '../models/article.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   bool _loading=true;
  var newsList;
  List<CategoryModel> categories=<CategoryModel>[];
 // List<Article> articles=<Article>[];


  @override
  void initState() {
    _loading=false;
    // TODO: implement initState
    super.initState();
    categories=getCategories();
    getNews();
  }

  void getNews() async{
    News news=News();
    await news.getNews();
    //articles=news.news;
    newsList=news.news;
    setState(() {
      _loading=false;
    });

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
      body: _loading? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),

      ):SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              // Categories
               Container(

                 height: 70,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: categories.length,
                     itemBuilder: (context,index){
                        return CategoryCard(
                          imageAssestUrl: categories[index].imageAssestUrl,
                          categoryName: categories[index].categoryName,
                        );
                     }),
               ),


              // Blogs

            ],
          ),
        ),
      ),
    );
  }
}


// Categories Code write here
class CategoryCard extends StatelessWidget {
  final String imageAssestUrl,categoryName;
  CategoryCard({required this.categoryName,required this.imageAssestUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       Navigator.push(context,MaterialPageRoute(
         builder: (context)=>CategoryNews(newsCategory: categoryName.toLowerCase()),
       ));
     },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: imageAssestUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,)),
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
      ),
    );
  }
}

// Main blog code
class BlogTile extends StatelessWidget {
  final String imageUrl,title,des,url;
  BlogTile({required this.imageUrl,required this.title,required this.des,required this.url});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
            builder: (context)=>ArticleView(postUrl: url )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87
            ),),
            SizedBox(height: 8,),
            Text(des,style: TextStyle(
              color: Colors.black54
            ),),
          ],
        ),
      ),
    );
  }
}

