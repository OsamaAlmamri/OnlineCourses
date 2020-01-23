</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- Brand -->

    <div class="container-fluid">
        <div class="navbar-header">
            <i class></i> <a class="navbar-brand" href="#">
                <img src="/image/download.png" class="rounded-circle" width="25">
                <label class="hrefLabel">Dashboard</label></a>

        </div>
        <!-- Links -->

        <ul class="navbar-nav ml-auto">


            <!-- Dropdown -->
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    <img src="/image/boss.png" class="rounded-circle" width="25"> Admin Name
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#"><i class="ion ion-edit"></i> Edit Profile</a>
                    <a class="dropdown-item" href="/home/logout"><i class="ion ion-log-out"></i> Logout</a>

                </div>
            </li>
        </ul>

</nav>
<div class="sidebar" id="mySidenav">
    <div class="image_back">
        <img src="/image/boss.png" class="rounded-circle" alt="Cinque Terre" width="30">
    </div>
    <div class="link">

        <a href="/admin/index"><i class="fa fa-home iconi"></i> <label class="hrefLabel">Home</label></a>
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">

                    <a data-toggle="collapse" href="#collapse1"><i class="fa fa-users-cog iconi"></i> <label
                                class="hrefLabel">Accounts<i class="fa fa-angle-down "></i></label></a>

                </div>
                <div id="collapse1" class="panel-collapse collapse">
                    <div class="panel-body">
                        <a href="#"><i class="fa fa-user-cog icon"></i> <label class="hrefLabel">Sub Admins</label></a>


                    </div>
                    <div class="panel-footer">
                        <a href="/admin/universities/index"><i class="ion ion-university icon"></i> <label
                                    class="hrefLabel">Universities</label></a>
                        <a href="/admin/teachers/index"><i class="fa fa-chalkboard-teacher icon"></i> <label
                                    class="hrefLabel">Teachers</label></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">

                    <a data-toggle="collapse" href="#collapse2"><i class="fa fa-users-cog iconi"></i> <label
                                class="hrefLabel">Manages<i class="fa fa-angle-down "></i></label></a>

                </div>
                <div id="collapse2" class="panel-collapse collapse">
                    <div class="panel-body">
                        <a href="#"><i class="fa fa-user-cog icon"></i> <label class="hrefLabel">Roles</label></a>
                        <a href="#"><i class="fa fa-user-cog icon"></i> <label class="hrefLabel">Permision</label></a>
                    </div>

                </div>
            </div>
        </div>

        <a href="/admin/courses/index"><i class="fa fa-book-reader iconi"></i> <label class="hrefLabel">Courses</label></a>
        <a href="/admin/categories/index"><i class="fa fa-list iconi"></i> <label
                    class="hrefLabel">Categories</label></a>

    </div>
</div>