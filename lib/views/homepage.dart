import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/item bloc/item_bloc.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homepage();
}

// ignore: camel_case_types
class _homepage extends State<homePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        iconTheme: const IconThemeData(
    color: Colors.black,
  ),
        title: const Text('Asbeza', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart),color: const Color.fromARGB(255, 0, 0, 0),),
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/profile');
            }, icon: const Icon(Icons.person), color: const Color.fromARGB(255, 0, 0, 0),)
        ],
      ),
      body: BlocBuilder<ItemBloc, ItemState>(builder: (context, state){
        if (state is ItemInitalState){
          return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 100, 80, 50),
            child: Image.asset('assets/images/cart.jpg', width: 150,),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text("Known for delivering goods on time.", 
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 40,),
            textAlign: TextAlign.center,),
          ),
          
          const Spacer(),

          ElevatedButton(
            onPressed: () {
              BlocProvider.of<ItemBloc>(context)
                      .add(GetDataButtonPressed());
            }, style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.all(24.0),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)
                      ),
                  child: 
                  const Text("Shop!"),
                  ),
            

          const Spacer()
      ]);
        }
        else if(state is ItemLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if (state is ItemLoadedState){
          return ListView.builder(
            itemCount: state.item.length,
            itemBuilder: (BuildContext context, int index) {
              final itemVal = state.item[index];
              return Card(
                    elevation: 20,
                    color: const Color.fromARGB(255, 100, 100, 100),
                    child: Container(
                    width: 380,
                    height: 150,
                    color: const Color.fromARGB(255, 100, 100, 100),
                    margin: const EdgeInsets.fromLTRB(20,10,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Image.network(itemVal.image,width: 80, ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Row(
                             children: [
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                    width: MediaQuery.of(context).size.width * .5,
                                    child: Text.rich(
                                      TextSpan(
                                      children: <TextSpan>[ const TextSpan(text: 'Item name: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                      TextSpan(text: itemVal.title ,style: const TextStyle(fontSize: 15, color: Colors.white)),]))),
                                      Text.rich(TextSpan(
                                        children:<TextSpan>[
                                        const TextSpan(
                                        text: "Price: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)), 
                                        TextSpan(text: "${itemVal.price}\$", style: const TextStyle(color: Colors.white))])),
                                 ],
                               ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,0,20,0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                    BlocProvider.of<ItemBloc>(context)
                                      .add(CartEvent(item: itemVal));

                                  }, style: ElevatedButton.styleFrom(
                                       padding:
                                        const EdgeInsets.all(10.0),
                                        textStyle: const TextStyle(
                                            fontSize: 10, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255))),
                                        child: const Text("Add"), ),
                                ),
                             ],
                           )
                        ],
                      )
                    ]),
                    
                    ),
                  );
            },
          );
          }
          return Container();
        },
    ),
    
    );
  }
}