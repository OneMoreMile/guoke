package cn.guohe.dao;

import cn.guohe.pojo.Lesson;

import java.util.List;

/**
 * Created by dongliang on 8/20/17.
 */
public interface LessonDao {

    void insert(Lesson lesson);

    List<Lesson> findAll();

    Lesson findById(int lessonId);
}
