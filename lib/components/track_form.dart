import 'package:flutter/material.dart';
import 'package:track_app/models/track.dart';

/// Form that keeps the draft of a new track and reports it with onSave.
class TrackForm extends StatefulWidget {
  final Function(Track) onSave;

  const TrackForm({super.key, required this.onSave});

  @override
  State<TrackForm> createState() => _TrackFormState();
}

class _TrackFormState extends State<TrackForm> {
  final _nameController = TextEditingController();
  final _artistController = TextEditingController();
  final _imageUrlController = TextEditingController(
    text: Track.defaultImageUrl,
  );
  String _warning = '';

  @override
  void dispose() {
    _nameController.dispose();
    _artistController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    final artist = _artistController.text.trim();
    final imageUrl = _imageUrlController.text.trim();
    if (name.isEmpty || artist.isEmpty) {
      setState(() {
        _warning = 'Escribe el nombre y el artista';
      });
      return;
    }
    widget.onSave(
      Track(
        id: '',
        name: name,
        artistName: artist,
        imageUrl: imageUrl.isEmpty ? Track.defaultImageUrl : imageUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Nombre del track',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _artistController,
          decoration: const InputDecoration(
            labelText: 'Artista',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _imageUrlController,
          decoration: const InputDecoration(
            labelText: 'URL de la imagen',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        Text(_warning, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => _save(),
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
