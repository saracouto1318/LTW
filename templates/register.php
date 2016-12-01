<form action="action_register.php">
  <?=$_SESSION['username']?> <input type="button" onClick="toggleSignUpMenu()" value="Register">

  <div style="position: relative; width: 0; height: 0">
      <div id="signUpMenu" class="dropdown">
          <br>Email <br>
          <input type="text" name="name" class="sign" placeholder="example@gmail.com">
          <br><br>Password <br>
          <input type="password" class="sign" name="name"> <br>
          <div class="userType">
              <input type="radio" name="type" value="Owner">Owner
              <input type="radio" name="type" value="Reviewer">Reviewer
          </div>
          <input type="submit" name="name" value="Register" class="submit"><br><p>
      </div>
</div>
</form>
