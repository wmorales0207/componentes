import 'package:flutter/material.dart';

class ModifyCardPage extends StatefulWidget {
  const ModifyCardPage({super.key});

  

  @override
  State<ModifyCardPage> createState() => _ModifyCardPageState();
}

class _ModifyCardPageState extends State<ModifyCardPage> {

  
  @override
  Widget build(BuildContext context) {
     
      return Scaffold(
        appBar: AppBar(
          title: const Text('Modfiy Card'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    width: double.infinity,
                    height: 200,
                    decoration: cardDecoration(),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45),
                      ),
                      child: FadeInImage(
                        // el fadeIN no coge los Boxdecoration por lo que hay que anadir un clipRRect con su boder radius
                        image: NetworkImage(
                            'https://via.placeholder.com/400x300/green'),
                        placeholder: AssetImage('assets/download.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      onPressed: (() {
                        Navigator.of(context).pop();
                      }),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      onPressed: (() {
                        // go to camera or galery
                        //Navigator.of(context).pop();
                      }),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'nombre:', hintText: 'intro the name'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Precio:', hintText: '\$150'),
                        ),
                        const SizedBox(height: 10),
                        SwitchListTile.adaptive(
                          // la version adaptativo de este componete sig que se ajusta a ios o android
                          title: const Text('Avaliable'),
                          value: true,
                          activeColor: Colors.indigo, // when is selected

                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // this button comes fron the scaffold
          child: const Icon(Icons.save_outlined),

          onPressed: () {},
        ),
      );
    }
  

  BoxDecoration cardDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(45),
          topLeft: Radius.circular(45),
        ),
      );
}
