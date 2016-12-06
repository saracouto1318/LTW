<form action="action_register.php">
	<!--<?=$_SESSION['username']?> -->
	<input type="button" id="registerMenu" onClick="toggleSignUpMenu()" class="dropdownAction register" value="Register">

  <div class="relativeMenu">
      <div id="signUpMenu" class="dropdown register">
          <br>Email <br>
          <input type="text" name="name" class="sign register" placeholder="example@gmail.com">
          <br><br>Password <br>
          <input type="password" class="sign register" name="name"> <br>
          <input type="radio" class="userType register" name="type" value="Owner">
          <input type="radio" class="userType register" name="type" value="Reviewer">
		  <p>Owner	Reviewer</p>
		  <br>
          <input type="submit" name="name" value="Register" class="submit register"><br><br>
      </div>
	</div>
</form>
