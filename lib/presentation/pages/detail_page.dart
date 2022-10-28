import 'package:bukit_vista_flutter_assessment/presentation/provider/guest_data_provider.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final int id;
  static const routeNamed = '/detail';
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<GetDataProvider>(context, listen: false)
        .fetchGuestDetail(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_sharp),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Text("data"),
              ),
            )
          ];
        },
        body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [const SliverToBoxAdapter(child: TabbarWidget())];
                },
                body: const TabbarViewWidget())),
      ),
      bottomNavigationBar: const NavigationBottomBar(),
    );
  }
}

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          text: "overview",
        ),
        Tab(
          text: "Bookings",
        ),
        Tab(
          text: "Personal",
        ),
      ],
    );
  }
}

class TabbarViewWidget extends StatelessWidget {
  const TabbarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [OverViewTab(), BookingsTab(), PersonalTabs()],
    );
  }
}

class OverViewTab extends StatelessWidget {
  const OverViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("overview");
  }
}

class BookingsTab extends StatelessWidget {
  const BookingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PersonalTabs extends StatelessWidget {
  const PersonalTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
