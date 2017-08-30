package cn.guohe.controller;

import cn.guohe.dao.LessonDao;
import cn.guohe.dao.LessonLogDao;
import cn.guohe.dao.StudentDao;
import cn.guohe.dao.UserDao;
import cn.guohe.pojo.Lesson;
import cn.guohe.pojo.LessonLog;
import cn.guohe.pojo.Student;
import cn.guohe.pojo.User;
import cn.guohe.pojo.page.ClassRenew;
import cn.guohe.pojo.page.ClassSpend;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by dongliang on 7/30/17.
 */
@RestController
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private HttpServletRequest request;

    @Resource
    private StudentDao studentDao;

    @Resource
    private LessonDao lessonDao;

    @Autowired
    private LessonLogDao lessonLogDao;

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/userlist", method = RequestMethod.POST)
    public ModelAndView userList(String type, String studentId, String studentName, Student stu) {
        ModelAndView mav = new ModelAndView("userlist");
        if ("init".equals(type)) {
            List<Student> studentList = studentDao.findAll();
            final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            studentList.forEach(k -> {
                k.setSignDateStr(sdf.format(k.getGmtCreate()));
            });

            mav.getModel().put("studentList", studentList);

            return mav;
        }else if ("query".equals(type)){
            List<Student> studentList = studentDao.findStudentByName(studentName);

            final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            studentList.forEach(k -> {
                k.setSignDateStr(sdf.format(k.getGmtCreate()));
            });

            mav.getModel().put("studentList", studentList);

            return mav;
        }else if ("renewClass".equals(type)){//TODO
            Student student = studentDao.findStudent(Integer.parseInt(studentId));

            if (student.getUsedLessons() < student.getBoughtLessons()){
                student.setUsedLessons(student.getUsedLessons() +2);
                studentDao.updateUsedLessons(student);
            }

            List<Student> studentList = studentDao.findAll();
            final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            studentList.forEach(k -> {
                k.setSignDateStr(sdf.format(k.getGmtCreate()));
            });

            mav.getModel().put("studentList", studentList);

            return mav;
        }else if ("createUser".equals(type)){
            int lessonId = Integer.parseInt(stu.getLessonName());
            Lesson lesson = lessonDao.findById(lessonId);

            stu.setBoughtLessons(lesson.getLearnTimes());
            stu.setLessonId(lesson.getId());
            stu.setUsedLessons(0);
            stu.setLessonName(lesson.getLessonName());

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date signDate = sdf.parse(stu.getSignDateStr());
                stu.setSignDate(signDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            studentDao.insert(stu);
            List<Lesson> lessonList = lessonDao.findAll();
            mav.getModel().put("lessonList", lessonList);

            List<Student> studentList = studentDao.findAll();

            studentList.forEach(k -> {
                k.setSignDateStr(sdf.format(k.getGmtCreate()));
            });

            mav.getModel().put("studentList", studentList);

            return mav;
        }
        else {
            return null;
        }
    }

    @RequestMapping(value = "/newUserPage", method = RequestMethod.POST)
    public ModelAndView newUser() {
        ModelAndView mav = new ModelAndView("new_user");

        List<Lesson> lessonList = lessonDao.findAll();
        mav.getModel().put("lessonList", lessonList);
        return mav;
    }

    @RequestMapping(value = "/recordClassPage", method = RequestMethod.POST)
    public ModelAndView recordClass() {
        ModelAndView mav=new ModelAndView("new_learn_record");
        mav.addObject("time", new Date());

        List<Lesson> lessonList = lessonDao.findAll();
        mav.getModel().put("lessonList", lessonList);
        return mav;
    }

    /**
     * 创建用户.
     * @param request
     * @param student
     * @return
     */
    @RequestMapping(value = "/createUser", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
    public ModelAndView createUser(HttpServletRequest request, Student student) {
        int lessonId = Integer.parseInt(student.getLessonName());
        Lesson lesson = lessonDao.findById(lessonId);

        student.setBoughtLessons(lesson.getLearnTimes());
        student.setLessonId(lesson.getId());
        student.setUsedLessons(0);
        student.setLessonName(lesson.getLessonName());

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date signDate = sdf.parse(student.getSignDateStr());
            student.setSignDate(signDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        studentDao.insert(student);

        ModelAndView mav=new ModelAndView("userlist");
        List<Lesson> lessonList = lessonDao.findAll();
        mav.getModel().put("lessonList", lessonList);
        return mav;
    }

    /**
     * 记录上课.
     * @param studentId
     * @return
     */
    @RequestMapping(value = "/recordClass", method = RequestMethod.GET)
    public RedirectView recordClass(String studentId ) {
        Student student = studentDao.findStudent(Integer.parseInt(studentId));
        student.setUsedLessons(student.getUsedLessons() +2);
        studentDao.updateUsedLessons(student);

        return new RedirectView("redirect:/userlist", true, false, false);
    }


    /**
     * 查看上课历史记录.
     * @param studentId
     * @return
     */
    @RequestMapping(value = "/classHistory", method = RequestMethod.POST)
    public ModelAndView classHistory(String studentId ) {
        ModelAndView mav=new ModelAndView("class_used_history");

        List<LessonLog> lessonLogList = lessonLogDao.findUsedLessonsByStudentId(Integer.parseInt(studentId));

        List<ClassSpend> classSpendList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (LessonLog lessonLog : lessonLogList){
            ClassSpend classSpend = new ClassSpend();
            classSpend.setClassDate(sdf.format(lessonLog.getSpentDate()));
            classSpend.setDesc(lessonLog.getComment());

            classSpendList.add(classSpend);
        }

        mav.getModel().put("classSpendList", classSpendList);
        return mav;
    }


    /**
     * 查看续课记录.
     * @param studentId
     * @return
     */
    @RequestMapping(value = "/renewHistory", method = RequestMethod.POST)
    public ModelAndView renewHistory(String studentId ) {
        ModelAndView mav=new ModelAndView("class_renew_history");

        List<LessonLog> lessonLogList = lessonLogDao.findRenewedLessonsByStudentId(Integer.parseInt(studentId));

        List<ClassRenew> renewArrayList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (LessonLog lessonLog : lessonLogList){
            ClassRenew classRenew = new ClassRenew();
            classRenew.setRenewDate(sdf.format(lessonLog.getRenewDate()));
            classRenew.setRenewTimes(""+lessonLog.getLearnTime()+"课时");

            renewArrayList.add(classRenew);
        }

        mav.getModel().put("renewArrayList", renewArrayList);
        return mav;
    }

    @RequestMapping(value = "/renewClass", method = RequestMethod.POST)
    public ModelAndView renewClass(String selectStudentId, String newLessonTime) {
        LessonLog lessonLog = new LessonLog();
        lessonLog.setType("renew");
        lessonLog.setLearnTime(Integer.valueOf(newLessonTime));
        lessonLog.setStudentId(Integer.valueOf(selectStudentId));
        lessonLog.setRenewDate(new Date());

        lessonLogDao.insert(lessonLog);

        Student student = studentDao.findStudent(Integer.parseInt(selectStudentId));
        student.setBoughtLessons(student.getBoughtLessons() + Integer.valueOf(newLessonTime));
        student.setLessonName(student.getLessonName() + ","+newLessonTime+"课时");
        studentDao.updateUsedLessons(student);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        ModelAndView mav=new ModelAndView("userlist");
        List<Student> studentList = studentDao.findAll();

        studentList.forEach(k -> {
            k.setSignDateStr(sdf.format(k.getGmtCreate()));
        });

        mav.getModel().put("studentList", studentList);

        return mav;
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(String username, String password) {
        HttpSession session = request.getSession();
        if (session.getAttribute("userid") != null){
            //directly go to student list
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            ModelAndView mav = new ModelAndView("userlist");
            List<Student> studentList = studentDao.findAll();

            studentList.forEach(k -> {
                k.setSignDateStr(sdf.format(k.getGmtCreate()));
            });

            mav.getModel().put("studentList", studentList);
            return mav;
        }

        User user = userDao.findByNameAndPasswd(username, password);
        if (user != null) {
            session.setAttribute("userid", user.getId());

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            ModelAndView mav = new ModelAndView("userlist");
            List<Student> studentList = studentDao.findAll();

            studentList.forEach(k -> {
                k.setSignDateStr(sdf.format(k.getGmtCreate()));
            });

            mav.getModel().put("studentList", studentList);
            return mav;
        }else {
            ModelAndView mav = new ModelAndView("login");
            return mav;
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ModelAndView logout() {
        HttpSession session = request.getSession();
        if (session != null){
            session.removeAttribute("userid");
        }
        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping(value = "/saveClassUsedRecord", method = RequestMethod.POST)
    public ModelAndView saveClassUsedRecord(String classDate, String classSpent, String desc, String selectStudentId) {
        LessonLog lessonLog = new LessonLog();
        lessonLog.setComment(desc);
        lessonLog.setLearnTime(Integer.valueOf(classSpent));
        lessonLog.setStudentId(Integer.valueOf(selectStudentId));
        lessonLog.setType("used");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            lessonLog.setSpentDate(sdf.parse(classDate));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        lessonLogDao.insert(lessonLog);

        Student student = studentDao.findStudent(Integer.parseInt(selectStudentId));
        if (student.getUsedLessons() < student.getBoughtLessons()) {
            student.setUsedLessons(student.getUsedLessons() + 2);
            studentDao.updateUsedLessons(student);
        }

        ModelAndView mav=new ModelAndView("userlist");
        List<Student> studentList = studentDao.findAll();

        studentList.forEach(k -> {
            k.setSignDateStr(sdf.format(k.getGmtCreate()));
        });

        mav.getModel().put("studentList", studentList);
        return mav;
    }


    @RequestMapping(value = "/deleteStudent", method = RequestMethod.POST)
    public ModelAndView deleteStudent(String selectStudentId) {
        studentDao.deleteStudent(Integer.valueOf(selectStudentId));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        ModelAndView mav=new ModelAndView("userlist");
        List<Student> studentList = studentDao.findAll();

        studentList.forEach(k -> {
            k.setSignDateStr(sdf.format(k.getGmtCreate()));
        });

        mav.getModel().put("studentList", studentList);

        return mav;
    }
}