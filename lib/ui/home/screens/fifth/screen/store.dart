import 'package:cuivi_medic/ui/providers/store_provider.dart';
import 'package:cuivi_medic/ui/services/store_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreScreen extends StatefulWidget {
  static const route = 'StoreScreen';

  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  TextEditingController search = TextEditingController();
  var isInit = false;
  var isLoading = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      setState(() {
        isLoading = true;
      });

      Provider.of<StoreProvider>(context).getProduct(context).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final product = Provider.of<StoreProvider>(context);
    int length = product.product.length;
    String? name;

    return Scaffold(
      // appBar: AppBarWidget(
      //   isShowBack: true,
      //   title: Text('Tienda', style: Theme.of(context).textTheme.headline1),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          labelText: ' Buscar',
                        ),
                        controller: search,
                        textCapitalization: TextCapitalization.sentences,
                        onEditingComplete: () {
                          setState(() {
                            search;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: length == 0
                        ? Text('No hay productos por el momento')
                        : search.text.isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  launch('http://cuivi.app/productos');
                                },
                                child: GridView.count(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  children: List.generate(length, (int index) {
                                    final prod = product.product[index];
                                    name = prod.name;
                                    return Center(
                                      child: SizedBox(
                                        height: size.height,
                                        width: size.width,
                                        child: Card(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.2,
                                                child: Image(
                                                  image: NetworkImage(
                                                    'https://cuivi.app/storage/${prod.photo}',
                                                  ),
                                                ),
                                              ),
                                              Text('\$ ${prod.price}'),
                                              Text(
                                                '${prod.shortDescription}',
                                              ),
                                              Text(
                                                '${prod.name}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )
                            : SizedBox(
                                height: size.height * 0.5,
                                child: ListView.builder(
                                  itemCount: length,
                                  itemBuilder: (context, index) {
                                    final prod = product.product[index];
                                    name = prod.name;
                                    return name!.startsWith(search.text)
                                        ? SizedBox(
                                            height: size.height * 0.15,
                                            child: Card(
                                              child: Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('${prod.name}'),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.1,
                                                        child: Image(
                                                          image: NetworkImage(
                                                            'https://cuivi.app/storage/${prod.photo}',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${prod.name}',
                                                            style:
                                                                const TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '${prod.shortDescription}',
                                                            style:
                                                                const TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '\$${prod.price}',
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      prod.stock! > 0
                                                          ? Row(
                                                              children: [
                                                                Text(
                                                                  'Disponibles ${prod.stock}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    launch(
                                                                      'http://cuivi.app/productos',
                                                                    );
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'Ir a la tienda',
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          : const Text(
                                                              'Producto Agotado',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : const SizedBox(height: 0);
                                  },
                                ),
                              ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
