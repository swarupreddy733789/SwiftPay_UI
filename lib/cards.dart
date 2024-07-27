import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  double h = 0, w = 0;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            height: 200,
            margin: EdgeInsets.only(
                left:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? 10
                        : 0,
                right:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? 10
                        : 0),
            decoration:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/fcard1.jpg',
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
            child: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? null
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset('assets/fcard1.jpg'),
                  ),
          ),
        ),
        Container(
          height: 30,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Positioned(
                top: -180,
                left: 220,
                child: Text(
                  "6243 9348 ****",
                  style: TextStyle(
                    color: Color(0xFFFFFEF9),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Positioned(
                top: -180,
                left: 60,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Color(0x09FFFFEF9),
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                ),
              ),
              Positioned(
                top: -180,
                left: 20,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFEF9),
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                ),
              ),
              const Positioned(
                top: -40,
                left: 270,
                child: Text(
                  "08/28",
                  style: TextStyle(
                    color: Color(0xFFFFFEF9),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Positioned(
                top: -40,
                left: 30,
                child: Text(
                  "Kiran Chaitu",
                  style: TextStyle(
                    color: Color(0xFFFFFEF9),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            height: 200,
            margin: EdgeInsets.only(
                left:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? 10
                        : 0,
                right:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? 10
                        : 0),
            decoration:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/fcard2.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      )
                    : const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
            child: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? null
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset('assets/fcard2.jpg'),
                  ),
          ),
        ),
        Container(
          height: 30,
          child: const Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -180,
                left: 30,
                child: Text(
                  "2985 2626 ****",
                  style: TextStyle(
                    color: Color(0xFFFFFEF9),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Positioned(
                top: -40,
                left: 270,
                child: Text(
                  "12/26",
                  style: TextStyle(
                    color: Color(0xFFFFFEF9),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Positioned(
                top: -40,
                left: 30,
                child: Text(
                  "Reddi Deekshith",
                  style: TextStyle(
                    color: Color(0xFFFFFEF9),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          child: Center(
            child: Container(
              height: 70,
              width: 140,
              decoration: const BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: InkWell(
                onTap: () => {},
                child: const Center(
                  child: Text(
                    "Add Button +",
                    style: TextStyle(
                      color: Color(0xFFFFFEF9),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
