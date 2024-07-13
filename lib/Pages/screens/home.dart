import 'dart:convert';

import 'package:fllttapp2/Pages/screens/anime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController searchquery = TextEditingController();
  ScrollController scrollController = ScrollController();
  dynamic data;
  List<dynamic> datas = [];
  int currentPage = 0;
  int totalPages=0;
  int total=0;
  void _Search(String query) async {
    String url = "https://api.jikan.moe/v4/anime?q=${query}";
    final res = await http.get(Uri.parse(url)).then((value) => {

    setState(() {
        data=json.decode(value.body);
    }),



    }).catchError((err){
      print(err.toString());
    });

  }
  String getShortTitle(String title) {
    return title.length > 20 ? title.substring(0, 17) + '...' : title;
  }
  @override
  void initState() {

    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        print("Max");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchquery,
                      decoration: const InputDecoration(
                        hintText: "search..."
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){

                   setState(() {

                       _Search(searchquery.text);

                     });
                  }, icon: const Icon(Icons.search))
                ],
              ),
            ),
           Expanded(
             child: ListView.builder(
               controller: scrollController,
                 itemCount: (data==null)?0:data['data'].length,
                 itemBuilder: (context, index) {
                   return ListTile(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Anime(data:data['data'][index]['title'] ,);
                       },));
                     },
                     title: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             CircleAvatar(
                               backgroundImage: NetworkImage(data['data'][index]['images']['jpg']['image_url']),
                               radius: 30,


                             ),
                             SizedBox(width: 20,),
                             Text(getShortTitle(data['data'][index]['title']))
                           ],
                         ),
                         Container(
                           width: 50,
                           height: 50,
                           decoration: const BoxDecoration(
                               color: Colors.deepOrange,

                               borderRadius: BorderRadius.all(Radius.circular(100))
                           ),
                           alignment: Alignment.center,

                           child:Text(data['data'][index]['score'].toString(),style: const TextStyle(color: Colors.white)),
                         )
                       ],
                     ),
                   );
                 },),
           )
          ],
        ),

      ),
    );
  }


}
