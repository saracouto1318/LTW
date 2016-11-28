<form action="action_login.php">
  <?=$_SESSION['username']?> <input onClick="toggleSignInMenu()" type="button" value="Login">

<div style="position: relative; width: 0; height: 0">
  <div id="signInMenu" class="dropdown">
      <br>email: <br>
      <input type="text" name="name" class="sign" placeholder="example@gmail.com">
      <br><br>password: <br>
      <input type="password" class="sign" name="name"> <br><br>
      <input type="submit" name="name" value="login" class="submit"><p>
  </div>
  </div>
</form>
