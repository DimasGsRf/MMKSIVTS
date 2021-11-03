package id.mitsubishimotors.sfid.dev

import androidx.annotation.NonNull
import android.os.Bundle
import android.view.WindowManager
import android.content.Context
import android.media.AudioManager

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val AUDIO_CHANNEL = "id.mitsubishimotors.sfid.dev/audio";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        // window.setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, AUDIO_CHANNEL)
            .setMethodCallHandler { call, _ ->
                when (call.method) {
                    "requestAudioFocus" -> requestAudioFocus()
                }
        }
    }

    private fun requestAudioFocus() {
        val audioManager: AudioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        audioManager.requestAudioFocus(null, AudioManager.STREAM_MUSIC, AudioManager.AUDIOFOCUS_GAIN)
    }
}
