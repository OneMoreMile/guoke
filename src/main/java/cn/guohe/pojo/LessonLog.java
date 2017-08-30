package cn.guohe.pojo;

import java.util.Date;

/**课程消耗，课程续签.
 * Created by dongliang on 8/27/17.
 */
public class LessonLog {
    private int id;
    private int studentId;
    private int learnTime;
    private int lessonId;

    private String comment; //说明

    //used 代表使用，renew代表续签
    private String type;
    private Date renewDate;

    private Date spentDate;
    private Date gmtCreate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getLearnTime() {
        return learnTime;
    }

    public void setLearnTime(int learnTime) {
        this.learnTime = learnTime;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getSpentDate() {
        return spentDate;
    }

    public void setSpentDate(Date spentDate) {
        this.spentDate = spentDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getRenewDate() {
        return renewDate;
    }

    public void setRenewDate(Date renewDate) {
        this.renewDate = renewDate;
    }
}
