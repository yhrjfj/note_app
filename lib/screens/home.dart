import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/note.dart';
// import 'package:intl/intl_browser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // For random color
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              // For alignment
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              // Children methods
              children: [
                // Top bar
                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(0),
                  icon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // Space
            const SizedBox(
              height: 20,
            ),
            // Search bar
            TextField(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                fillColor: Colors.grey.shade800,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ),

            // Note tiles
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: sampleNotes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  color: getRandomColor(),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      title: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        // Title
                        text: TextSpan(
                            text: '${sampleNotes[index].title}\n',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 1.5,
                            ),
                            // Sub-title
                            children: [
                              TextSpan(
                                text: '${sampleNotes[index].content}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ]),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Modification time
                        child: Text(
                          'Edited: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(sampleNotes[index].modifiedTime)}',
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }
}
