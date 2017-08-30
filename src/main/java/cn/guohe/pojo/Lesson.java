package cn.guohe.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by dongliang on 8/20/17.
 */
public class Lesson implements Serializable {
    private Integer id;
    private String lessonName;
    private Integer price;
    private String lessonDesc;
    private Integer learnTimes;  //课时数.
    private Date gmtCreate;
    private Date gmtModified;

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getLessonDesc() {
        return lessonDesc;
    }

    public void setLessonDesc(String lessonDesc) {
        this.lessonDesc = lessonDesc;
    }

    public Integer getLearnTimes() {
        return learnTimes;
    }

    public void setLearnTimes(Integer learnTimes) {
        this.learnTimes = learnTimes;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Lesson{" +
                "id=" + id +
                ", lessonName='" + lessonName + '\'' +
                ", price=" + price +
                ", lessonDesc='" + lessonDesc + '\'' +
                ", learnTimes=" + learnTimes +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
