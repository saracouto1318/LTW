
		<header>
			<ul id="init">
				<?php
					if (isset($_SESSION['username'])) {
						echo '<li>';
							include ('templates/logout.php');
						echo '</li>';
					}

					else {
						echo '<li>';
							include ('templates/login.php');
						echo '</li>';
						echo '<li>';
							include ('templates/register.php');
						echo '</li>';
					}	

				?>
			</ul>

		</header>
