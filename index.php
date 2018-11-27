<?php $title = "Home"; $page = "home";
      include "assets/inc/header.inc.php";
?>
<?php
    session_name("user");
    session_start();
    if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']) {
        if (isset($_GET['logout'])) {
            $projectDB->logout();
          }
        header("Location: ./myProjects.php");
      }
?>

    <main>
        <div id="welcome-info">
            <h1 class="title">CollaboRIT- Home of Team Mongoose!</h1>
            <h3></h3>
            <p>
                Here, you'll be able to find ongoing projects that IST Professors create, lead, and guide collaborating students toward achieving the final product. Projects can be found by going to the <a href="findProject.php">Find Projects</a> page and browsing through the list of current projects. There, you will be able to see the Professor leading the project, their contact information, and some details about the project.
            </p>
            <p>
                If you are a student, you can <a href="login.php">login</a> and have the ability to not only search for these projects, but also contact the professor leading the project to join the group. You will see other students that are already members. Once you are part of a project, you will be able to view all the projects you are affiliated with by going to <a href="myProjects.php">My Projects</a>. You can also view your information by going to<a href="myInfo.php">My Information</a> as well as edit anything that needs to be updated.</p>
            <p>
                Professors manage all of their own projects with the ability to add, edit, and delete anything within the project or the project itself.
            </p>
        </div><!--End of #welcomeInfo -->
        <aside>
            <h3>Research Highlights</h3>
            <img src="assets/media/images/research1.jpg">
            <img src="assets/media/images/research2.jpg">
            <img src="assets/media/images/research3.jpg">
        </aside>
    </main>
    <?php include_once 'assets/inc/footer.php'; ?>
