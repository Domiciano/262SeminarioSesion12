import 'package:flutter/material.dart';
import 'package:track_app/models/track.dart';

/// Screen with the details of a track; it pops true to delete it.
class TrackDetailScreen extends StatelessWidget {
  const TrackDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final track = ModalRoute.of(context)!.settings.arguments as Track;
    return Scaffold(
      appBar: AppBar(title: Text(track.name)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: 220,
                height: 220,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Image.network(track.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 24),
              Text(
                track.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                track.artistName,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Text(
                'id: ${track.id}',
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => Navigator.pop(context, true),
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                icon: const Icon(Icons.delete_outline),
                label: const Text('Eliminar'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver a la lista'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
