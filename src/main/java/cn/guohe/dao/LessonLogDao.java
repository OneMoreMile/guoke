package cn.guohe.dao;

import cn.guohe.pojo.LessonLog;

import java.util.List;

/**
 * Created by dongliang on 8/27/17.
 */
public interface LessonLogDao {
    void insert(LessonLog lessonLog);

    List<LessonLog> findUsedLessonsByStudentId(int studentId);

    List<LessonLog> findRenewedLessonsByStudentId(int studentId);
}
