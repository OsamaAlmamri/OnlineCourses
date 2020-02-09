</head>
<div class="container-fluid">
    <div class="row">
        <!--  Start Sidebar -->
        <div class="col-2 p-0 ">
            <nav id="sidebar" class="">
                <div class="sidebar-header">
                    <img src="/images/logo.png">
                    <strong>كورسات</strong>
                </div>

                <div class="userImage text-center">
                    <img src="<?php echo(Session::get('user')['user_image']) ?>" class="rounded-circle" width="30">
                </div>
                <ul class="list-unstyled components">
                    <li>
                        <a href="/admin/index">
                            <i class="fas fa-home a2"></i>
                            الصفحة الرئيسية
                        </a>
                    </li>

                    <li>
                        <a href="/admin/categories/index">
                            <i class="fas fa-list"></i>
                            الاقسام
                        </a>
                    </li>

                    <li>
                        <a href="/admin/courses/index">
                            <i class="fas fa-list"></i>
                           الكورسات
                        </a>
                    </li>
                    <li>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                            <i class="fa fa-users-cog "></i>
                            الحسابات
                        </a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                            <li>
                                <a href="#"><i class="fa fa-users-cog "></i>المدراء الفرعين  </a>
                            </li>
                            <li>
                                <a href="/admin/universities/index"><i class="ion ion-university  "></i>الجامعات</a>
                            </li>
                            <li>
                                <a href="/admin/teachers/index"><i class="fa fa-chalkboard-teacher "></i>المدرسين </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                            <i class="fa fa-users-cog "></i>
                            الادارة
                        </a>
                        <ul class="collapse list-unstyled" id="pageSubmenu2">
                            <li>
                                <a href="/admin/role/index"><i class="fa fa-users-cog "></i>الادوار </a>
                            </li>
                            <li>
                                <a href="/admin/permision/index"><i class="fa fa-users-cogs "></i>الصلاحيات</a>
                            </li>
                            <li>
                                <a href="/admin/teachers/index"><i class="fa fa-chalkboard-teacher "></i>المدرسين </a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </nav>
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
                                        <img src="<?php echo(Session::get('user')['user_image']); ?>"
                                             class="rounded-circle"
                                             width="25px"> <?php echo(Session::get('user')['user_name']) ?>
                                    </a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#"><i class="ion ion-edit"></i> تعديل الملف
                                            الشخصي </a>
                                        <a class="dropdown-item" href="/admin/logout"><i class="ion ion-log-out"></i>
                                            تسجيل
                                            الخروج</a>
                                    </div>
                                </li>

                            </ul>

                        </div>
                    </nav>
                </div>
            </div>

            <!-- End navBar -->




