import 'package:flutter/material.dart';
import 'package:flutter_favor_app/components/custom_label.dart';
import 'package:flutter_favor_app/components/my_button.dart';
import 'package:flutter_favor_app/components/my_textfield.dart';
import 'package:flutter_favor_app/models/favor.dart';
// import 'package:flutter_favor_app/components/custom_button.dart';
import 'package:flutter_favor_app/pages/home_pag.dart';
import 'package:flutter_favor_app/services/favor_services.dart';
import 'package:flutter_favor_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class AddFavor extends StatefulWidget {
  const AddFavor({super.key});

  @override
  State<AddFavor> createState() => _AddFavorState();
}

class _AddFavorState extends State<AddFavor> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _requesterController = TextEditingController();
  // final TextEditingController _recipientController = TextEditingController();
  // final TextEditingController _statusController = te
  final TextEditingController _dueDateController = TextEditingController();

  DateTime dateTime = DateTime.now();

  void addFavor(
    String id,
    String title,
    String description,
    String requester,
    String recipient,
    String requestDate,
    String dueDate,
    bool status,
  ) {
    Favor favor = Favor(
      id: id,
      title: title,
      description: description,
      requester: requester,
      recipient: recipient,
      requestDate: requestDate,
      dueDate: dueDate,
      status: status,
    );

    FavorService.addFavor(favor);
    // List<Favor> favors = FavorService.favors;

    // for (Favor favor in favors) {
    //   print(favor.description);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add favor",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],

      // backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const Icon(Icons.spatial_tracking_sharp, size: 150),
                Text(
                  "Add a new favor",
                  style: GoogleFonts.poppins(fontSize: 17),
                ),
                CustomLabel(text: "Title"),
                MyTextField(
                  controller: _titleController,
                  hintText: "Enter your title",
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                // description
                CustomLabel(text: "Description"),
                MyTextField(
                  controller: _descriptionController,
                  hintText: "Enter a description",
                  obscureText: false,
                  maxLines: 5,
                ),
                const SizedBox(height: 20),

                // Requester
                CustomLabel(text: "Requester"),
                MyTextField(
                  enabled: false,
                  controller: _requesterController,
                  hintText: "Me",
                  obscureText: false,
                ),

                // Container(
                //   child: GestureDetector(
                //     child: Row(
                //       children: [Icon(Icons.access_time_rounded), Text("")],
                //     ),
                //   ),
                // )
                const SizedBox(height: 20),
                // Requester
                CustomLabel(text: "Due date"),

                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: _dueDateController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.date_range_rounded),
                        onPressed: () async {
                          var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .add(const Duration(days: -365)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              ) ??
                              DateTime.now();

                          setState(() {
                            dateTime = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              dateTime.hour,
                              dateTime.minute,
                              dateTime.second,
                            );

                            _dueDateController.text = Utils.formatDate(date);
                          });
                        },
                      ),
                      hintText: "Ajouter une date",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // Add button
                MyButton(
                    onTap: () {
                      String id = const Uuid().v4();
                      String title = _titleController.text;
                      String description = _descriptionController.text;
                      String requester = "Me";
                      String recipient = "";
                      String requestDate = Utils.formatDate(DateTime.now());
                      String dueDate = _dueDateController.text;

                      bool status = false;

                      if (_titleController.text.isNotEmpty &&
                          _descriptionController.text.isNotEmpty &&
                          _dueDateController.text.isNotEmpty) {
                        setState(() {
                          addFavor(
                            id,
                            title,
                            description,
                            requester,
                            recipient,
                            requestDate,
                            dueDate,
                            status,
                          );
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please fill in all required fields.'),
                            duration: Duration(
                              seconds: 2,
                            ), // Optional: Duration for which snackbar is visible
                          ),
                        );
                      }
                    },
                    text: "Add favor"),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
