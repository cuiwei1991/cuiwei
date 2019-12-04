package com.sailei.modules.gen.entity;

import com.sailei.common.utils.StringUtils;
import org.hibernate.validator.constraints.Length;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** 
 * 描述:代码生成模板实体
 *  
 * @Author sailei
 * @Date 2019/7/21 10:10
 */
@XmlRootElement(name = "template")
public class GenTemplate {
    private static final long serialVersionUID = 1L;
    private String id;
    private String name;
    private String category;
    private String filePath;
    private String fileName;
    private String content;

    public GenTemplate() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Length(min = 1, max = 200)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFileName() {
        return this.fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<String> getCategoryList() {
        if (this.category == null) {
            return new ArrayList<>();
        }
        String[] strs = StringUtils.split(this.category, ",");
        return Arrays.asList(strs);
    }

    public void setCategoryList(List<String> categoryList) {
        if (categoryList == null) {
            this.category = "";
        } else {
            this.category = ("," + StringUtils.join(categoryList, ",") + ",");
        }
    }
}
