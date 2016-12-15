<form class="session" action="action_register.php" method="post">
	<!--<?=$_SESSION["username"]?> -->
	<input type="button" id="registerMenu" onClick="toggleSignUpMenu()" class="dropdownAction register" value="Register">

 <div class="relativeMenu register">
 	<div id="signUpMenu" class="dropdown register">
		<div id="imgDiv">
                <img id="profilePicture" src="images/noUser.png">
        </div>
		
		<p><label for="name" class="sign register">Username</label></p>
 		<input type="text" name="name" pattern="\w{3,15}" title="Username is between [3,15] simple characters A-z 0-9" class="sign register" placeholder="rui2457" required>

 		<p><label for="email" class="sign register">Email</label></p>
 		<input type="email" name="email" class="sign register" placeholder="example@gmail.com" required>

 		<p><label for="password" class="sign register">Password</label></p>
 		<input type="password" class="sign register" name="password" required>

		
  			<input type="radio" name="type" value="Owner" class="userTyper register" required>
  			<input type="radio" name="type" value="Reviewer" class="userType register" required>
 			<div id="user">
 				<input type="text" name="type" value="Owner">
 				<input type="text" name="type" value="Reviewer">
 			</div>
		
		

		<p><label id="registerWarning" class="sign register"></label></p>
		<p>		</p>
		<input type="submit" name="submit" value="✓" class="submit register">
	</div>
</div>
</form>
