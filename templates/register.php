<form action="action_register.php" method="post">
	<!--<?=$_SESSION["name"]?> -->
	<input type="button" id="registerMenu" onClick="toggleSignUpMenu()" class="dropdownAction register" value="Register">

 <div class="relativeMenu">
 	<div id="signUpMenu" class="dropdown register">
 		<p><label for="name" class="sign register">Email</label></p>
 		<input type="text" name="name" class="sign register" placeholder="example@gmail.com" required>
 		<p><label for="password" class="sign register">Password</label></p>
 		<input type="password" class="sign register" name="password" required>
		<input type="radio" name="type" class="userType register" value="Owner" required>
		<input type="radio" name="type" class="userType register" value="Reviewer" required>
		<p><label for="type" class="sign register">Owner Reviewer</label></p>
		<p></p>
		<input type="submit" name="submit" value="Register" class="submit register">
	</div>
</div>
</form>
