<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">




    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">


    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page = "header.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page = "aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                订单管理
                <small>全部订单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">订单管理</a></li>
                <li class="active">全部订单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">订单信息</h3>
            </div>

            <div class="box-body">

                <!--label显示的内容-->
                <form action="${pageContext.request.contextPath}/product/save.do" method="post">
                    <div class="tab-pane active" id="tab-label">

                        <div class="row data-type">

                            <div class="col-md-2 title">订单编号</div>
                            <div class="col-md-4 data text">
                                <input name="productNum" type="text" class="form-control" placeholder="" value="${orders.orderNum}" readonly>
                            </div>

                            <div class="col-md-2 title">下单时间</div>
                            <div class="col-md-4 data">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input name="departureTimeStr" type="text" class="form-control pull-right" id="dateTimePicker" value="${orders.orderTimeStr}" readonly>
                                </div>
                            </div>

                            <div class="col-md-2 title">路线名称</div>
                            <div class="col-md-4 data text">
                                <input name="productPrice" type="text" class="form-control" placeholder="路线名称" value="${orders.product.productName}" readonly>
                            </div>

                            <div class="col-md-2 title">出发城市</div>
                            <div class="col-md-4 data text">
                                <input name="cityName" ype="text" class="form-control" placeholder="出发城市" value="${orders.product.cityName}" readonly>
                            </div>

                            <div class="col-md-2 title">出发时间</div>
                            <div class="col-md-4 data">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input name="departureTimeStr" type="text" class="form-control pull-right" id="dateTimePicker" value="${orders.product.departureTimeStr}" readonly>
                                </div>
                            </div>

                            <div class="col-md-2 title">出游人数</div>
                            <div class="col-md-4 data text">
                                <input name="cityName" ype="text" class="form-control" placeholder="出游人数" value="${orders.peopleCount}" readonly>
                            </div>
                            <div class="col-md-2 title rowHeight2x">其他信息</div>
                            <div class="col-md-10 data rowHeight2x">
                                <textarea name="productDesc" class="form-control" rows="3" placeholder="其他信息" values="${orders.orderDesc}"></textarea>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <!-- @@close -->


            <!-- 内容区域 /-->



        </div>
            <!-- /.box-body -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">游客信息</h3>
            </div>

            <div class="box-body">

                <!--树表格-->
                <div class="tab-pane" id="tab-treetable">
                    <table id="collapse-table" class="table table-bordered table-hover dataTable">
                        <thead>
                        <tr>
                            <th>人群</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>手机号码</th>
                            <th>证件类型</th>
                            <th>证件号码</th>
                        </tr>
                        </thead>
                        <thead>
                        <tr>
                            <td> <input name="productNum" type="text" class="form-control" placeholder="" value="" readonly></td>
                            <td> <input name="productNum" type="text" class="form-control" placeholder="姓名" value="" ></td>
                            <td> <input name="productNum" type="text" class="form-control" placeholder="性别" value=""></td>
                            <td> <input name="productNum" type="text" class="form-control" placeholder="手机号码" value=""></td>
                            <td> <input name="productNum" type="text" class="form-control" placeholder="证件类型" value=""></td>
                            <td> <input name="productNum" type="text" class="form-control" placeholder="证件号码" value=""></td>
                        </tr>
                        </thead>
                    </table>
                </div>
                <!--树表格/-->

            </div>
            <!-- @@close -->


            <!-- 内容区域 /-->



        </div>
        <!-- /.box-body -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">联系人信息</h3>
            </div>

            <div class="box-body">

                <!--label显示的内容-->
                <form action="${pageContext.request.contextPath}/product/save.do" method="post">
                    <div class="tab-pane active" id="tab-label">

                        <div class="row data-type">

                            <div class="col-md-2 title">会员</div>
                            <div class="col-md-4 data text">
                                <input name="productNum" type="text" class="form-control" placeholder="" value="${orders.member.username}" readonly>
                            </div>
                            <div class="col-md-2 title">联系人</div>
                            <div class="col-md-4 data text">
                                <input name="productNum" type="text" class="form-control" placeholder="" value="${orders.member.nickname}" readonly>
                            </div>
                            <div class="col-md-2 title">手机号</div>
                            <div class="col-md-4 data text">
                                <input name="productNum" type="text" class="form-control" placeholder="" value="${orders.member.phoneNum}" readonly>
                            </div>
                            <div class="col-md-2 title">邮箱</div>
                            <div class="col-md-4 data text">
                                <input name="productNum" type="text" class="form-control" placeholder="订单编号" value="${orders.member.email}" readonly>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <!-- @@close -->


            <!-- 内容区域 /-->



        </div>
        <!-- /.box-body -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">费用信息</h3>
            </div>

            <div class="box-body">

                <!--label显示的内容-->
                <form action="${pageContext.request.contextPath}/product/save.do" method="post">
                    <div class="tab-pane active" id="tab-label">

                        <div class="row data-type">

                            <div class="col-md-2 title">支付方式</div>
                            <div class="col-md-4 data text">
                                <input name="productNum" type="text" class="form-control" placeholder="订单编号" value="${orders.payTypeStr}" readonly>
                            </div>
                            <div class="col-md-2 title">金额</div>
                            <div class="col-md-4 data text">
                                <input name="productNum" type="text" class="form-control" placeholder="订单编号" value="${orders.product.productPrice}" readonly>
                            </div>

                        </div>
                    </div>

                </form>
            </div>
            <!-- @@close -->


            <!-- 内容区域 /-->



        </div>
        <!-- /.box-body -->
    </div>


    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.8
        </div>
        <strong>Copyright &copy; 2014-2017 <a href="">研究院研发部</a>.</strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>


<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {

        // datetime picker
        $('#dateTimePicker').datetimepicker({
            format: "mm/dd/yyyy - hh:ii",
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN'
        });

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>

</html>