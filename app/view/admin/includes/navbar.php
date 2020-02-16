</head>
<body>
<div class="wrapper">
<div class="container-fluid">
    <div class="row">
        <!--  Start Sidebar  -->
        <div class="col-2 p-0 ">
            <nav id="sidebar" class="">
                <div class="sidebar-header">
                    <img src="/images/logo.png" class="col-md-12">

                </div>

                <div class="userImage text-center">
                    <img src="<?php

                    use auth\Permissions;

                    echo(Session::get('user')['user_image']) ?>" class="rounded-circle" width="30">
                </div>
                <ul class="list-unstyled components">
                    <?php if (Permissions::getInstaince()->hasPermision('admin_index') == true) { ?>
                        <li class="active">
                            <a href="/admin/index">
                                <i class="fas fa-home a2"></i>
                              <label class="text">  الصفحة الرئيسية</label>
                            </a>
                        </li>
                    <?php } ?>

                    <?php if (Permissions::getInstaince()->hasPermision('category_index') == true) { ?>
                        <li>
                            <a href="/admin/categories/index">
                                <i class="fas fa-list"></i>
                                <label class="text">   الاقسام</label>

                            </a>
                        </li>
                    <?php } ?>
                    <?php if (Permissions::getInstaince()->hasPermision('course_index') == true) { ?>
                        <li>
                            <a href="/admin/courses/index">
                                <i class="fas fa-book"></i>
                                <label class="text">   الكورسات</label>
                            </a>
                        </li>
                    <?php } ?>
                    <?php if (Permissions::getInstaince()->hasPermision('university_index') == true
                        or Permissions::getInstaince()->hasPermision('teacher_index') == true

                    ) { ?>

                        <li  id="accordionExample">
                            <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">
                                <i class="fa fa-users-cog "></i>
                                <label class="text">   الحسابات</label>
                                <i class="ion ion-chevron-down mt-10" style="float:left"></i>
                            </a>
                            <ul class="collapse show list-unstyled" id="pageSubmenu" aria-labelledby="headingOne" data-parent="#accordionExample">


                                <li>
                                    <a href="#"><i class="fa fa-users-cog "></i>
                                        <label class="text">   المدراء الفرعين</label>                                    </a>
                                </li>
                                <?php if (Permissions::getInstaince()->hasPermision('university_index') == true) { ?>
                                    <li>
                                        <a href="/admin/universities/index"><i class="ion ion-university  "></i>       <label class="text">   الجامعات</label>
                                        </a>
                                    </li>
                                <?php } ?>
                                <?php if (Permissions::getInstaince()->hasPermision('teacher_index') == true) { ?>

                                    <li>
                                        <a href="/admin/teachers/index"><i class="fa fa-chalkboard-teacher "></i>  <label class="text">   المدرسين</label>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                    <?php } ?>
                    <?php if (Permissions::getInstaince()->hasPermision('teacher_index') == true
                        or Permissions::getInstaince()->hasPermision('permission_index') == true
                        or Permissions::getInstaince()->hasPermision('role_index') == true
                    ) { ?>
                        <li  id="accordionExampleOne">
                            <a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false"
                               >
                                <i class="fa fa-cogs "></i>
                                <label class="text">
                                    الادراة
                                    </label>
                                <i class="ion ion-chevron-down mt-10" style="float:left"></i>
                            </a>
                            <ul class="collapse show list-unstyled" id="pageSubmenu2" aria-labelledby="headingOne" >
                                <?php if (Permissions::getInstaince()->hasPermision('role_index') == true) { ?>
                                    <li>
                                        <a href="/admin/role/index"><i class="fa fa-users-cog "></i>  <label class="text">   الادوار</label>

                                        </a>
                                    </li>
                                <?php } ?>
                                <?php if (Permissions::getInstaince()->hasPermision('permission_index') == true) { ?>

                                    <li>
                                        <a href="/admin/permision/index"><i class="fa fa-cogs "></i>    <label class="text">   الصلاحيات</label></a>
                                    </li>
                                <?php } ?>
                                <?php if (Permissions::getInstaince()->hasPermision('teacher_index') == true) { ?>
                                    <li>
                                        <a href="/admin/teachers/index"><i class="fa fa-chalkboard-teacher "></i>    <label class="text">   المدرسين</label>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                    <?php } ?>

                </ul>
            </nav>
        </div>
        <!--  End Sidebar   -->

        <!-- Start Content -->
        <div class="col-10 p-0" >

            <!-- Start navBar -->
            <div class="row-cols-1 mb-4">
                <div class="mynav">
                    <nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
                        <!-- Brand -->
                        <div class="col-6 text-right">

                      <a class="text-white" href="#" id="tog"><span class="fas fa-list"></span></a>
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

                                        <?php echo (Session::get('user')['user_name']) ?>
                                        <img src="<?php echo (Session::get('user')['user_image']); ?>"
                                             class="rounded-circle"
                                             width="25px">
                                    </a>

                                    <div class="dropdown-menu">
                                        <a href="/admin/profile/index" class="dropdown-item" ><i class="ion ion-edit"></i> تعديل الملف
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
