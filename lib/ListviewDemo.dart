import 'package:flutter/material.dart';

class ListviewStatefulWidget extends StatefulWidget {
  const ListviewStatefulWidget({super.key});

  @override
  State<ListviewStatefulWidget> createState() => ListviewStatefulWidgetState();
}

class ListviewStatefulWidgetState extends State<ListviewStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Listview Item :  ${index + 1}'),
          );
        }, separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
