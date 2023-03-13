import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item bloc/item_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _count = 1;

  // ignore: unused_element
  void _increment(){
    setState((){
      _count++;
    });
  }

  // ignore: unused_element
  void _decrement(){
    if(_count < 2){
      return;
    }
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemInitalState) {
            return const Center(
                child: Text(
              "NOTHING TO BE DISPLAYED!\n TOTAL: 0\$",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(0, 0, 0, 0)
              ),
            ));
          }
          if (state is ItemLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ItemLoadedState) {
            if (state.cart.isEmpty) {
              return const Scaffold(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                body:  Center(
                    child: Text(
                  "No items have been added ,to add go to the home page.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 0, 0, 0)
                  ),
                )),
              );
            } else {
              // ignore: non_constant_identifier_names
              num TotalPrice = 0;
              // ignore: no_leading_underscores_for_local_identifiers
              void _incrementCounter() {
                for (var element in state.cart) {
                  TotalPrice += element.price;
                }
              }

              _incrementCounter();
              return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        iconTheme: const IconThemeData(
    color: Colors.white,
  ),
        title: const Text('Asbeza', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/profile');
            }, icon: const Icon(Icons.person), color: const Color.fromARGB(255, 0, 0, 0),)
        ],
      ),
      body: Column(
        children: [
          
          Container(
            margin: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * .80,
            child: ListView.builder(
              itemCount: state.cart.length,
              itemBuilder: (BuildContext context, int index) {
                final itemVal = state.cart[index];
                return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                              child: Container(
                              width: 38,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              
                              margin: const EdgeInsets.fromLTRB(0,0,0,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child: Image.network(itemVal.image,width: 80, ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                     Row(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                              
                                               SizedBox(
                                                width: MediaQuery.of(context).size.width * .4,
                                                 child: Text.rich(
                                                   TextSpan(
                                                   children: <TextSpan>[ const TextSpan(text: 'Item name: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                                   TextSpan(text: '${itemVal.title}\$' ,style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0))),])),
                                               ),
                                                  Text.rich(TextSpan(
                                                    children:<TextSpan>[
                                                    const TextSpan(
                                                    text: "Price: ", style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))), 
                                                    TextSpan(text: "${itemVal.price}\$" ,style: const TextStyle( color: Color.fromARGB(255, 0, 0, 0)))])),
            
                                                    
                                             ],
                                           ),
                                         ),
                                        
                                       ],
                                     )
                                  ],
                                ),
                                
                              ]),
                              
                              ),
                            ),
                            
              );
              
            
                  }),
          ),
           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),     
        ],
      ),
            
    
    );
            }
          }
          return Container();
        },
      ),
    );
  }
}