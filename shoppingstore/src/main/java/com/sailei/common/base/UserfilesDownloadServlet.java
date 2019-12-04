package com.sailei.common.base;

import com.sailei.common.utils.MultipartFileUtil;
import com.sailei.modules.sys.utils.SetUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.util.UriUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * 查看静态文件
 *
 * @Author gaojin
 * @Date 2019-05-28 17:02:56
 */
public class UserfilesDownloadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Logger logger = LoggerFactory.getLogger(getClass());

    public void fileOutputStream(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String filepath = req.getRequestURI();
        int index = filepath.indexOf(MultipartFileUtil.FILE_BASE);
        if (index >= 0) {
            filepath = filepath.substring(index + MultipartFileUtil.FILE_BASE.length());
        }
        try {
            filepath = UriUtils.decode(filepath, "UTF-8");
        } catch (Exception e1) {
            logger.error(String.format("解释文件路径失败，URL地址为%s", filepath), e1);
        }
        File file = new File(SetUtils.getSetValue("FILE_UPLOAD_BASEDIR") + MultipartFileUtil.FILE_BASE + filepath);
        try {
            FileCopyUtils.copy(new FileInputStream(file), resp.getOutputStream());
            resp.setHeader("Content-Type", "application/octet-stream");
            return;
        } catch (FileNotFoundException e) {
            req.setAttribute("exception", new FileNotFoundException("请求的文件不存在"));
            req.getRequestDispatcher("/login.html").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        fileOutputStream(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        fileOutputStream(req, resp);
    }
}
