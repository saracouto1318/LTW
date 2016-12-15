<div class="profileTabs" >
    <input class="boxAction newRestaurant" onclick="toggleProfileTabs(this.name)" type="button" name="newRestaurant" value="Add Restaurant">
    <input class="boxAction myRestaurants" onclick="toggleProfileTabs(this.name)" type="button" name="myRestaurants" value="My Restaurants">
    <input class="boxAction myOpinions" onclick="toggleProfileTabs(this.name)" type="button" name="myOpinions" value="My Opinions">
    <input class="boxAction myProfile" onclick="toggleProfileTabs(this.name)" type="button" name="myProfile" value="Edit Profile">
</div>

<div class="profileView">
    <div class="box newRestaurant" id="newRestaurant">
        <form class="formRestaurant" id="submitRestaurant" onsubmit="createRestaurant(event)" method="get">

            <h2>New Restaurant</h2>
            <p>
                <label>Restaurant Name: </label>
                <input type="text" name="name" value="" pattern="[A-Za-z0-9]{, 30}" required>
            </p> <p>
                <label>Road: </label>
                <input type="text" name="road" id="road" value="" required>
            </p> <p>
                <label>City: </label>
                <input type="text" name="city" id="city" value="" required>
                <label>Country: </label>
                <input type="text" name="country" id="country" value="" required>
            </p> <p>
                <label>Price average: </label>
                <input type="number" name="priceAVG" value="" required>
            </p> <p>
                <label>Menu: </label>
                <input type="text" name="menu" value="">
            </p> <p>
                <label>Schedule: </label>
                <input type="text" name="schedule" value="">
            </p> <p>
                <label>Contact: </label>
                <input type="tel"  name="contact" value="">
                <label>Email: </label>
                <input type="email" name="email" value="">
                <input type="hidden" name="lon" id="lon" value="">
                <input type="hidden" name="lat" id="lat" value="">
            </p>

            <p>
                <label id="newRestaurantWarning"></label>
                <input type="submit" name="submit" value="Add New Restaurant">
            </p>
        </form>
    </div>
    <div class="box myRestaurants" id="myRestaurants"></div>

    <div class="box myOpinions" id="myOpinions">
        OOOOOOOOOO
    </div>
    <div class="box myProfile" id="myProfile">
        <form id="editProfile" onsubmit="return changeProfile(event)" method="post">
            <p>
                <label for="userName">New Username: </label>
                <input type="text" name="username" title="3 To 15 letters and/or numbers in one word" pattern="\w{3,15}" placeholder="<?php echo $_SESSION['username'];?>">
            </p> <p>
                <label for="password">New password: </label>
                <input type="password" name="password" value="">
            </p> <p>
                <p>
                    <label id="profileWarning"></label>
                </p>
                <input type="submit" name="submit" value="Update Profile">
            </p>

        </form>
    </div>
</div>

<script type="text/javascript">
    toggleProfileTabs("myRestaurants");
    loadProfile("<?php echo $_SESSION["email"];?>");
    getCoords("espinho, aveiro");
    // loadMap();
</script>
