import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;

  const Task(this.name, this.photo, this.difficulty, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.difficulty,)
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'Up',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value:widget.difficulty > 0 ? (level / widget.difficulty) / 10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível $level',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}