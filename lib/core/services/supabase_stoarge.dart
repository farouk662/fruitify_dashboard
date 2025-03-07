

import 'dart:developer';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

import 'stoarage_service.dart';

class SupabaseStoargeService implements StoarageService {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExits = false;

    for (var buckte in buckets) {
      if (buckte.id == bucketName) {
        isBucketExits = true;
        break;
      }
    }
    if (!isBucketExits) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://rtwjqfmiskrhbaenurwh.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ0d2pxZm1pc2tyaGJhZW51cndoIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczOTg4MDI0MywiZXhwIjoyMDU1NDU2MjQzfQ.WIVIGNw_yEcnzVYQkMZaVKhtYj0h5oX0ognlPka-NKI',
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var resutl = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);
    final String publicUrl = _supabase.client
        .storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName.$extensionName');
    log(publicUrl);
    return publicUrl;
  }
}
