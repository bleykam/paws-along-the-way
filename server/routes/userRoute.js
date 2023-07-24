const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");


//GET /api/user/ all users in table.
router.route("/").get(userController.getAll);

// POST /api/user/register add new User
router.route("/register").post(userController.createUser);

//POST /api/user/login - login user
router.route("/login").post(userController.login);

//GET /api/user/current GET current user.
router.route("/current").get(userController.getCurrentUser);

//GET posts created by current user
router.route('/user-requests').get(userController.getUserRequests);


//GET routes assigned to current user
router.route('/driver-requests').get(userController.getDriverRequests);

//Delete user
router.route("/delete-user").delete(userController.deleteUser);

// //PUT edit info in uer profile
// router.route("/edit-user").put(userController.editUser);

router.use((req, res, next) => {
    console.log(
      `userRoutePage: Received a ${req.method} request for ${req.url}, USER:${req.user}, ${req.body.email}`
    );
    next();
  });


module.exports = router;