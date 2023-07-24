const express = require("express");
const router = express.Router();
const requestController = require("../controllers/requestController");
console.log("request page")
//POST /api/requests add new Request to requests table
router.route("/new-request").post(requestController.createRequest);

//GET /api/requests - get all requests from requests table
router.route("/").get(requestController.getAllRequests);

//GET destinaton locations by request id
router.route("/destination/{requestId}").get(requestController.requestById);

//GET origin location by request id.
router.route("/origin/{requestId}").get(requestController.requestOriginById);


//PUT /api/requests -  set driver
router.route("/set-driver").put(requestController.setDriver);

//POST /api/requests/requestId/edit
router.route("/{requestId}/edit").patch(requestController.editRequest);

//Delete request
router.route("/delete-request").delete(requestController.deleteRequest);


router.use((req, res, next) => {
    console.log(
      `RequestsPage: Received a ${req.method} request for ${req.url}, ${res.data}, ${req.body}, USER:${req.user},`);
    next();
  });



module.exports = router;

