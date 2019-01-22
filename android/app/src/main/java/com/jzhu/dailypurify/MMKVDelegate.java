package com.jzhu.dailypurify;

import com.tencent.mmkv.MMKV;

/**
 * @author scottwang1996@qq.com
 * @since 2019/1/22.
 */
public class MMKVDelegate {

    private final MMKV mMMKV;

    public MMKVDelegate() {
        mMMKV = MMKV.defaultMMKV();
    }

    public void encode(String key, String value) {
        mMMKV.encode(key, value);
    }

    public void encode(String key, boolean value) {
        mMMKV.encode(key, value);
    }

    public void encode(String key, int value) {
        mMMKV.encode(key, value);
    }

    public void encode(String key, long value) {
        mMMKV.encode(key, value);
    }

    public void encode(String key, float value) {
        mMMKV.encode(key, value);
    }

    public void encode(String key, double value) {
        mMMKV.encode(key, value);
    }

    public void encode(String key, byte[] value) {
        mMMKV.encode(key, value);
    }
}
