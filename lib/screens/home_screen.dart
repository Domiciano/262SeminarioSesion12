import 'package:flutter/material.dart';
import 'package:track_app/components/track_list.dart';
import 'package:track_app/models/track.dart';
import 'package:track_app/services/track_services.dart';

/// Screen that owns the list of tracks and opens the other screens.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Track> _tracks = [];
  TrackService service = TrackService();

  @override
  void initState() {
    super.initState();
    handleGetTracks(); //Genera un proceso en segundo plano
  }

  //Funcion auxiliar
  Future<void> handleGetTracks() async {
    List<Track> response = await service.getTracks();
    //
    setState(() {
      _tracks = response;
    });
  }

  void _addTrack(Track track) {
    //En este punto tenemos el nuevo track a la entrada. El track recien creado
    setState(() {
      _tracks = [..._tracks, track];
    });
  }

  void _deleteTrack(Track track) {
    setState(() {
      _tracks = _tracks.where((t) => t != track).toList();
    });
  }

  Future<void> _openAddTrack() async {
    final result = await Navigator.pushNamed(context, '/add-track');
    if (result is Track) {
      _addTrack(result);
    }
  }

  Future<void> _openTrack(Track track) async {
    final result = await Navigator.pushNamed(
      context,
      '/track',
      arguments: track,
    );
    if (result == true) {
      _deleteTrack(track);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis tracks')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton.icon(
                onPressed: () => _openAddTrack(),
                icon: const Icon(Icons.add),
                label: const Text('Crear track'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TrackList(
                  tracks: _tracks,
                  onOpen: (track) => _openTrack(track),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
