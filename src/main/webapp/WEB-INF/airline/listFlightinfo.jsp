<%--
  Created by IntelliJ IDEA.
  User: TIANYANZHI
  Date: 2018/8/6 0006
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>航班列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/dataTables.bootstrap.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/themes/flat-blue.css">
</head>
<body>
<%--引入页面--%>
<c:if test="${admin.authority eq '1'}"><jsp:include page="/WEB-INF/admin/optionsbarless.jsp" /></c:if>
<c:if test="${admin.authority eq '2'}"><jsp:include page="/WEB-INF/admin/optionsbar.jsp" /></c:if>
<!-- Main Content -->
<div class="container-fluid">
    <div class="side-body">
        <div class="page-title">
            <span class="title">航班管理</span>
            <div class="description">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Here you can manage the flight.</div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">
                            <div class="title">航班列表</div>
                        </div>
                        <div class="pull-right card-action">
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="button" class="btn btn-primary  btn-primary" data-toggle="modal" data-target="#modalPrimary0">新增航班</button>
                                <!-- Modal -->
                                <div class="modal fade modal-primary" id="modalPrimary0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabe0">添加航班信息</h4>
                                            </div>
                                            <div class="modal-body">

                                                <form class="form-horizontal" action="${pageContext.request.contextPath}/addFlight.do" method="post">
                                                    <div class="form-group">
                                                        <label for="input8" class="col-sm-2 control-label">公司名</label>
                                                        <div class="col-sm-10">
                                                            <select class="form-control" id="input8" required name="airlinecompany_name" aria-hidden="false">
                                                                <c:forEach items="${pageForCompany.list}" var="company">
                                                                    <option value="${company.name}">${company.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <%--<input type="text" class="form-control" name="airlinecompany_name" id="input8" required placeholder="xxx">--%>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="input4" class="col-sm-2 control-label">机型名</label>
                                                        <div class="col-sm-10">
                                                            <select class="form-control" id="input4" required name="airplanetype_name">
                                                                <c:forEach items="${pageForType.list}" var="type">
                                                                    <option value="${type.name}">${type.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <%--<input type="text" class="form-control" name="airplanetype_name" id="input4" required placeholder="xxx">--%>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="input5" class="col-sm-2 control-label">航班号</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="flightnumber" id="input5" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="input6" class="col-sm-2 control-label">出发地</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="start" id="input6" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputdis" class="col-sm-2 control-label">目的地</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="end" id="inputdis" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputcs" class="col-sm-2 control-label">出发时间</label>
                                                        <div class="col-sm-10">
                                                            <input type="datetime-local" class="form-control" name="starttime" id="inputcs" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputds" class="col-sm-2 control-label">到达时间</label>
                                                        <div class="col-sm-10">
                                                            <input type="datetime-local" class="form-control" name="endtime" id="inputds" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputt" class="col-sm-2 control-label">头等舱价格</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="firstprice" id="inputt" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputs" class="col-sm-2 control-label">商务舱价格</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="businessprice" id="inputs" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputj" class="col-sm-2 control-label">经济舱价格</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="economyprice" id="inputj" required placeholder="xxx">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" class="btn btn-primary">确认添加</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table class="datatable table table-hover" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>航班号</th>
                                <th>机型名</th>
                                <th>公司名</th>
                                <th>出发地</th>
                                <th>目的地</th>
                                <th>出发时间</th>
                                <th>到达时间</th>
                                <th>头等舱价格</th>
                                <th>商务舱价格</th>
                                <th>经济舱价格</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="flightinfo">
                                <tr>
                                    <td>${flightinfo.flightnumber}</td>
                                    <td>${flightinfo.airplanetype_name}</td>
                                    <td>${flightinfo.airlinecompany_name}</td>
                                    <td>${flightinfo.start}</td>
                                    <td>${flightinfo.end}</td>
                                    <td>${flightinfo.starttime}</td>
                                    <td>${flightinfo.endtime}</td>
                                    <td>${flightinfo.firstprice}</td>
                                    <td>${flightinfo.businessprice}</td>
                                    <td>${flightinfo.economyprice}</td>
                                    <td>

                                            <%--<button type="button" class="btn btn-info  btn-sm" data-toggle="modal" data-target="#modalPrimary1">修改</button>
                                            <!-- Modal -->
                                            <div class="modal fade modal-primary" id="modalPrimary1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">修改公司信息</h4>
                                                        </div>
                                                        <div class="modal-body">

                                                            <form class="form-horizontal" action="${pageContext.request.contextPath}/alterAirlinecompany.do" method="post">
                                                                <div class="form-group">
                                                                    <label for="input1" class="col-sm-2 control-label">公司代码</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="hidden" name="name" value=${airlinecompany.name}>
                                                                        <input type="text" class="form-control" name="companycode" id="input1" required placeholder="xxx">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="input2" class="col-sm-2 control-label">公司地址</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" class="form-control" name="address" id="input2" required placeholder="xxx">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="input3" class="col-sm-2 control-label">公司网址</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" class="form-control" name="website" id="input3" required placeholder="xxx">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword2" class="col-sm-2 control-label">联系方式</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" class="form-control" name="phone" id="inputPassword2" required placeholder="xxx">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-sm-offset-2 col-sm-10">
                                                                        <button type="submit" class="btn btn-primary">确认修改</button>
                                                                    </div>
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>



                                        <button type="button" class="btn btn-danger  btn-sm" data-toggle="modal" data-target="#modalPrimary2">删除</button>
                                        <!-- Modal -->
                                        <div class="modal fade modal-primary" id="modalPrimary2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabe2">删除航班</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        此操作将不可逆，是否删除？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <a href="${pageContext.request.contextPath}/deleteFlight.do?flightnumber=${flightinfo.flightnumber}">
                                                            <button type="button" class="btn btn-danger">确认删除</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="app-footer">
    <div class="wrapper">
        <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © feiyiban2018 Copyright.
    </div>
</footer>
<!-- Javascript Libs -->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/Chart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/select2.full.min.js"></script>
<!-- Javascript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>
