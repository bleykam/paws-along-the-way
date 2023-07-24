const environment = 'production' || 'development';
const knexConfig = require("../knexfile")[environment];
const knex = require("knex");
const db = knex(knexConfig);
const { v4 } = require("uuid");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
require("dotenv").config();

//GET returns all users currently in database
module.exports.getAll = (_req, res) => {
  db.select("*")
    .table("users")
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((err) => res.status(400).send(`Error retrieving Requests: ${err}`));
};

//POST request adds new user to the database
module.exports.createUser = (req, res) => {

  const { first_name, last_name, user_name, address, phone, email, password, place_id, coordinates } = req.body;
  
  if (!first_name || !last_name || !email || !password || !user_name) {
    return res.status(400).send("Please enter the required fields.");
  }

  const hashedPassword = bcrypt.hashSync(password);
  const id = v4();
  // Create the new user
  const newUser = {
    id,
    first_name,
    last_name,
    user_name,
    address,
    phone,
    email,
    password: hashedPassword,
    place_id,
    coordinates,
  };

  // Insert it into our database
  db.insert(newUser)
    .into("users")
    .then((data) => {
      db("users")
        .where({ id })
        .then((data) => res.status(201).send("Registered successfully"));
    })
    .catch((err) => res.status(400).send(`Failed registration: ${err}`));
};

// POST request to set current user
module.exports.login = (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).send("Please enter the required fields");
  }

  db("users")
    .where({ email: email })
    .orWhere({ user_name: email })
    .first()
    .then((user) => {
      const isPasswordCorrect = bcrypt.compareSync(password, user.password);
      if (!isPasswordCorrect) {
        return res.status(400).send("Invalid password");
      }

      const token = jwt.sign(
        { id: user.id, email: user.email },
        process.env.JWT_KEY,
        { expiresIn: "24h" }
      );

      res.json({ token, user});
    })
    .catch((err) => res.status(400).send(`Failed login: ${err}`));
};

// Gets returns information on the current user.
module.exports.getCurrentUser = async (req, res) => {
  try {
    // If there is no auth header provided
    if (req.headers.authorization == null) {
      return res.status(401).send("Please login");
    }

    const authHeader = req.headers.authorization;
    const authToken = authHeader.split(" ")[1];
    if (authToken === null) {
      return res.status(401).send("Please login");
    }
    const decoded = jwt.verify(authToken, process.env.JWT_KEY);
    const user = await db("users").where({ id: decoded.id }).first();

    if (!user) {
      return res.status(401).send("Invalid auth token");
    }

    delete user.password;
    res.json(user);
  } catch (err) {
    res.status(401).send("Invalid auth token");
  }
};

//GET returns requests created by the current user
module.exports.getUserRequests = (req, res) => {
  if (!req.headers.authorization) {
    return res.status(401).send("Please login");
  }

  const authHeader = req.headers.authorization;
  const authToken = authHeader.split(" ")[1];
  const decoded = jwt.verify(authToken, process.env.JWT_KEY);

  db("requests")
    .where({ user_id: decoded.id })
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((err) => res.status(400).send(`Error retrieving Requests: ${err}`));
};

//GET returns all requests assigned to the current user
module.exports.getDriverRequests = (req, res) => {
  if (!req.headers.authorization) {
    return res.status(401).send("Please login");
  }

  const authHeader = req.headers.authorization;
  const authToken = authHeader.split(" ")[1];
  const decoded = jwt.verify(authToken, process.env.JWT_KEY);

  db("requests")
    .where({ driver_id: decoded.id })
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((err) => res.status(400).send(`Error retrieving Requests: ${err}`));
};

//reset user password
module.exports.resetPassword = (req, res) => {
  const { email, password } = req.body;
  const hashedPassword = bcrypt.hashSync(password);

  db("users")
    .where({ email: email })
    .first()
    .update({ password: hashedPassword })
    .then((data) => {
      res.status(201).send("Changed successfully");
    })
    .catch((err) => res.status(400).send(`Failed: ${err}`));
};

//Delete request from requests table
module.exports.deleteUser = (req, res) => {
  const { id } = req.body;

  db("users")
    .where({ id: id })
    .select("*")
    .del()
    .then((data) => {
      if (data > 0) {
        res.status(200).json(response);
      } else res.status(204).send("Successfully Deleted");
    })
    .catch((err) => res.status(400).send(`Error deleting user: ${err}`));
};
