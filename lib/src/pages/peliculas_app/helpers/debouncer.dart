import 'dart:async';

// Creditos
// https://stackoverflow.com/a/52922130/7834829
/// Resulta que los future no se pueden detener, sig que seguiran realizando peticiones por lo que se generan 
/// solicitudes mientras haga datos. Para usar los Streams se debe usar las librereias definidas para esto
/// Cuando se implementan los Streams a traves de un devouncer en este caso)... 
class Debouncer<T> {
  Debouncer({required this.duration, this.onValue});

// cant de tiempo que se desea esperar antes de emitir un valor
  final Duration duration;
// Metodo que se va a disparar cuando y tenga un valor.
  void Function(T value)? onValue;
// el valor con el que se va a trabajar
  T? _value;
  //
  Timer? _timer;

  T get value => _value!;

  set value(T val) {
    _value = val;
    _timer?.cancel();
    // esta linea se define que cuando el duration llegue a cero se ejecuta el onvalue
    // o lo que es lo mismo que cuando se cumpla el tiempo se ejecute e metodo.
    _timer = Timer(duration, () => onValue!(_value as T));
  }
}




















//                   // the preferences names  comes from an Api

//                   FutureBuilder(
//                       future: isaModifyList
//                           ? modidingList()
//                           : providerofGifts.loadPreference(context: context),
//                       builder: (BuildContext context,
//                           AsyncSnapshot<List<PreferenceResponse>> snapshot) {
//                         if (snapshot.connectionState !=
//                             ConnectionState.waiting) {
//                           if (snapshot.hasData) {
//                             List<PreferenceResponse> data = snapshot.data!;
//                             //setState(() {});
//                             return SizedBox(
//                               // height: 70,
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: data
//                                       .map(
//                                         (e) => Padding(
//                                             padding: const EdgeInsets.only(
//                                               top: 15,
//                                               left: 3,
//                                               bottom: 15,
//                                               right: 3),
//                                           child: PreferencesButton(
//                                             text: e.name,
//                                             backgroundColor: e.selected,
//                                             onTap: () {
//                                               setState(() {});
//                                               isaModifyList =
//                                                   true; // now is a modify list
//                                               print('before ${e.selected}');

//                                               e.selected = !e.selected;

//                                               var resultIndex = preferenceList
//                                                   .indexWhere((element) =>
//                                                       element.name == e.name);
//                                               PreferenceResponse resultElement =
//                                                   preferenceList[resultIndex];
//                                               resultElement.selected =
//                                                   e.selected;
//                                               preferenceList[resultIndex] =
//                                                   resultElement;

//                                               print(
//                                                   'after ${preferenceList[resultIndex].selected}');

//                                               // print(preferenceList.length);
//                                               // preferenceList.forEach((element) {
//                                               //   print(element
//                                               //       .selected); // update the list of preferences
//                                               // });
//                                             },
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ),
//                             );
//                           } else {
//                             return SizedBox(height: 70, child: Loader());
//                           }
//                         } else {
//                           return SizedBox(height: 70, child: Loader());
//                         }
//                       }),

//                   Container(
//                     width: double.infinity,
//                     height: 1,
//                     color: Colors.black38,
//                   ),
//                   // the gift names  comes from an Api
//                   FutureBuilder(
//                     future: providerofGifts.loadGifts([], context: context),
//                     //initialData: const ['No data'],
//                     builder: (BuildContext context,
//                         AsyncSnapshot<List<GiftResponse>> snapshot) {
//                       return DefaultTabController(
//                         length: tabsGiftElement.length,
//                         child: Column(
//                           children: [
//                             TabBar(tabs: tabsGiftElement),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height - 340,
//                               child: TabBarView(children: [
//                                 GiftTab(context: context, snapshot: snapshot)
//                               ]),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               ),
//             ),











//             class LoadInitialPreference extends StatefulWidget {



//   const LoadInitialPreference({super.key});

//   @override
//   State<LoadInitialPreference> createState() => _LoadInitialPreferenceState();
// }

// class _LoadInitialPreferenceState extends State<LoadInitialPreference> {
//   bool isaModifyList =
//       false; // the  preference list at the begining is not modify

//   @override
//   Widget build(BuildContext context) {



//     return FutureBuilder(
//       future:providerofGifts.loadPreference(context),
      
      
//                       // future: isaModifyList
//                       //     ? modidingList()  
//                       //     : providerofGifts.loadPreference(context: context),
//                       // builder: (BuildContext context,
//                       //     AsyncSnapshot<List<PreferenceResponse>> snapshot) {
//                       //   if (snapshot.connectionState !=
//                       //       ConnectionState.waiting) {
//                       //     if (snapshot.hasData) {
//                       //       List<PreferenceResponse> data = snapshot.data!;
//                       //       //setState(() {});
//                       //       return SizedBox(
//                       //         // height: 70,
//                       //         child: SingleChildScrollView(
//                       //           scrollDirection: Axis.horizontal,
//                       //           child: Row(
//                       //             children: data
//                       //                 .map(
//                       //                   (e) => Padding(
//                       //                       padding: const EdgeInsets.only(
//                       //                         top: 15,
//                       //                         left: 3,
//                       //                         bottom: 15,
//                       //                         right: 3),
//                       //                     child: PreferencesButton(
//                       //                       text: e.name,
//                       //                       backgroundColor: e.selected,
//                       //                       onTap: () {
//                       //                         setState(() {});
//                       //                         isaModifyList =
//                       //                             true; // now is a modify list
//                       //                         print('before ${e.selected}');

//                       //                         e.selected = !e.selected;

//                       //                         var resultIndex = preferenceList
//                       //                             .indexWhere((element) =>
//                       //                                 element.name == e.name);
//                       //                         PreferenceResponse resultElement =
//                       //                             preferenceList[resultIndex];
//                       //                         resultElement.selected =
//                       //                             e.selected;
//                       //                         preferenceList[resultIndex] =
//                       //                             resultElement;

//                       //                         print(
//                       //                             'after ${preferenceList[resultIndex].selected}');

//                       //                         // print(preferenceList.length);
//                       //                         // preferenceList.forEach((element) {
//                       //                         //   print(element
//                       //                         //       .selected); // update the list of preferences
//                       //                         // });
//                       //                       },
//                       //                     ),
//                       //                   ),
//                       //                 )
//                       //                 .toList(),
//                       //           ),
//                       //         ),
//                       //       );
//                       //     } else {
//                       //       return SizedBox(height: 70, child: Loader());
//                       //     }
//                       //   } else {
//                       //     return SizedBox(height: 70, child: Loader());
//                       //   }
//                        }),

// //                   Container(
// //                     width: double.infinity,
// //                     height: 1,
// //                     color: Colors.black38,
// //                   )
// //                   // the gift names  comes from an Api
// //                   ;
// //   }
// // }


// // List<GiftResponse> tempGiftList = [];
// //   List<Widget> buttonList = [];
// //   List<Widget> giftList = [];
// //   List<PreferenceResponse> preferenceList = [];

// //   List<Widget> tabsGiftElement = [Container()];






//   /** Widget that builds itself based on the latest snapshot of interaction with a Future.
//  * como se redibuja constantemente se debe definir que se hace cuando cuando llegue la 
//  * informacion , que se hace mientras llega y que se hace cuando da un error. lo mas importante
//  * de este componente es que estara cargando mientra haya data y no de error.
//  */
//   // List<Widget> otherPreferenceList(
//   //     BuildContext context, AsyncSnapshot<List<PreferenceResponse>> snapshot) {
//   //   // ignore: unnecessary_null_comparison
//   //   if (snapshot.connectionState == ConnectionState.waiting) {
//   //     //buttonList.clear();
//   //     buttonList.add(Loader());
//   //     return buttonList;
//   //   } else if (snapshot.hasData) {
//   //     List<PreferenceResponse> data = snapshot.data!;
//   //     //buttonList.clear();
//   //     data.forEach(
//   //       (element) {
//   //         RoundedButton aux = RoundedButton(
//   //           backgroundColor: element.selected ==
//   //                   null // the fist time comes an loadprogrres indicator and list have divider too.
//   //               ? Colors.transparent
//   //               : element.selected
//   //                   ? Colors.black
//   //                   : const Color.fromRGBO(147, 38, 134, 0.1),
//   //           showShadows: false,
//   //           text: element.name,
//   //           onPressed: () {},
//   //         );
//   //         Padding result = Padding(
//   //           padding:
//   //               const EdgeInsets.only(top: 15, left: 3, bottom: 15, right: 3),
//   //           child: aux,
//   //         );
//   //         buttonList.add(result);
//   //         buttonList.add(const Divider(
//   //           height: 3,
//   //         ));
//   //       },
//   //     );

//   //     return buttonList;
//   //   } else if (snapshot.hasError) {
//   //     buttonList = <Widget>[
//   //       const Icon(
//   //         Icons.error_outline,
//   //         color: Colors.red,
//   //         size: 60,
//   //       ),
//   //       Padding(
//   //         padding: const EdgeInsets.only(top: 16),
//   //         child: Text('Error: ${snapshot.error}'),
//   //       ),
//   //     ];

//   //     return buttonList;
//   //   } else {
//   //     buttonList = const <Widget>[
//   //       SizedBox(
//   //         width: 30,
//   //         height: 30,
//   //         child: CircularProgressIndicator(),
//   //       ),
//   //       Padding(
//   //         padding: EdgeInsets.only(top: 16),
//   //         child: Text('Awaiting result...'),
//   //       ),
//   //     ];
//   //     return buttonList;
//   //   }
//   // }

//   // List<Widget> getGiftList(
//   //     BuildContext context, AsyncSnapshot<List<GiftResponse>> snapshot) {
//   //   if (snapshot.connectionState == ConnectionState.waiting) {
//   //     //buttonList.clear();
//   //     giftList.add(const SizedBox(
//   //         width: 20,
//   //         height: 20,
//   //         child: CircularProgressIndicator(
//   //           color: Colors.amber,
//   //         )));
//   //     return giftList;
//   //   } else if (snapshot.hasData) {
//   //     List<GiftResponse> data = snapshot.data!;
//   //     //buttonList.clear();
//   //     data.forEach((element) {
//   //       var gift = Gift(
//   //           giftPrice: element.price.toString(),
//   //           myGiftText: element.name!,
//   //           myImage: element.picture,
//   //           giftOldPrice: element.oldPrice!);

//   //       Padding result = Padding(
//   //         padding:
//   //             const EdgeInsets.only(top: 15, left: 3, bottom: 15, right: 3),
//   //         child: gift,
//   //       );
//   //       giftList.add(result);
//   //     });
//   //     return giftList;
//   //   } else if (snapshot.hasError) {
//   //     giftList = <Widget>[
//   //       const Icon(
//   //         Icons.error_outline,
//   //         color: Colors.red,
//   //         size: 60,
//   //       ),
//   //       Padding(
//   //         padding: const EdgeInsets.only(top: 16),
//   //         child: Text('Error: ${snapshot.error}'),
//   //       ),
//   //     ];

//   //     return giftList;
//   //   }
//   //   return giftList;
//   // }

// //   List<Widget> loadPreferences() {
// //     List<Widget> preferenceListtemp = [];

// //     for (var element in preferenceList) {
// //       print(element);
// //       preferenceListtemp.add(
// //         PreferencesButton(
// //           text: element.name,
// //           backgroundColor: element.selected,
// //           onTap: () {
// //             setState(
// //               () {
// //                 element.selected = !element.selected;
// //               },
// //             );
// //           },
// //         ),
// //       );
// //     }
// //     // print(filter.map((e) => {'${e.filterText}+ ${e.isselected}'}));
// //     return preferenceListtemp;
// //   }