import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/database.dart';

class SinagleCourse extends StatelessWidget {
  const SinagleCourse(
      {@PathParam('id') required this.courseid, required this.doc});
  final int courseid;
  final String doc;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leadingWidth: 110,
        leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).navigateBack();
            },
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 108, 14, 164),
                    Color.fromARGB(255, 153, 28, 172)
                  ],
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft,
                ),
              ),
              width: 35,
              height: 35,
              child: Icon(
                Icons.arrow_back,
                size: 20,
              ),
            )),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.amber,
              width: width1,
              child: FutureBuilder(
                future: DateBase().GetCourseImg(doc),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/avrora-d2ff5.appspot.com/o/avatars%2F${snapshot.data}?alt=media&token=3264b4ec-30c0-4aa5-93d8-8ca0b173dd66'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: [
                        const Text(
                          'Описание: ',
                          // textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateBase().GetCourseData('desc', doc, ''),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: [
                        const Text(
                          'Количество уроков: ',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DateBase().GetCourseData('lessons', doc, ''),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: [
                        const Text(
                          'Сложность курса: ',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DateBase().GetCourseData('difficult', doc, ''),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: [
                        const Text(
                          'Автор: ',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        DateBase().GetCourseData('author', doc, ''),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                height: 100,
                width: width1 - 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 4),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 108, 14, 164),
                      Color.fromARGB(255, 153, 28, 172)
                    ],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft,
                  ),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).pushNamed('/time');
                      DateBase().addCourse(doc);
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.transparent),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child:
                          DateBase().GetCourseData('price', doc, 'Купить за '),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
