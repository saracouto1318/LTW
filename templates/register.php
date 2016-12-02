<form action="action_register.php">
  <?=$_SESSION['username']?> <input type="button" id="registerMenu" onClick="toggleSignUpMenu()" class="dropdownAction register" value="Register">

  <div style="position: relative; width: 0; height: 0">
      <div id="signUpMenu" class="dropdown register">
          <br>Email <br>
          <input type="text" name="name" class="sign register" placeholder="example@gmail.com">
          <br><br>Password <br>
          <input type="password" class="sign register" name="name"> <br>
          <div class="userType register">
              <input type="radio" name="type" value="Owner">Owner
              <input type="radio" name="type" value="Reviewer">Reviewer
          </div>
          <input type="submit" name="name" value="Register" class="submit register"><br><p>
      </div>
</div>
</form>
