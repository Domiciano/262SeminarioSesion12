import 'package:track_app/models/track.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; //4

/// Calls to the tracks table in Supabase.
class TrackService {
  final SupabaseClient _client = Supabase.instance.client; //2

  Future<List<Track>> getTracks() async {
    return [];
  }

  Future<Track> createTrack(Track track) async {
    final row = await _client
        .from('tracks')
        .insert(track.toMap())
        .select()
        .single();
    return Track.fromMap(row);
  }

  Future<void> deleteTrack(String id) async {}
}
