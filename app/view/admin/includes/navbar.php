</head>
<div class="container-fluid">
    <div class="row">
        <!--  Start Sidebar -->
        <div class="col-2 p-0 ">
            <div class="sidebar bg-dark" id="mySidenav">
                    <div class="logo-site pr-3">
                        <img  src="/image/logo.png" >
                    </div>

                <div class="userImage text-center">
                    <img src="<?php echo(Session::get('user')['user_image']) ?>" class="rounded-circle" width="30">
                </div>
                <div class="link m-5">
                    <a href="/admin/index"><i class="fa fa-home iconi"></i> <label class="hrefLabel">الصفحة الرئيسية</label></a>
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#collapse1"><i class="fa fa-users-cog iconi"></i> <label
                                            class="hrefLabel">الحسابات<i class="fa fa-angle-down "></i></label></a>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <a href="#">
                                        <i class="fa fa-user-cog icon"></i>
                                        <label class="hrefLabel">المدراء الفرعين </label>
                                    </a>


                                </div>
                                <div class="panel-footer">
                                    <a href="/admin/universities/index"><i class="ion ion-university icon"></i> <label
                                                class="hrefLabel">الجامعات</label></a>
                                    <a href="/admin/teachers/index"><i class="fa fa-chalkboard-teacher icon"></i> <label
                                                class="hrefLabel">الأساتذة</label></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">

                                <a data-toggle="collapse" href="#collapse2"><i class="fa fa-users-cog iconi"></i> <label
                                            class="hrefLabel">الادارة<i class="fa fa-angle-down "></i></label></a>

                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <a href="/admin/role/index"><i class="fa fa-user-cog icon"></i> <label
                                                class="hrefLabel">الادوار</label></a>
                                    <a href="/admin/permision/index"><i class="fa fa-cogs icon"></i> <label
                                                class="hrefLabel">الصلاحيات</label></a>

                                </div>

                            </div>
                        </div>
                    </div>

                    <a href="/admin/courses/index"><i class="fa fa-book-reader iconi"></i> <label class="hrefLabel">الكورسات</label></a>
                    <a href="/admin/categories/index"><i class="fa fa-list iconi"></i> <label
                                class="hrefLabel">الأقسام</label></a>

                </div>
            </div>
        </div>
        <!--  End Sidebar   -->

        <!-- Start Content -->
        <div class="col-10 p-0">

            <!-- Start navBar -->
            <div class="row-cols-1 mb-4">
                <div class="mynav">
                    <nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
                        <!-- Brand -->
                        <div class="col-6 text-right">
<!--                            <a class="text-white" href="#"> لوحة التحكم</a>-->
                        </div>
                        <!-- Links -->
                        <div class="col-6 text-left">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="ion ion-email font-size-24"></i>
                                        <span class="badge badge-light">4</span>
                                    </a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="#">
                                        <i class="ion ion-android-notifications font-size-24"></i>
                                        <span class="badge badge-light">4</span>
                                    </a>
                                </li>
                                <!-- Dropdown -->
                                <li class="nav-item dropdown ">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                        <img src="<?php echo(Session::get('user')['user_image']); ?>" class="rounded-circle"
                                             width="25px"> <?php echo(Session::get('user')['user_name']) ?>
                                    </a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#"><i class="ion ion-edit"></i> تعديل الملف الشخصي </a>
                                        <a class="dropdown-item" href="/admin/logout"><i class="ion ion-log-out"></i> تسجيل
                                            الخروج</a>
                                    </div>
                                </li>

                            </ul>

                        </div>
                    </nav>
                </div>
            </div>

            <!-- End navBar -->




