import 'package:flutter/material.dart';
import 'package:myapp/utils/events.dart'; // Adjust this import as needed

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final PredictHQService _service = PredictHQService();
  List<dynamic> _events = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  void _fetchEvents() async {
    try {
      final response = await _service.getEvents();

      // print("Received events: $response");

      setState(() {
        _events = response['results'] ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _events = [];
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load events: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.orange,))
          : _events.isEmpty
              ? const Center(child: Text('No events found'))
              : ListView.builder(
                  itemCount: _events.length,
                  itemBuilder: (context, index) {
                    final event = _events[index];

                    final title = event['title'] ?? 'No Title';
                    final startDate = event['start'] ?? 'No Start Date';
                    final endDate = event['end'] ?? 'No End Date';
                    final location = event['location'] != null &&
                            event['location'] is Map &&
                            event['location']['formatted_address'] is String
                        ? event['location']['formatted_address']
                        : 'No Location';
                    final description =
                        event['description'] ?? 'No Description';
                    final predictedSpend =
                        event['predicted_event_spend']?.toString() ??
                            'No Spend';

                    final startDateFormatted =
                        startDate.toString().split('T')[0];
                    final endDateFormatted = endDate.toString().split('T')[0];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Location: $location',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Start Date: $startDateFormatted',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text(
                              'End Date: $endDateFormatted',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Description: $description',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Predicted Event Spend: \$${predictedSpend}',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
