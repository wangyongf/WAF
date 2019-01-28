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

    public boolean encode(String key, String value) {
        return mMMKV.encode(key, value);
    }

    public String decodeString(String key) {
        return mMMKV.decodeString(key);
    }

    public String decodeString(String key, String defaultValue) {
        return mMMKV.decodeString(key, defaultValue);
    }

    public void encode(String key, boolean value) {
        mMMKV.encode(key, value);
    }

    public boolean decodeBool(String key) {
        return mMMKV.decodeBool(key);
    }

    public boolean decodeBool(String key, boolean defaultValue) {
        return mMMKV.decodeBool(key, defaultValue);
    }

    public void encode(String key, int value) {
        mMMKV.encode(key, value);
    }

    public int decodeInt(String key) {
        return mMMKV.decodeInt(key);
    }

    public int decodeInt(String key, int defaultValue) {
        return mMMKV.decodeInt(key, defaultValue);
    }

    public void encode(String key, long value) {
        mMMKV.encode(key, value);
    }

    public long decodeLong(String key) {
        return mMMKV.decodeLong(key);
    }

    public long decodeLong(String key, long defaultValue) {
        return mMMKV.decodeLong(key, defaultValue);
    }

    public void encode(String key, float value) {
        mMMKV.encode(key, value);
    }

    public float decodeFloat(String key) {
        return mMMKV.decodeFloat(key);
    }

    public float decodeFloat(String key, float defaultValue) {
        return mMMKV.decodeFloat(key, defaultValue);
    }

    public void encode(String key, double value) {
        mMMKV.encode(key, value);
    }

    public double decodeDouble(String key) {
        return mMMKV.decodeDouble(key);
    }

    public double decodeDouble(String key, double defaultValue) {
        return mMMKV.decodeDouble(key, defaultValue);
    }

    public void encode(String key, byte[] value) {
        mMMKV.encode(key, value);
    }

    public byte[] decodeBytes(String key) {
        return mMMKV.decodeBytes(key);
    }
}
