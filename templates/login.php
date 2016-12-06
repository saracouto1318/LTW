<form action="action_login.php">
  <?=$_SESSION['username']?> <input onClick="toggleSignInMenu()" id="loginMenu" class="dropdownAction login" type="button" value="Login">

<div class="shadow">
  <div id="signInMenu" class="dropdown login">
      <br>Email <br>
      <input type="text" name="name" class="sign login" placeholder="example@gmail.com">
      <br><br>Password <br>
      <input type="password" class="sign login" name="name"> <br><br>
      <input type="submit" name="name" value="Login" class="submit login"><p>
  </div>
  </div>
</form>
