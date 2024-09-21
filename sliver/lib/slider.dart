import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SLiverPage extends StatelessWidget {
  const SLiverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _MainScroll(),
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "New",
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: <Widget>[
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 3,
                color: const Color(0xfff7cdd5),
              ),
            ),
            const Text(
              "List",
              style: TextStyle(color: Color(0xffd93a30), fontSize: 50),
            ),
          ],
        )
      ],
    );
  }
}

class _MainScroll extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
       
SliverList(delegate: SliverChildBuilderDelegate([
  
]))


      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  const _ListaTareas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20, itemBuilder: (context, index) => const Lisitem());
  }
}

class Lisitem extends StatelessWidget {
  const Lisitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      padding: const EdgeInsets.all(30),
      child: const Text(
        "orenge",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(30)),
    );
  }
}
