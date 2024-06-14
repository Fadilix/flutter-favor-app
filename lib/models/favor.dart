class Favor {
  final String id;
  final String title;
  final String description;
  final String requester;
  final String recipient;
  final String requestDate;
  final String? dueDate;
  bool status;

  Favor({
    required this.id,
    required this.title,
    required this.description,
    required this.requester,
    required this.recipient,
    this.dueDate,
    required this.status,
    required this.requestDate,
  });
}
