<form action="action_register.php">
	<?=$_SESSION['username']?> 
	<input type="button" id="registerMenu" onClick="toggleSignUpMenu()" class="dropdownAction register" value="Register">

	<div class="relativeMenu">
		<div id="signUpMenu" class="dropdown register">
			<p>Email </p>
			<input type="text" name="name" class="sign register" placeholder="example@gmail.com">
			<p>Password </p>
			<input type="password" class="sign register" name="name">
			<div class="userType register">
				<input type="radio" name="type" value="Owner">
				<input type="radio" name="type" value="Reviewer">
				<div id="user">
					<input type="text" name="type" value="Owner">
					<input type="text" name="type" value="Reviewer">
				</div>
			</div>
			<input type="submit" name="name" value="Register" class="submit register">
		</div>
	</div>
</form>
