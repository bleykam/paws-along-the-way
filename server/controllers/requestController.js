const environment = 'production' || 'development';
const knexConfig = require("../knexfile")[environment];
const knex = require("knex");
const db = knex(knexConfig);
const { v4 } = require("uuid");
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

module.exports.getAllRequests = (req, res) => {
  console.log('requests', req.baseUrl)
  db.select("*").table('requests').orderBy('date', 'asc')
    .then((data) => {
      console.log(data);
      res.status(200).json(data);
    })
    .catch((err) =>
      res.status(400).send(`Error retrieving Requests: ${err}`)
    );
};

module.exports.createRequest = (req, res) => {
  const {animal, animal_image, organization, origin, destination, date, time, description, medical, user_id, email, phone, driver_id, origin_id, destination_id, origin_location, destination_location} =
  req.body;
    
  if (!req.headers.authorization) {
      return res.status(401).send("Please login");
    }

  const authHeader = req.headers.authorization;
  const authToken = authHeader.split(' ')[1];
  // Verify the token
  const decoded = jwt.verify(authToken, process.env.JWT_KEY);

  // Respond with the appropriate user data
  const user = db('users').where({ id: decoded.id }).first();

  if (!animal || !organization || !origin || !destination || !date ||
    !time || !description) {
      return res.status(400).send("Please enter the required fields.");
  }
 
  const id = v4();
 
  const newRequest = {
      id,
      animal,
      animal_image,
      organization,
      origin,
      destination,
      date:formattedDate,
      time,
      description,
      medical,
      user_id,
      driver_id,
      email,
      phone,
      origin_id,
      destination_id,
      origin_location,
      destination_location,
    };
   
    // Insert into requests table
    db.insert(newRequest)
    .into("requests")
    .then((data) => {
      db("requests")
        .where({id})
        .then((data) => res.status(201).send("New Transportation Request Created"));
    })
    .catch((err) =>  res.status(400).send(`Failed to Create Request: ${err}`));

  };


module.exports.setDriver = (req, res) => {
  const {id}=req.body

  if (!req.headers.authorization) {
    return res.status(401).send("Please login");
  }

  const authHeader = req.headers.authorization;
  const authToken = authHeader.split(' ')[1];
  const decoded = jwt.verify(authToken, process.env.JWT_KEY);
  
  db('requests').where({id: id})
  .update({driver_id: decoded.id})
  .then((data) => {
    res.status(200).json(data);
  })
  .catch((err) =>
    res.status(400).send(`Error: ${err}`)
  );  
};

module.exports.removeDriver = (req, res) => {
  const {id}=req.body;
 
  if (!req.headers.authorization) {
    return res.status(401).send("Please login");
  }

  db('requests').where({id: id })
  .update({ driver_id:"" })
  .then((data) => {
    res.status(200).json(data);
  })
  .catch((err) =>
    res.status(400).send(`Error: ${err}`)
  );

};
      
//GET destination location by request id
module.exports.requestById = (req, res) => {

 const id = req.params.id;

  db('requests').where({ id: id }).select('destination_location')
  .then((response) => {
    res.status(200).json(response); 
  })
  .catch((err) =>
    res.status(400).send(`Error retrieving Requests: ${err}`)
  );
};

//GET origin location by request id
module.exports.requestOriginById = (req, res) => {
  const id = req.params.id;

  db('requests').where({ id: id }).select('origin_location')
  .then((response) => {
    res.status(200).json(response); 
  })
  .catch((err) =>
    res.status(400).send(`Error retrieving Requests: ${err}`)
  );
};
//Delete request from requests table
module.exports.deleteRequest = (req, res) => {

  const {id} = req.body;
 
  db('requests').where({ id:id }).select('*')
    .del()
    .then((data) => {
      if (data > 0) {
        res.status(200).send("Successfully Deleted");
      } else res.status(204).send("Record does not exist");
    })
    .catch((err) => res.status(400).send(`Error deleting request: ${err}`));
};

module.exports.editRequest = (req, res) => {
  const {id, animal,organization, origin, destination, date, time, description, medical, user_id, email, phone, driver_id,} =
  req.body;
  console.log(req.body)
  const Id = req.params.id;
  const updatedFields = req.body;
      if (!req.headers.authorization) {
        return res.status(401).send("Please login");
      }
    const authHeader = req.headers.authorization;
    const authToken = authHeader.split(' ')[1];
    // Verify the token
    const decoded = jwt.verify(authToken, process.env.JWT_KEY);
  
    // Respond with the appropriate user data
    const user = db('users').where({ id: decoded.id }).first();
    const editRequest = {
      animal,
      animal_image,
      organization,
      origin,
      destination,
      date,
      time,
      description,
      medical,
      user_id,
      driver_id,
      email,
      phone,
      origin_id,
      destination_id,
      origin_location,
      destination_location,
        };

    if (id === Id) {
      // Update the resource with the provided fields
      resource = { ...editRequest, ...updatedFields };
      // Insert it into requests table
      db('requests').where({ id: Id }).update(resource)
      .then((data) => res.status(201).send("Request Updated"))
      .catch((err) =>  res.status(400).send(`Failed to Create Request: ${err}`));
    };
  };

    