import 'package:flutter/material.dart';
import 'package:task1/addproduct.dart';
import 'package:task1/product_model.dart';



List<ProductModel> productList = [ProductModel(
  name: 'AKG N700NCM2 Wireless Headphones',
  price: '199.00'
)];

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10,),
        ],


      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
             Text('Hi-Fi Shop & Service'),
            // Section Title
            _buildSectionTitle('Products', 41, context),
            SizedBox(height: 10),
            // Product Grid

            if(productList.isEmpty)
              Center(child: Text('No product found')),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: productList.length, // Add more products as needed
              itemBuilder: (context, index) {
                return _buildProductCard(index);
              },
            ),
            SizedBox(height: 20),
            // Section Title

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          var result = await Navigator.push(context, MaterialPageRoute(builder: (c){return Addproduct();}));
          if(result==true){
            setState((){});
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildSectionTitle(String title, int count, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title $count',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            // Navigate to see all
          },
          child: Text('Show all'),
        ),
      ],
    );
  }

  Widget _buildProductCard(int index) {


    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Icon(Icons.headphones, size: 80), // Replace with actual image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productList[index].name??"",
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productList[index].price??""}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                  onTap: (){
                    productList.removeAt(index);
                    setState(() {
                      
                    });
                  },
                  child: Icon(Icons.delete,size: 25,))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccessoryCard(int index) {
    List<String> accessoryNames = [
      'AIAIAI 3.5mm Jack 2m',
      'AIAIAI 3.5mm Jack 1.5m'
    ];
    List<String> accessoryPrices = ['\$25.00', '\$15.00'];
    List<bool> availability = [true, false];

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cable, size: 80), // Replace with actual image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              accessoryNames[index],
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            accessoryPrices[index],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            availability[index] ? 'Available' : 'Unavailable',
            style: TextStyle(
              color: availability[index] ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
