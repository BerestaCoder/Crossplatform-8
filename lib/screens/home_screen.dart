import 'package:crossplatform8/screens/basket_screen.dart';
import 'package:crossplatform8/screens/left_image_screen.dart';
import 'package:crossplatform8/screens/list_screen.dart';
import 'package:crossplatform8/screens/save_screen.dart';
import 'package:crossplatform8/tools/platform_checker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlatformChecker pl = new PlatformChecker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Домащняя страница'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pl.isDesktopInterface() ? const Text("Приложение запущено на компьютере") : const Text("Приложение запущено на телефоне"),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // =========== Корзина
                  ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BasketScreen())),
                      child: const Row(
                        children: [
                          Icon(Icons.shopping_basket_outlined),
                          Text(" Корзина"),
                        ],
                      )
                  ),
                  // =========== Сохранения
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SaveScreen())),
                      child: const Row(
                        children: [
                          Icon(Icons.save),
                          Text(" Сохранение"),
                        ],
                      )
                  ),
                  // =========== Сохранения
                  ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LeftImageScreen())),
                      child: const Row(
                        children: [
                          Icon(Icons.image),
                          Text(" Картинки"),
                        ],
                      )
                  ),
                  // =========== Списки
                  ElevatedButton(
                    onPressed: () => context.go('/list_screen'),
                    child: const Row(
                      children: [
                        Icon(Icons.list),
                        Text(" Разные списки"),
                      ],
                    )
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}