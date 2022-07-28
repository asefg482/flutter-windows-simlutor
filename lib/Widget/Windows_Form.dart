import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class Windows extends StatefulWidget {
  const Windows({Key? key}) : super(key: key);

  @override
  State<Windows> createState() => _WindowsState();
}

class _WindowsState extends State<Windows> {
  Offset position = Offset(10, 10);
  double prevScale = 1;
  double scale = 1;

  void updateScale(double zoom) => setState(() => scale = prevScale * zoom);

  void commitScale() => setState(() => prevScale = scale);

  void updatePosition(Offset newPosition) =>
      setState(() => position = newPosition);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: (details) => updateScale(details.scale),
      onScaleEnd: (_) => commitScale(),
      child: Stack(
        children: [
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              maxSimultaneousDrags: 1000,
              feedback: _Get_Child(),
              childWhenDragging: Opacity(
                opacity: 0,
                child: _Get_Child(),
              ),
              onDragEnd: (details) => updatePosition(details.offset),
              child: Transform.scale(
                scale: scale,
                child: _Get_Child(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Get_Child() {

    double Width = 260;
    double Height = 160;

    double Current_Width = MediaQuery.of(context).size.width;
    double Current_Height = MediaQuery.of(context).size.height;

    bool Maximize = true;

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      width: Width,
      height: Height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    topLeft: Radius.circular(6),
                  ),
                  child: Container(
                    height: Maximize ? 32 : Current_Height,
                    width: Maximize ? Width : Current_Width,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        GestureDetector(
                          child: HoverWidget(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Colors.transparent,
                              width: 50,
                              height: 32,
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            hoverChild: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Colors.red,
                              width: 50,
                              height: 32,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            onHover: (Value) {},
                          ),
                          onTap: () {
                            print("Closed");
                          },
                        ),
                        GestureDetector(
                          child: HoverWidget(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Colors.white,
                              width: 50,
                              height: 32,
                              child: Icon(
                                Icons.crop_square,
                                color: Colors.grey,
                                size: 16,
                              ),
                            ),
                            hoverChild: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Color(0xffF5F5F5),
                              width: 50,
                              height: 32,
                              child: Icon(
                                Icons.crop_square,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                            onHover: (Value) {},
                          ),
                          onTap: () {
                            setState(() {
                              Maximize = !Maximize;
                            });
                          },
                        ),
                        GestureDetector(
                          child: HoverWidget(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Colors.white,
                              width: 50,
                              height: 32,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.minimize_rounded,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                            hoverChild: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Color(0xffF5F5F5F5),
                              width: 50,
                              height: 32,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.minimize_rounded,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                            onHover: (Value) {},
                          ),
                          onTap: () {
                            print("Minimize");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
