package com.jzhu.dailypurify;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String MMKV_PLUGIN = "com.jzhu.dailypurify.SimpleMMKVPlugin";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        SimpleMMKVPlugin.registerWith(registrarFor(MMKV_PLUGIN));
    }
}
