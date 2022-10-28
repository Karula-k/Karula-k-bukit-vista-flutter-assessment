import 'package:bukit_vista_flutter_assessment/common/enum/status_enum.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';
import 'package:bukit_vista_flutter_assessment/presentation/pages/detail_page.dart';
import 'package:bukit_vista_flutter_assessment/presentation/provider/guest_data_provider.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeNamed = '/homescreen';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GetDataProvider>(context, listen: false)..fetchListGuest());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Guest List",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search)),
                            const Expanded(
                              child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Search your guest here",
                                      hintStyle:
                                          TextStyle(color: Colors.grey))),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.sort)))
                    ],
                  )
                ],
              ),
            ),
            Consumer<GetDataProvider>(builder: ((context, value, child) {
              final state = value.statusGuestList;
              if (state == StatusEnum.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == StatusEnum.Loaded) {
                return ListGuestWidget(
                  guests: value.getListGuest,
                );
              } else {
                return Text(value.massage);
              }
            })),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationBottomBar(),
    );
  }
}

class ListGuestWidget extends StatelessWidget {
  final List<Guest> guests;
  const ListGuestWidget({super.key, required this.guests});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        final guest = guests[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: ListTile(
            leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Image.network(guest.urlImg)),
            title: Text(guest.name),
            subtitle: Text(guest.origin),
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailPage.routeNamed,
                arguments: guest.id,
              );
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        );
      }),
      itemCount: guests.length,
    );
  }
}
