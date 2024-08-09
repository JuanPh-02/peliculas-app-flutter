import 'package:flutter/material.dart';

class ActorsSlider extends StatefulWidget {
  const ActorsSlider({Key? key}) : super(key: key);

  @override
  State<ActorsSlider> createState() => _ActorsSliderState();
}

class _ActorsSliderState extends State<ActorsSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => _ActorAvatar(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActorAvatar extends StatelessWidget {
  const _ActorAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(

              radius: 40,
              backgroundImage: AssetImage('assets/img/actor.jpg'),
            )
          ),
          SizedBox(
            height: 5,
          ),
          const Text(
            'Nombre Actor',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
