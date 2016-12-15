<form class="session" onsubmit="return submitLogin(event)" id="submitLogin" method="post">
	<!--<?=$_SESSION["name"]?> -->
	<input onClick="toggleSignInMenu()" id="loginMenu" class="dropdownAction login" type="button" value="Login" >
	<div class="relativeMenu login">
		<div id="signInMenu" class="dropdown login">
			  <p><label for="email" class="sign login">Email</label></p>
			  <input type="email" name="email" class="sign login" placeholder="example@gmail.com" required>
			  <p><label for="password" class="sign login">Password</label></p>
			  <input type="password" class="sign login" name="password" required>
			  <p><label id="loginWarning" class="sign login"></label></p>
			  <input type="submit" name="submit" value="✓" class="submit login">
		</div>
	</div>
</form>
