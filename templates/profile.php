<div class="profileTabs" >
    <input class="boxAction newRestaurant" onclick="toggleInfo(this.name, 2)" type="button" name="newRestaurant" value="Add Restaurant">
    <input class="boxAction myRestaurants" onclick="toggleInfo(this.name, 2)" type="button" name="myRestaurants" value="My Restaurants">
    <input class="boxAction myOpinions" onclick="toggleInfo(this.name, 2)" type="button" name="myOpinions" value="My Opinions">
    <input class="boxAction myProfile" onclick="toggleInfo(this.name, 2)" type="button" name="myProfile" value="Edit Profile">
</div>

<div class="profileView">
    <div class="box newRestaurant" id="newRestaurant">
        <form class="" action="index.html" method="get">
            <p>
                <label for="name">Restaurant Name: </label>
                <input type="text" name="name" value="" pattern="\w{, 30}" required>
            </p> <p>
                <label for="location">Address: </label>
                <input type="text" name="location" value="" required>
            </p> <p>
                <label for="priceAVG">Price average: </label>
                <input type="number" name="priceAVG" value="" required>
            </p> <p>
                <label for="contact">Contact: </label>
                <input type="tel"  name="contact" value="">
                <label for="email">Email: </label>
                <input type="email" name="email" value="">
            </p>

            <p>
                <input type="submit" name="submit" value="Add New Restaurant">
            </p>

            <!-- <div id="mapid"></div> -->
        </form>
    </div>
    <div class="box myRestaurants" id="myRestaurants">
123456789
    </div>
    <div class="box myOpinions" id="myOpinions">
OOOOOOOOOO
    </div>
    <div class="box myProfile" id="myProfile">
        <form id="editProfile" onsubmit="return changeProfile(event)" method="post">
            <p>
                <label for="userName">New Username: </label>
                <input type="text" name="username" pattern="\w{3,15}" placeholder="<?php echo $_SESSION['username'];?>">
            </p> <p>
                <label for="password">New password: </label>
                <input type="password" name="password" value="">
            </p> <p>
                <p><label id="profileWarning"></label></p>
                <input type="submit" name="submit" value="Update Profile">
            </p>

        </form>
    </div>
</div>

<script type="text/javascript">
    toggleInfo("myRestaurants", 2);
    loadProfile("<?php echo $_SESSION["username"]; ?>");
    // loadMap();
</script>
