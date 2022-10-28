import 'package:bukit_vista_flutter_assessment/presentation/pages/detail_page.dart';
import 'package:bukit_vista_flutter_assessment/presentation/pages/home_page.dart';
import 'package:bukit_vista_flutter_assessment/presentation/provider/guest_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:bukit_vista_flutter_assessment/injection.dart' as di;
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<GetDataProvider>())
      ],
      child: MaterialApp(
        initialRoute: HomePage.routeNamed,
        routes: {
          HomePage.routeNamed: (context) => const HomePage(),
          DetailPage.routeNamed: (context) =>
              DetailPage(id: ModalRoute.of(context)?.settings.arguments as int)
        },
      ),
    );
  }
}
