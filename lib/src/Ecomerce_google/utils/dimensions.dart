import 'package:flutter/cupertino.dart';

/** Esta clase existe para trabajar con las dimensiones de lo que se se visulaiza.
 basicamente implementar la (Responsive principe)
 Se usa un factor de multiplicacion en funcion de las medidas que proponga el dise;o.
 ejemplo.. supongamos que el container mida 200 y contamos con una pantalla de 880 si 
 divides 880/ 220 = 4 , o sea que la dimencion del contaniner sera  (containerDimencion  = dimensionTotalDevice/4)
 y asi para cada uno de las dimensiones de todos los  elementos.
 */
import 'package:get/get.dart';
//360.0, 640.0

class Dimensions {
  // me da un error asociado a la forma en lo que lo quiero usar, voya crear las var en cada clase, no es bueno
  //pues estaria repitiedno codigo
  //seguro debe ser por la version del Get.

  // static double screenHeight = Get.context!.size!.height;
  // static double screenWidth = Get.context!.size!.width;

  // static double pageViewContainer = screenHeight / 3.84;
  // static double pageViewTextContainer = screenHeight / 7.03;
}
