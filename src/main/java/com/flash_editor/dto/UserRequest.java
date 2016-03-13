package com.flash_editor.dto;

/**
 * Created by Administrator on 2016/3/13.
 */
public class UserRequest {
    private String userName;
    private String password;
    private Boolean save;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getSave() {
        return save;
    }

    public void setSave(Boolean save) {
        this.save = save;
    }
}
