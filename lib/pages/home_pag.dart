import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_favor_app/components/favor_card.dart';
import 'package:flutter_favor_app/models/favor.dart';
import 'package:flutter_favor_app/pages/add_favor.dart';
import 'package:flutter_favor_app/services/favor_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Favor> favors = FavorService.favors;

  void toggleFavorStatus(int index) {
    setState(() {
      favors[index].status = !favors[index].status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddFavor()),
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          "My Favors",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddFavor()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favors.length,
              itemBuilder: (context, index) {
                String title = favors[index].title;
                String subtitle = favors[index].description.length > 40
                    ? '${favors[index].description.substring(0, 40)}...'
                    : favors[index].description;
                return FavorCard(
                  title: title,
                  subtitle: subtitle,
                  status: favors[index].status,
                  onToggleStatus: () {
                    toggleFavorStatus(index);
                  },
                  onDelete: () {
                    setState(() {
                      favors.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
