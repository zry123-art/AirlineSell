<%--
  Created by IntelliJ IDEA.
  User: TIANYANZHI
  Date: 2018/8/6 0006
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <title>列出公司</title>
</head>
<body>
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h2>公司列表</h2>
        </div>
    </div>
    <br>
    <!--搜索框-->
    <div class="row">
        <div class="col-lg-12">
            <div class="input-group">
                <input type="text" id="t1" class="form-control" placeholder="输入公司名">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" onclick="search()">搜索</button>
                </span>
                ${msgd}
                <div class="col-md-8 col-md-offset-8">
                        <a href="${pageContext.request.contextPath}/jumpAddAl.do">
                            <button type="button" class="btn btn-success">
                            添加公司信息
                            </button>
                        </a>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!--表格-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>公司名称</th>
                    <th>公司代码</th>
                    <th>公司地址</th>
                    <th>公司网址</th>
                    <th>公司电话</th>
                    <th></th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="airlinecompany">
                    <tr>
                        <td>${airlinecompany.name}</td>
                        <td>${airlinecompany.companycode}</td>
                        <td>${airlinecompany.address}</td>
                        <td>${airlinecompany.website}</td>
                        <td>${airlinecompany.phone}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/jumpAlterAl.do">
                                <button type="button" class="btn btn-danger  btn-sm" onclick="alert('点击修改！')">
                                    修改
                                </button>
                            </a>
                            <a href="${pageContext.request.contextPath}/deleteAirlinecompany.do?name=${airlinecompany.name}">
                                <button type="button" class="btn btn-danger  btn-sm" onclick="alert('点击删除！')">
                                    删除
                                </button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </div>
    <!--分页信息-->
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前为第${pageInfo.pageNum}页，总共有${pageInfo.pages}页，共有${pageInfo.total}条记录
        </div>
        <%--	分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/selectAllAirlinecompany.do?pn=1">首页</a></li>
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/selectAllAirlinecompany.do?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num==pageInfo.pageNum}">
                            <li class="active"><a
                                    href="${pageContext.request.contextPath}/selectAllAirlinecompany.do?pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>
                        <c:if test="${page_num!=pageInfo.pageNum}">
                            <li>
                                <a href="${pageContext.request.contextPath}/selectAllAirlinecompany.do?pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/selectAllAirlinecompany.do?pn=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/selectAllAirlinecompany.do?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
            <div class="col-md-2">
                <a href="${pageContext.request.contextPath}/jumpSuAdMain.do">返回主菜单</a>
            </div>
    </div>

</div>
</body>
<script type="text/javascript">
    function search(){
        var name = $("#t1").val();
        window.location.href="${pageContext.request.contextPath}/selectAirlinecompanyByName.do?name="+name;
    }
</script>
</html>