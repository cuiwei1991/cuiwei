package com.sailei.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/** 
 * 描述:xml字符串工具类
 *  
 * @Author sailei
 * @Date 2019/7/21 10:04
 */
public class XmlStrUtil {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(XmlStrUtil.class);

    /**
     * XML格式字符串转换为Map
     *
     * @param strXML XML字符串
     * @return XML数据转换后的Map
     */
    public static Map<String, String> xmlToMap(String strXML) {
        Map<String, String> data = new HashMap<>();
        try {
            /** 从xml文档中获取DOM的解析器 这里调用DOM工厂... */
            DocumentBuilder documentBuilder = newDocumentBuilder();
            /** 设置输入源的字符流 */
            InputStream stream = new ByteArrayInputStream(strXML.getBytes("UTF-8"));
            /** 指定输入源的内容解析成一个XML文档，并返回一个DOM对象 */
            org.w3c.dom.Document doc = documentBuilder.parse(stream);
            doc.getDocumentElement().normalize();
            NodeList nodeList = doc.getDocumentElement().getChildNodes();
            for (int idx = 0; idx < nodeList.getLength(); ++idx) {
                Node node = nodeList.item(idx);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    org.w3c.dom.Element element = (org.w3c.dom.Element) node;
                    data.put(element.getNodeName(), element.getTextContent());
                }
            }
            try {
                stream.close();
            } catch (Exception ex) {
            }
        } catch (Exception ex) {
            logger.error("Invalid XML, can not convert to map. Error message: {}. XML content: {}", ex.getMessage(), strXML);
        }
        return data;

    }

    public static DocumentBuilder newDocumentBuilder() throws ParserConfigurationException {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        documentBuilderFactory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        documentBuilderFactory.setFeature("http://xml.org/sax/features/external-general-entities", false);
        documentBuilderFactory.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        documentBuilderFactory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
        documentBuilderFactory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
        documentBuilderFactory.setXIncludeAware(false);
        documentBuilderFactory.setExpandEntityReferences(false);

        return documentBuilderFactory.newDocumentBuilder();
    }

    /**
     * map转xml字符串
     */
    public static String mapToXmlStr(Map<String, String> map) {
        StringBuffer xmlStr = new StringBuffer("<xml>\n");
        for (String key : map.keySet()) {
            xmlStr.append("<");
            xmlStr.append(key);
            xmlStr.append(">");
            xmlStr.append(map.get(key));
            xmlStr.append("</");
            xmlStr.append(key);
            xmlStr.append(">\n");
        }
        xmlStr.append("</xml>");
        return xmlStr.toString();
    }

}
