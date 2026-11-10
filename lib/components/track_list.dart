import 'package:flutter/material.dart';
import 'package:track_app/components/track_card.dart';
import 'package:track_app/models/track.dart';

/// List of tracks, or a notice when there are none.
class TrackList extends StatelessWidget {
  final List<Track> tracks;
  final Function(Track) onOpen;

  const TrackList({super.key, required this.tracks, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    if (tracks.isEmpty) {
      return const Center(
        child: Text(
          'Todavía no hay tracks',
          style: TextStyle(color: Colors.black54),
        ),
      );
    }
    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        final track = tracks[index];
        return TrackCard(track: track, onTap: () => onOpen(track));
      },
    );
  }
}
