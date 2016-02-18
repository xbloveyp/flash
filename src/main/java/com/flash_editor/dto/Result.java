package com.flash_editor.dto;

/**
 * Created by xiaobo.cao on 2016/2/16.
 */
public class Result<T> {
    private int code;
    private T data;

    public Result(int code, T data) {
        this.data = data;
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public static <T> Result build(int code,T data){
      return   new Result<T>(code,data);
    }
}
