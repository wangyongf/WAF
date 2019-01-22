package com.jzhu.dailypurify;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * @author scottwang1996@qq.com
 * @since 2019/1/22.
 */
public class SimpleMMKVPlugin implements MethodChannel.MethodCallHandler {

    private static final String CHANNEL = "plugins.flutter.yongf.com/simple_mmkv";

    private final PluginRegistry.Registrar mRegistrar;
    private final MMKVDelegate mDelegate;

    private SimpleMMKVPlugin(PluginRegistry.Registrar registrar, MMKVDelegate mmkvDelegate) {
        mRegistrar = registrar;
        mDelegate = mmkvDelegate;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL);
        MMKVDelegate delegate = new MMKVDelegate();
        channel.setMethodCallHandler(new SimpleMMKVPlugin(registrar, delegate));
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        String method = methodCall.method;
        String key = methodCall.argument("key");
        if ("encodeString".equals(method)) {
            String value = methodCall.argument("value");
            mDelegate.encode(key, value);
        } else if ("encodeBool".equals(method)) {
            boolean value = methodCall.argument("value");
            mDelegate.encode(key, value);
        } else if ("encodeInt".equals(method)) {
            int value = methodCall.argument("value");
            mDelegate.encode(key, value);
        } else if ("encodeLong".equals(method)) {
            long value = methodCall.argument("value");
            mDelegate.encode(key, value);
        } else {
            throw new IllegalArgumentException("Unknown method " + method);
        }
    }
}
