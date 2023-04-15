import 'package:componentes/src/Ecomerce_google/utils/colors.dart';
import 'package:componentes/src/Ecomerce_google/widgets/big_text.dart';
import 'package:componentes/src/Ecomerce_google/widgets/icon_text_wdget.dart';
import 'package:componentes/src/Ecomerce_google/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // los controller te permiten lograr un comportamiento del widget, en ese caso que muentre una parte del
  // de la siguiete container y eso se puede lograr con el viewportFraction
  PageController pageController = PageController(viewportFraction: 0.89);

// variable para trabajar con el aomento o decremento de las pag cuando se hace scroll
  var _currentPageValue = 0.0;
  // vale 0.8 pues 1-0.8 es lo que se visualiza a cada lado del page que si se visualiza
  var scaleFactor = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //de esta manera usando el add listener permite escuhas los cambios que ocurren en la transcion
    // de la posicion 1 del page a la ps 2 ..
    pageController.addListener(() {
      setState(() {
        print(" posicion del page control $_currentPageValue");
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // cuando usas listener, debes usar el dispose paraleberar la memoria y exitar problemas asociados a eso
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 320,
      child: PageView.builder(
        itemCount: 5,
        controller: pageController,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
// esta codigo permite el aumento de tamano y la disminucion cuando el page view selecciona una page
// el _currentPageValue + scale factor ambos se combinan para esto.
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
    }
    // aqui el transform hace una excelente animacion, se mueve en el eje X
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height:
                220, //this is not needed becouse the container take the father's size, but we need  all the space(usong Stack). and the container is taking all
            margin: const EdgeInsets.only(left: 15, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage("assets/ecomerce_app_fonts/pictures/1.png")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //this is not needed because the container take the father's size, but we need  all the space(usong Stack). and the container is taking all
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // texto de la caja
                    BigTexts(text: "chinese teny"),
                    SizedBox(
                      height: 5.0,
                    ),
                    // start list an others
                    Row(
                      children: [
                        // this widget us usefull to put element next to the other
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.stars,
                                    color: Colors.blue, size: 15))),
                        const SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 10),
                        SmallText(text: "12345"),
                        const SizedBox(width: 10),
                        SmallText(text: "Comments"),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        IconTextWidget(
                            iconData: Icons.circle_sharp,
                            text: "Normal",
                            colorText: AppColors.iconColor1),
                        IconTextWidget(
                            iconData: Icons.location_on,
                            text: "1.7 km",
                            colorText: AppColors.iconColor1),
                        IconTextWidget(
                            iconData: Icons.access_time_rounded,
                            text: "23 min",
                            colorText: AppColors.iconColor2),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
