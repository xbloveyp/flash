package com.flash_editor.dto;

/**
 * Created by xiaobo.cao on 2016/3/28.
 */
public class Page {
    // 当前页码
    private int current;
    // 总共页数
    private int total;
    //总条数
    private int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Page(int current,int total,int count) {
        this.current = current;
        this.total = total;
        this.count = count;
    }
}
