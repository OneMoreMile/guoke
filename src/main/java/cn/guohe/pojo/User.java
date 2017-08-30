package cn.guohe.pojo;

import com.sun.xml.internal.ws.spi.db.DatabindingException;

import java.util.Date;

/**
 * Created by dongliang on 8/30/17.
 */
public class User {
    private int id;
    private String userName;
    private String password;
    private String status;
    private Date gmtCreate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }
}
