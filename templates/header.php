    <header>
		<ul id="init">
            <div class="headerTabRight">
			<?php

				if (isset($_SESSION['email'])) {
					echo '<li>';
						include ('templates/logout.php');
					echo '</li>';
                    echo '<li>';
						include ('templates/profileLink.php');
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
            </div>
            <?php
			include ('templates/tabs.php');
		?>
		</ul>
	</header>
