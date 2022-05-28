// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



import '../screens/product_list.dart';

class HomeTab extends StatefulWidget {
  const HomeTab( {Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {


    
    final _searchController = TextEditingController();
   //Future list=Data().getPop();
   
  //Swiper
  @override
  Widget build(BuildContext context) {
    //List dataUrl=[];
  
   
  
    return ListView(
      children: <Widget>[
        Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
              // ignore: duplicate_ignore
              child: TextFormField(
                controller: _searchController,
                
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search Products',
                
                  border: UnderlineInputBorder(
                      //borderRadius: BorderRadius.circular(15),

                      ),

                  //labelText: 'Search Bar',
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 5,
          color: Colors.grey[200],
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            scrollDirection: Axis.horizontal,
          ),
          items: [
            //1st Image of Slider
            Container(
              //margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://threadcurve.com/wp-content/uploads/2020/06/top-jeans-brands-June112020-1-min.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //2nd Image of Slider
            Container(
              //margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://cdn.luxe.digital/media/2020/10/15122150/best-men-jeans-polo-ralph-lauren-luxe-digital.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //3rd Image of Slider
            Container(
              //margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://img.dtcn.com/image/themanual/ricardo-gomez-angel-707638-unsplash-800x533.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //4th Image of Slider
            Container(
              //margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://g3fashion.com/blog/wp-content/uploads/2014/07/jeans-brand-1024x768-1-1024x768.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 5,
          color: Colors.grey[200],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
          child: Text(
            'Popular Trends',
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Card(
              elevation: 15,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: SizedBox(
                 
                  child: Image.asset('assets/pictures/images.jpg'),
                  height: 150,
                  width: 150,
                ),
              ),
            ),

            Card(
              elevation: 15,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: SizedBox(
                  child: Image.asset('assets/pictures/images.jpg'),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
        // ignore: avoid_print
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.,
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Card(
              
              elevation: 15,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: SizedBox(
                  child: Image.asset('assets/pictures/images.jpg'),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            
            Card(
              elevation: 15,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: SizedBox(
                  child: Image.asset('assets/pictures/images.jpg'),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 5,
            color: Colors.grey[200],
          ),
        ),
        InkWell(
          onTap: () {
           
           
    
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductList()));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            elevation: 15,
            child: ListTile(
              title: Text('Men'),
              tileColor: Colors.white10,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductList()));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            elevation: 15,
            child: ListTile(
              title: Text('Women'),
              tileColor: Colors.white10,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductList()));
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              elevation: 15,
              child: ListTile(
                title: Text('Kids'),
                tileColor: Colors.white10,
              ),
            ),
          ),
        )
      ],
    );
    // ignore: avoid_print
   
  }
  
}
