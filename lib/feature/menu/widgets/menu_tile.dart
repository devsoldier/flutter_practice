import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuTile extends StatelessWidget {
  final String? title;
  final String? imageURL;
  final int? length;
  final VoidCallback? onTap;
  const MenuTile({
    Key? key,
    this.title,
    this.imageURL,
    this.length,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width * 0.7;
    return Container(
      height: 120,
      width: totalWidth,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                  alignment: Alignment.center,
                  width: totalWidth * 0.85,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$title',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$length',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.chevron_right, color: Colors.red),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage('$imageURL'),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
