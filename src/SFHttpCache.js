/**
 * Created by Joker on 2017-08-17.
 */
import React, {Component} from 'react'
import {
    NativeModules,
    Platform,
} from 'react-native'
const _cache = NativeModules.SFHttpCache;
const SFHttpCache = {
    getSize:function (callBack) {
        if (Platform.OS == 'ios'){
            _cache.getHttpCacheSize((err,size)=>{
                callBack(parseInt(size));
            })
        }else{
            _cache.getHttpCacheSize().then((size)=>{
                _cache.getImageCacheSize().then((imgSize)=>{
                    callBack(parseInt(size)+parseInt(imgSize));
                })
            })
        }

    },
    clearCache:function (callBack) {
        if (Platform.OS == 'ios'){
            _cache.clearCache((err,size)=>{
                callBack();
            })
        }else{
            _cache.clearCache().then(()=>{
                _cache.clearImageCache().then(()=>{
                    callBack();
                })
            })
        }
    }
}

module.exports = SFHttpCache;