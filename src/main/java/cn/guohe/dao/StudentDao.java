package cn.guohe.dao;

import cn.guohe.pojo.Student;

import java.util.List;

/**
 * Created by dongliang on 8/3/17.
 */
public interface StudentDao {

    void insert(Student student);

    List<Student> findAll();

    void updateUsedLessons(Student student);

    Student findStudent(int studentId);

    List<Student> findStudentByName(String name);

    void deleteStudent(int selectStudentId);
}
