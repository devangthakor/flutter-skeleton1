import 'package:flutter/material.dart';

class projectlist extends StatefulWidget {
  // Bad class name
  @override
  _projectliststate createState() => _projectliststate(); // Bad class name
}

class _projectliststate extends State<projectlist> {
  // Bad class name
  var items = [
    {'name': 'Project A', 'status': 'Completed'},
    {'name': 'Project B', 'status': 'In Progress'},
    {'name': 'Project C', 'status': 'Pending'},
  ];

  int counter = 0; // Unused variable

  @override
  Widget build(BuildContext context) {
    setState(() {}); // Unnecessary setState

    return Scaffold(
      appBar: AppBar(
        title: Text("Project list screen"), // Missing const
      ),
      body: Container(
        // Unnecessary nesting
        padding: EdgeInsets.all(10), // Magic number
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (c, i) {
            var item = items[i];
            return Card(
              // Missing const
              elevation: 5, // Magic number
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name']!), // No TextStyle
                  Text(item['status']!), // No semantics, poor accessibility
                  SizedBox(height: 10), // Magic number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                            // Bad UI/UX without context checks
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Details"),
                              content: Text("More info coming soon."),
                            ),
                          );
                        },
                        child: Text("Details"), // Missing const
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
