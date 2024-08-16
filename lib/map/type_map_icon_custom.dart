import 'package:babikiss/constants.dart';
import 'package:babikiss/map/type_cart.dart';
import 'package:flutter/material.dart';

class TypeMapIconCustom extends StatefulWidget {
  const TypeMapIconCustom({Key? key, required this.changeMapType})
      : super(key: key);

  final Function(String) changeMapType;

  @override
  State<TypeMapIconCustom> createState() => _TypeMapIconCustomState();
}

class _TypeMapIconCustomState extends State<TypeMapIconCustom> {
  TypeCart? selectedCart;

  Future sectionTypeMap() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return FractionallySizedBox(
              heightFactor: 0.3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Type de carte",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list_TypeCart.length,
                          itemBuilder: (context, index) {
                            final cart = list_TypeCart[index];
                            final isSelected = selectedCart == cart;
                            return TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedCart = cart;
                                  widget.changeMapType(cart.id);
                                  Navigator.pop(context);
                                });
                              },
                              child: afficheTypeDeCart(
                                  cart.image, cart.nom, isSelected),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.98, -0.95),
      child: TextButton(
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(100),
              // border: Border.n(
              //   // color: kSecondaryColor,
              // )
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.layers_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            sectionTypeMap();
          });
        },
      ),
    );
  }
}
