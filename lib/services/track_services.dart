import 'package:track_app/models/track.dart';

/// Calls to the tracks table in Supabase.
class TrackService {
  Future<List<Track>> getTracks() async {
    return [];
  }

  Future<Track> createTrack(Track track) async {
    return track;
  }

  Future<void> deleteTrack(String id) async {}
}
