<form action="action_login.php">
	<?=$_SESSION['username']?> 
	<input onClick="toggleSignInMenu()" id="loginMenu" class="dropdownAction login" type="button" value="Login" >
	<div class="relativeMenu">
		<div id="signInMenu" class="dropdown">
			  <p>Email</p>
			  <input type="text" name="name" class="sign login" placeholder="example@gmail.com">
			  <p>Password</p>
			  <input type="password" class="sign login" name="name">
			  <input type="submit" name="name" value="Login" class="submit login">
		</div>
	</div>
</form>
