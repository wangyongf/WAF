package com.jzhu.dailypurify;

import android.app.Application;

import com.tencent.mmkv.MMKV;

/**
 * @author scottwang1996@qq.com
 * @since 2019/1/28.
 */
public class MyApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        MMKV.initialize(this);
    }
}
