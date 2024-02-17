import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> list=List.generate(20,(index)=>'Number ${index+1}');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Responsive UI Design"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: OrientationBuilder(
          builder: (context,orientation){
            return orientation==Orientation.portrait
              ? _portraitView(context)
              : _landscapeView(context);
          },
        ),
      ),
    );
  }

  Widget _portraitView(context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index) {
        return ListTile(
          title: Text(list[index]),
        );
      },
    );
  }

  Widget _landscapeView(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(list[index]),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(list[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
