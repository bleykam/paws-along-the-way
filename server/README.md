# paws-along-the-way

## Description

The Paws Along the Way project aims to connect animal rescue organizations with volunteers who are willing to transport animals. This application will serve as a platform for rescue organizations to post transportation requests, and for volunteers to browse and sign up for these requests based on their availability and location. By facilitating this connection, the application will help rescue organizations efficiently transport animals to their desired destinations, ensuring their safety and well-being.

We connect individuals who are embarking on journeys and have available space in their vehicles with animals in need of transportation. This innovative approach reduces the burden on animal rescues, enabling them to allocate their resources more effectively while ensuring that the animals receive the care they require.

## Tech Stack

The project is built using the following technologies:

   # Server:
        Node.js
        Express.js
        MySQL
        Knex.js
        bcrypt.js
        JSON Web Tokens (JWT)
        Dotenv

   # Client:
        React
        React Router
        Axios
        Google Maps API
        SCSS

## Installation

To run the project locally, follow these steps:

Clone the repository:

git clone https://github.com/bleykam/paws-along-the-way.git

Navigate to the project directory and install the server dependencies:

cd server
npm install

Navigate to the client directory and install the client dependencies:

cd client
npm install

Set up the environment variables:

Rename the .sample.env file in the server directory to .env.
Update the environment variables in the .env file with your configuration.

Start the server: 
navigagte to server directory and run:
npm start

Open your browser and visit http://localhost:5000 to see the application.

Usage

Sign up as a rescue organization or a transporter.
Log in using your credentials.
Create or search for animal transport routes.
Add or claim transport jobs.
Manage and track animal transportation.

## API References

The server has these endpoints:

# GET:
/api/users/ 
returns all users in table.

/api/users/current
returns the current user.

/api/users/user-requests 
returns all transportation requests created by current user.

/api/users/driver-requests 
returns tranportation requests accepted by the current user.

/api/requests 
returns all requests currently in database.

/api/requests/destination/{requestId} 
returns destination request based on request id.

/api/requests/origin/{requestId}
returns origin from request based on request id.

# POST:

/api/users/register 
creates a new user entry in user table

api/users/login 
login previously registered user.

api/requests/new-request 
creates new transporation request in requests table.

# PUT:

/api/requests/set-driver 
set current user as the driver on a transportation request.

/api/requests/remove-driver
removes the driver from a transportation request.
