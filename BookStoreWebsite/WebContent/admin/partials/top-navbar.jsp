<%--
  Created by IntelliJ IDEA.
  User: weilanyu
  Date: 9/4/20
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- Top Navbar -->
<nav class="navbar navbar-dark navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand mr-5" href="#">Pineapple</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="Navbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/">
                        <span class="fa fa-home fa-lg"></span>Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/" target="_blank">
                        <span class="fa fa-info fa-lg"></span> Bookstore
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <span class="fa fa-list fa-lg"></span> Switch Account
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>