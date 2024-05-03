import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});
  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

enum MyItem{
  pizza, cake, tea
}

class _BasketScreenState extends State<BasketScreen> {
  MyItem chosenItem = MyItem.pizza;
  int _pizzza_counter = 0;
  int _cake_counter = 0;
  int _tea_counter = 0;
  String _text = 'Пицца — традиционное итальянское блюдо, изначально в виде круглой дрожжевой лепёшки, выпекаемой с уложенной сверху начинкой из томатного соуса, сыра и зачастую других ингредиентов, таких как мясо, овощи, грибы и прочие продукты';

  void _incrementItem() {
    setState(() {
      switch (chosenItem){
        case MyItem.pizza:
          _pizzza_counter++;
        case MyItem.cake:
          _cake_counter++;
        case MyItem.tea:
          _tea_counter++;
      }
    });
  }
  void _decrementItem() {
    setState(() {
      switch (chosenItem){
        case MyItem.pizza:
          if (_pizzza_counter>0) _pizzza_counter--;
        case MyItem.cake:
          if (_cake_counter>0) _cake_counter--;
        case MyItem.tea:
          if (_tea_counter>0) _tea_counter--;
      }
    });
  }
  void _clickPizza() {
    setState(() {
      _text = 'Пицца — традиционное итальянское блюдо, изначально в виде круглой дрожжевой лепёшки, выпекаемой с уложенной сверху начинкой из томатного соуса, сыра и зачастую других ингредиентов, таких как мясо, овощи, грибы и прочие продукты';
      chosenItem = MyItem.pizza;
    });
  }
  void _clickCake() {
    setState(() {
      _text = 'Торт — кондитерское изделие, состоящее из нескольких коржей, пропитанных кремом или джемом. Сверху торт обычно украшают кремом, глазурью или фруктами.';
      chosenItem = MyItem.cake;
    });
  }
  void _clickTea() {
    setState(() {
      _text = 'Чай — напиток, получаемый варкой, завариванием и/или настаиванием листа чайного куста, который предварительно подготавливается специальным образом.';
      chosenItem = MyItem.tea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Корзина"),
        ),
        body: Center(
            child :Container(
                width: 500,
                margin: const EdgeInsets.all(20),
                child: Center(
                    child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: _clickPizza,
                                    child: Row(children: [const Icon(Icons.local_pizza_outlined), Text("Пицца $_pizzza_counter")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickCake,
                                    child: Row(children: [const Icon(Icons.cake), Text("Торт $_cake_counter")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickTea,
                                    child: Row(children: [const Icon(Icons.coffee), Text("Чай $_tea_counter")])
                                )
                              ]
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: 500,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.secondaryContainer,
                              ),
                              child: Text('$_text')
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: _incrementItem,
                                  child: Text('Добавить')
                              ),
                              ElevatedButton(
                                  onPressed: _decrementItem,
                                  child: Text('Убрать')
                              )
                            ],
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}