/**
 * 引用JS和CSS头文件
 */
var rootPath = getRootPath(); //项目路径

/**
 * 动态加载CSS和JS文件
 */
var dynamicLoading = {
    meta : function(){
        document.write('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">');
    },
    css: function(path){
        if(!path || path.length === 0){
            throw new Error('argument "path" is required!');
        }
        document.write('<link rel="stylesheet" type="text/css" href="' + path + '">');
    },
    js: function(path, charset){
        if(!path || path.length === 0){
            throw new Error('argument "path" is required!');
        }
        document.write('<script charset="' + (charset ? charset : "utf-8") + '" src="' + path + '"></script>');
    }
};

/**
 * 取得项目路径
 * @author wul
 */
function getRootPath() {
    //取得当前URL
    var path = window.document.location.href;
    //取得主机地址后的目录
    var pathName = window.document.location.pathname;
    var post = path.indexOf(pathName);
    //取得主机地址
    var hostPath = path.substring(0, post);
    //取得项目名
    var name = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);
    return hostPath + name + "/";
}

function getRoot() {
    //取得当前URL
    var path = window.document.location.href;
    //取得主机地址后的目录
    var pathName = window.document.location.pathname;
    var post = path.indexOf(pathName);
    //取得主机地址
    var hostPath = path.substring(0, post);
    //取得项目名
    //var name = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);
    return hostPath + "/";
}

//动态生成meta
dynamicLoading.meta();

//引入jQuery JS库
dynamicLoading.js("https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js", "utf-8");

//引入amazeui JS库以及CSS库
dynamicLoading.js("https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js", "utf-8");
dynamicLoading.css("https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css");

//dynamicLoading.js("https://cdn.bootcss.com/datatables/1.10.16/js/dataTables.bootstrap.min.js", "utf-8");
//dynamicLoading.css("https://cdn.bootcss.com/datatables/1.10.16/css/dataTables.bootstrap.min.css");		
//dynamicLoading.js("https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js", "utf-8");
//dynamicLoading.css("https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css");
dynamicLoading.js("https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js", "utf-8");
dynamicLoading.js("https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js", "utf-8");
dynamicLoading.css("https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css");

//扩展自定义按钮
dynamicLoading.css("https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css");
dynamicLoading.js("https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js", "utf-8");
dynamicLoading.js("https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js", "utf-8");

dynamicLoading.js("https://cdn.bootcss.com/moment.js/2.22.0/moment.min.js", "utf-8");
dynamicLoading.js("https://cdn.bootcss.com/moment.js/2.22.0/locale/zh-cn.js", "utf-8");
