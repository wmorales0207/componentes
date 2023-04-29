import 'package:componentes/src/Ecomerce_google/utils/colors.dart';
import 'package:componentes/src/Ecomerce_google/widgets/big_text.dart';
import 'package:componentes/src/Ecomerce_google/widgets/icon_text_wdget.dart';
import 'package:componentes/src/Ecomerce_google/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
//import 'package:dots_indicators/dots_indicators.dart'

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

  double _heigth = 220.0;

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
    final double screenHeight = MediaQuery.of(context).size.width;
    final double screenWidth = MediaQuery.of(context).size.height;
    final double pageViewContainer = screenHeight / 3.84;
    final double pageView = screenHeight / 3.84;
    final double pageViewTextContainer = screenHeight / 7.03;

    //
    final double height10 = screenHeight / 84.4;
    final double height15 = screenHeight / 56.27;
    final double height20 = screenHeight / 82.2;
    final double height30 = screenHeight / 28.13;

    // width, padding margin

    final double width10 = screenHeight / 84.4;
    final double width15 = screenHeight / 56.27;
    final double width20 = screenHeight / 82.2;
    final double width30 = screenHeight / 28.13;

    //
    //final double fonts20 = screenHeight / 42.2;
    final double radius20 = screenHeight / 42.2;
    final double radius30 = screenHeight / 28.13;

    _heigth = pageViewContainer;

    /// esta declaracion es temporal aligual que todo lo que esta encima por no usar GET

    return Column(
      children: [
        Container(
          //color: Colors.red,
          height: pageViewContainer,
          child: PageView.builder(
            itemCount: 5,
            controller: pageController,
            itemBuilder: (context, index) {
              return _buildPageItem(index, height10, radius20, radius30,
                  pageViewContainer, pageViewTextContainer);
            },
          ),
        ),
        DotsIndicator(
            dotsCount: 5,
            position: _currentPageValue,
            decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))),
      ],
    );
  }

  Widget _buildPageItem(int index, double Height10, double radius20,
      double radius30, double pageViewContainer, double pageViewTextContainer) {
// esta codigo permite el aumento de tamano y la disminucion cuando el page view selecciona una page
// el _currentPageValue + scale factor ambos se combinan para esto.
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTransf = _heigth * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTransf, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
      var currTransf = _heigth * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTransf, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTransf = _heigth * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTransf, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _heigth * (1 - scaleFactor / 2), 1);
    }

    // aqui el transform hace una excelente animacion, se mueve en el eje X
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height:
                pageViewContainer, //this is not needed becouse the container take the father's size, but we need  all the space(usong Stack). and the container is taking all
            margin: const EdgeInsets.only(left: 15, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius30),
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
              height: pageViewTextContainer,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8), // es como un gris
                        blurRadius:
                            6.0, // mientras mayor es en el munero mas difuso se ve.
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0))
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // texto de la caja
                    BigTexts(text: "chinese teny"),
                    const SizedBox(height: 5.0),
                    // start list an others
                    Row(
                      children: [
                        // this widget us usefull to put element next to the other
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.stars,
                                    color: Colors.blue, size: 15))),
                        SizedBox(height: Height10),
                        SmallText(text: "4.5"),
                        SizedBox(height: Height10),
                        SmallText(text: "12"),
                        SizedBox(height: Height10),
                        SmallText(text: "Comments"),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextWidget(
                            iconData: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconTextWidget(
                            iconData: Icons.location_on,
                            text: "1.7 km",
                            iconColor: AppColors.mainColor),
                        IconTextWidget(
                            iconData: Icons.access_time_rounded,
                            text: "23 min",
                            iconColor: AppColors.iconColor2),
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
