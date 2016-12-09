<form action="action_login.php" method="post">
	<!--<?=$_SESSION["name"]?> -->
	<input onClick="toggleSignInMenu()" id="loginMenu" class="dropdownAction login" type="button" value="Login" >
	<div class="relativeMenu login">
		<div id="signInMenu" class="dropdown login">
			  <p>Email</p>
			  <input type="text" name="name" class="sign login" placeholder="example@gmail.com" required>
			  <p>Password</p>
			  <input type="password" class="sign login" name="password" required>
			  <input type="submit" name="submit" value="Login" class="submit login">
		</div>
	</div>
</form>
