<form action="action_register.php" method="post">
	<!--<?=$_SESSION["name"]?> -->
	<input type="button" id="registerMenu" onClick="toggleSignUpMenu()" class="dropdownAction register" value="Register">

 <div class="relativeMenu register">
 	<div id="signUpMenu" class="dropdown register">

		<p><label for="name" class="sign register">Username</label></p>
 		<input type="text" name="name" pattern="\w{3,15}" title="Username is between [3,15] simple characters A-z 0-9" class="sign register" placeholder="rui2457" required>

 		<p><label for="email" class="sign register">Email</label></p>
 		<input type="email" name="email" class="sign register" placeholder="example@gmail.com" required>

 		<p><label for="password" class="sign register">Password</label></p>
 		<input type="password" class="sign register" name="password" required>

		<input type="radio" name="type" class="userType register" value="Owner" required>
		<input type="radio" name="type" class="userType register" value="Reviewer" required>
		<p><label for="type" class="sign register">Owner Reviewer</label></p>
		<p><label id="registerWarning" class="sign register"></label></p>
		<input type="submit" name="submit" value="Register" class="submit register">
	</div>
</div>
</form>
