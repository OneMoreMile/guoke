package cn.guohe.pojo.page;

/**
 * Created by dongliang on 9/2/17.
 */
public class LessonPage {

    private String lessonName;
    private int learnTimes;
    private String lessonDesc;
    private String createDateStr;

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public int getLearnTimes() {
        return learnTimes;
    }

    public void setLearnTimes(int learnTimes) {
        this.learnTimes = learnTimes;
    }

    public String getLessonDesc() {
        return lessonDesc;
    }

    public void setLessonDesc(String lessonDesc) {
        this.lessonDesc = lessonDesc;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }
}
