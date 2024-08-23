import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Home',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'April 11, 2020',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              )
            ],
          ),
          const Spacer(),
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Theme.of(context).primaryColor,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(3, 3),
                      color: Colors.black26,
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      offset: Offset(-3, -3),
                      color: Colors.white,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/default_user.png',
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 3.0,
                child: ClipOval(
                  child: Container(
                    color: Colors.red,
                    height: 15.0,
                    width: 15.0,
                    child: const Center(
                        child: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
