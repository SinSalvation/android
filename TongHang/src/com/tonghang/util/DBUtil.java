package com.tonghang.util;/**
 * Description : DBUtil
 * Created by YangZH on 2015/3/17
 *  23:43
 */

/**
 * Description : DBUtil
 * Created by YangZH on 2015/3/17
 * 23:43
 */

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class DBUtil {
    private static SqlSessionFactory factory;

    static{
        try {
            InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
            factory = new SqlSessionFactoryBuilder().build(is);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static SqlSession createSession(){
        return factory.openSession();
    }

    public static void closeSession(SqlSession session){
        if(session!=null)
            session.close();
    }
}

