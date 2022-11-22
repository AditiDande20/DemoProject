import 'package:flutter/material.dart';
import 'package:projects/ListviewDemo.dart';
import 'package:projects/MaterialComponents.dart';
import 'package:projects/NavigationDemo.dart';

void main() {
  runApp(const MyDemoApp());
}

class MyDemoApp extends StatelessWidget {
  const MyDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Fonts",
      theme: ThemeData(fontFamily: 'QuickSand'),
      home: const BasicDesignElements(title: "Demo Project"),
    );
    throw UnimplementedError();
  }
}

class BasicDesignElements extends StatefulWidget {
  const BasicDesignElements({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _BasicDesignElements();
}

class _BasicDesignElements extends State<BasicDesignElements> {
  int selectedIndex = 0;

  List<Widget> itemsList = [
    const BasicStatefulWidget(),
    const MaterialStatefulWidget(),
    const ListviewStatefulWidget(),
    const NavigationDemo()
  ];

  void _onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo", selectionColor: Colors.white),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Search Pressed")));
            },
            icon: const Icon(Icons.search),
            tooltip: "Search",
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Notification Pressed")));
            },
            icon: const Icon(Icons.notifications),
            tooltip: "Notification",
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Setting Pressed")));
            },
            icon: const Icon(Icons.settings),
            tooltip: "Setting",
          )
        ],
      ),
      body: Container(
        child: itemsList.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: "Basic",
              tooltip: "Basic Widgets"),
          BottomNavigationBarItem(
              icon: Icon(Icons.flutter_dash_outlined),
              label: "Material",
              tooltip: "Material Widgets"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "ListView",
              tooltip: "ListView"),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigation),
              label: "Navigation",
              tooltip: "Navigation")
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        onTap: _onTapped,
        currentIndex: selectedIndex,
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
    required this.view,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  Widget view;
}

List<Item> generateBasicItem() {
  var growableList = <Item>[
    Item(
        expandedValue: "",
        headerValue: "Text Widget",
        view: const Text(
          "Implementing Text",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'AlexBrush'),
        )),
    Item(
        expandedValue: "",
        headerValue: "TextField Widget",
        view: const TextField(
          maxLines: 1,
          decoration: InputDecoration.collapsed(hintText: 'Username'),
          showCursor: true,
          cursorColor: Colors.blue,
        )),
    Item(
        expandedValue: "",
        headerValue: "Elevated Button Widget",
        view: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Click Me !!!',
            style: TextStyle(color: Colors.white),
          ),
        )),
    Item(
        expandedValue: "",
        headerValue: "Border Button Widget",
        view: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.blue, width: 2)),
          child: const Text(
            'Click Me !!!',
            style: TextStyle(color: Colors.blue),
          ),
        )),
    Item(
        expandedValue: "",
        headerValue: "Rounded Button Widget",
        view: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
          child: const Text(
            'Click Me !!!',
            style: TextStyle(color: Colors.white),
          ),
        )),
    Item(
        expandedValue: "",
        headerValue: "Icons Widget",
        view: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 30.0,
            ),
            Icon(
              Icons.beach_access,
              color: Colors.blue,
              size: 36.0,
            ),
          ],
        )),
  ];
  return growableList;
}

class BasicStatefulWidget extends StatefulWidget {
  const BasicStatefulWidget({super.key});

  @override
  State<BasicStatefulWidget> createState() => _BasicStatefulWidgetState();
}

class _BasicStatefulWidgetState extends State<BasicStatefulWidget> {
  final List<Item> _data = generateBasicItem();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: item.view,
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<Item> generateMaterialItem() {
  var growableList = <Item>[
    Item(
        expandedValue: "",
        headerValue: "Checkbox Widget",
        view: const CheckBoxWidget()),
    Item(
        expandedValue: "",
        headerValue: "Radio Button Widget",
        view: const RadioWidget()),
    Item(
        expandedValue: "",
        headerValue: "Switch Widget",
        view: const SwitchWidget()),
    Item(
        expandedValue: "",
        headerValue: "Slider Widget",
        view: const SliderWidget()),
    Item(
        expandedValue: "",
        headerValue: "Dropdown Button Widget",
        view: const DropdownWidget())
  ];
  return growableList;
}

class MaterialStatefulWidget extends StatefulWidget {
  const MaterialStatefulWidget({super.key});

  @override
  State<MaterialStatefulWidget> createState() => _MaterialStatefulWidgetState();
}

class _MaterialStatefulWidgetState extends State<MaterialStatefulWidget> {
  final List<Item> _data = generateMaterialItem();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: item.view,
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
