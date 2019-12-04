// 用common.js必须加上Feng.addCtx("${ctxPath}");
Feng.info = function (info) {
    top.layer.msg(info, {icon: 6});
};
Feng.success = function (info) {
    top.layer.msg(info, {icon: 1});
};
Feng.error = function (info) {
    top.layer.msg(info, {icon: 2});
};
Feng.confirm = function (tip, ensure) {
    top.layer.confirm(tip, {
        skin: 'layui-layer-admin'
    }, function (index) {
        top.layer.close(index);
        ensure();
    });
};
Feng.currentDate = function () {
    // 获取当前日期
    var date = new Date();

    // 获取当前月份
    var nowMonth = date.getMonth() + 1;

    // 获取当前是几号
    var strDate = date.getDate();

    // 添加分隔符“-”
    var seperator = "-";

    // 对月份进行处理，1-9月在前面添加一个“0”
    if (nowMonth >= 1 && nowMonth <= 9) {
        nowMonth = "0" + nowMonth;
    }

    // 对月份进行处理，1-9号在前面添加一个“0”
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }

    // 最后拼接字符串，得到一个格式为(yyyy-MM-dd)的日期
    return date.getFullYear() + seperator + nowMonth + seperator + strDate;
};
Feng.getUrlParam = function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    } else {
        return null;
    }
};
Feng.infoDetail = function (title, info) {
    var display = "";
    if (typeof info === "string") {
        display = info;
    } else {
        if (info instanceof Array) {
            for (var x in info) {
                display = display + info[x] + "<br/>";
            }
        } else {
            display = info;
        }
    }
    top.layer.open({
        title: title,
        type: 1,
        skin: 'layui-layer-rim', //加上边框
        area: ['950px', '600px'], //宽高
        content: '<div style="padding: 20px;">' + display + '</div>'
    });
};
Feng.zTreeCheckedNodes = function (zTreeId) {
    var zTree = $.fn.zTree.getZTreeObj(zTreeId);
    var nodes = zTree.getCheckedNodes();
    var ids = "";
    for (var i = 0, l = nodes.length; i < l; i++) {
        ids += "," + nodes[i].id;
    }
    return ids.substring(1);
};
Feng.closeAllLoading = function () {
    layer.closeAll('loading');
};

// 以下代码是配置layui扩展模块的目录，每个页面都需要引入
layui.config({
    base: Feng.ctxPath + '/assets/common/module/'
}).extend({
    formSelects: 'formSelects/formSelects-v4',
    treetable: 'treetable-lay/treetable',
    dropdown: 'dropdown/dropdown',
    notice: 'notice/notice',
    step: 'step-lay/step',
    dtree: 'dtree/dtree',
    citypicker: 'city-picker/city-picker',
    tableSelect: 'tableSelect/tableSelect',
    selectPlus: '../../expand/module/selectPlus/selectPlus',
    ax: '../../expand/module/ax/ax',
    ztree: '../../expand/module/ztree/ztree-object',
    jstree: 'jstree/jstree'
}).use(['admin' , 'jstree'], function () {
    var $ = layui.jquery;
    var admin = layui.admin;
    var jstree = layui.jstree

    // 移除loading动画
    setTimeout(function () {
        admin.removeLoading();
    }, window == top ? 600 : 100);

    //注册session超时的操作
    $.ajaxSetup({
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        complete: function (XMLHttpRequest, textStatus) {

            //通过XMLHttpRequest取得响应头，sessionstatus，
            var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
            if (sessionstatus === "timeout") {

                //如果超时就处理 ，指定要跳转的页面
                window.location = Feng.ctxPath + "/errorSession";
            }
        }
    });
    var layuiIcons = ["layui-icon-rate-half", "layui-icon-rate", "layui-icon-rate-solid", "layui-icon-cellphone", "layui-icon-vercode", "layui-icon-login-wechat", "layui-icon-login-qq", "layui-icon-login-weibo", "layui-icon-password", "layui-icon-username", "layui-icon-refresh-3", "layui-icon-auz", "layui-icon-spread-left", "layui-icon-shrink-right", "layui-icon-snowflake", "layui-icon-tips", "layui-icon-note", "layui-icon-home", "layui-icon-senior", "layui-icon-refresh", "layui-icon-refresh-1", "layui-icon-flag", "layui-icon-theme", "layui-icon-notice", "layui-icon-website", "layui-icon-console", "layui-icon-face-surprised", "layui-icon-set", "layui-icon-template-1", "layui-icon-app", "layui-icon-template", "layui-icon-praise", "layui-icon-tread", "layui-icon-male", "layui-icon-female", "layui-icon-camera", "layui-icon-camera-fill", "layui-icon-more", "layui-icon-more-vertical", "layui-icon-rmb", "layui-icon-dollar", "layui-icon-diamond", "layui-icon-fire", "layui-icon-return", "layui-icon-location", "layui-icon-read", "layui-icon-survey", "layui-icon-face-smile", "layui-icon-face-cry", "layui-icon-cart-simple", "layui-icon-cart", "layui-icon-next", "layui-icon-prev", "layui-icon-upload-drag", "layui-icon-upload", "layui-icon-download-circle", "layui-icon-component", "layui-icon-file-b", "layui-icon-user", "layui-icon-find-fill", "layui-icon-loading", "layui-icon-loading-1", "layui-icon-add-1", "layui-icon-play", "layui-icon-pause", "layui-icon-headset", "layui-icon-video", "layui-icon-voice", "layui-icon-speaker", "layui-icon-fonts-del", "layui-icon-fonts-code", "layui-icon-fonts-html", "layui-icon-fonts-strong", "layui-icon-unlink", "layui-icon-picture", "layui-icon-link", "layui-icon-face-smile-b", "layui-icon-align-left", "layui-icon-align-right", "layui-icon-align-center", "layui-icon-fonts-u", "layui-icon-fonts-i", "layui-icon-tabs", "layui-icon-radio", "layui-icon-circle", "layui-icon-edit", "layui-icon-share", "layui-icon-delete", "layui-icon-form", "layui-icon-cellphone-fine", "layui-icon-dialogue", "layui-icon-fonts-clear", "layui-icon-layer", "layui-icon-date", "layui-icon-water", "layui-icon-code-circle", "layui-icon-carousel", "layui-icon-prev-circle", "layui-icon-layouts", "layui-icon-util", "layui-icon-templeate-1", "layui-icon-upload-circle", "layui-icon-tree", "layui-icon-table", "layui-icon-chart", "layui-icon-chart-screen", "layui-icon-engine", "layui-icon-triangle-d", "layui-icon-triangle-r", "layui-icon-file", "layui-icon-set-sm", "layui-icon-add-circle", "layui-icon-404", "layui-icon-about", "layui-icon-up", "layui-icon-down", "layui-icon-left", "layui-icon-right", "layui-icon-circle-dot", "layui-icon-search", "layui-icon-set-fill", "layui-icon-group", "layui-icon-friends", "layui-icon-reply-fill", "layui-icon-menu-fill", "layui-icon-log", "layui-icon-picture-fine", "layui-icon-face-smile-fine", "layui-icon-list", "layui-icon-release", "layui-icon-ok", "layui-icon-help", "layui-icon-chat", "layui-icon-top", "layui-icon-star", "layui-icon-star-fill", "layui-icon-close-fill", "layui-icon-close", "layui-icon-ok-circle", "layui-icon-add-circle-fine"];
    window.$layuiIcons = layuiIcons;
    var sidebar = {
        elem: '',
        skin: 'normal',
        click: null,
        nodes: [],
        didInit: null,
        init: function (options) {
            this.elem = options.elem;
            this.skin = options.skin;
            this.click = options.click;
            this.nodes = options.nodes;
            this.didInit = options.didInit;
            this._initSidebar();
        },
        _initSidebar: function () {
            var li = '';
            for (var i = 0; i < this.nodes.length; i++) {
                var iconClass = this.nodes[i].iconClass;
                var title = this.nodes[i].title;

                li += '<li class="layui-nav-item">\n' +
                    '                <a  class="sidebarClick" i="'+i+'"><i class="layui-icon '+ iconClass +'"></i><cite>'+ title +'</cite></a>\n';
                if (this.nodes[i].children && this.nodes[i].children.length > 0) {
                    var dl = '                <dl class="layui-nav-child">\n';

                    for (var j = 0; j < this.nodes[i].children.length; j++) {
                        var subIconClass = this.nodes[i].children[j].iconClass;
                        var subTitle = this.nodes[i].children[j].title;
                        var subItem = this.nodes[i].children[j];
                        dl += '                    <dd class="sidebarClick" i="'+i+'" j="'+j+'"><a href="javascript:;"><i class="layui-icon '+ subIconClass +'"></i><cite>'+ subTitle +'</cite></a>';

                        if (subItem.children && subItem.children.length > 0) {
                            var _dl = '                <dl class="layui-nav-child">\n';

                            for (var k = 0; k < subItem.children.length; k++) {
                                var _subIconClass = subItem.children[j].iconClass;
                                var _subTitle = subItem.children[j].title;

                                _dl += '                    <dd class="sidebarClick" i="'+i+'" j="'+j+'" k="'+k+'"><a href="javascript:;"><i class="layui-icon '+ _subIconClass +'"></i><cite>'+ _subTitle +'</cite></a></dd>\n';
                            }

                            _dl += '                </dl>\n';
                            dl += _dl;
                        }

                        dl += '</dd>\n';
                    }

                    dl += '                </dl>\n';
                    li += dl;
                }
                li += '            </li>';
            }
            document.getElementById(this.elem).innerHTML = li;
            if (this.didInit) {
                this.didInit();
            }
            $('.sidebarClick').click(function () {
                if (sidebar.click) {
                    var i = $(this).attr('i');
                    var j = $(this).attr('j');
                    var k = $(this).attr('k');
                    if (k) {
                        sidebar.click(sidebar.nodes[i].children[j].children[k])
                    } else if (j) {
                        sidebar.click(sidebar.nodes[i].children[j])
                    } else {
                        sidebar.click(sidebar.nodes[i])
                    }
                }

            });
        }
    };
    window.$sidebar = sidebar;
});