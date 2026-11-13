import 'package:flutter/material.dart';
import 'package:track_app/components/track_form.dart';
import 'package:track_app/services/track_services.dart';

/// Screen with the form to create a track; it returns the draft on pop.
class AddTrackScreen extends StatelessWidget {
  TrackService service = TrackService();

  AddTrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo track')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: TrackForm(
            onSave: (track) {
              //Crear
              service.createTrack(track);
              return Navigator.pop(context, track);
            },
          ),
        ),
      ),
    );
  }
}
