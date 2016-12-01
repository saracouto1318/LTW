<form action="action_login.php">
  <?=$_SESSION['username']?> <input onClick="toggleSignInMenu()" type="button" value="Login">

<div style="position: relative; width: 0; height: 0">
  <div id="signInMenu" class="dropdown">
      <br>Email <br>
      <input type="text" name="name" class="sign" placeholder="example@gmail.com">
      <br><br>Password <br>
      <input type="password" class="sign" name="name"> <br><br>
      <input type="submit" name="name" value="Login" class="submit"><p>
  </div>
  </div>
</form>
