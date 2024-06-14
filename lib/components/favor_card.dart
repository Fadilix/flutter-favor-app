import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavorCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool status;
  final void Function()? onDelete;
  final void Function()? onToggleStatus;

  const FavorCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.onDelete,
    required this.onToggleStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
            IconButton(
              icon: Icon(
                status ? Icons.check_circle : Icons.check_circle_outline,
                color: status ? Colors.green : Colors.grey,
              ),
              onPressed: onToggleStatus,
            ),
          ],
        ),
      ),
    );
  }
}
