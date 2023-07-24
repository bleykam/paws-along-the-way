exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('users').del()
    .then(function () {
      // Inserts seed entries
      return knex('users').insert([
        {
            "id": "aed478e2-6fb6-4e27-9e4b-97d082658aae",
            "organization": "Wiegand-Fay",
            "user_name": "gsawbridge0",
            "first_name": "Giorgio",
            "last_name": "Sawbridge",
            "address": "25 Kenwood Way",
            "phone": "(963) 7133933",
            "email": "gsawbridge0@smugmug.com",
            "password": "marble"
          }, {
            "id": "4e389fd2-7432-47fc-b760ed01d2899e43",
            "organization": "Dietrich Group",
            "user_name": "cstonhard1",
            "first_name": "Chickie",
            "last_name": "Stonhard",
            "address": "7702 Shoshone Alley",
            "phone": "(415) 2371927",
            "email": "cstonhard1@dyndns.org",
            "password": "marble"
          }, {
            "id":"4832021d-1bc0-4d5b-89ff-9af65a72d9d8",  
            "organization": "Bruen, Blanda and Kreiger",
            "user_name": "mgussin2",
            "first_name": "Minnie",
            "last_name": "Gussin",
            "address": "985 Parkside Court",
            "phone": "(493) 9110320",
            "email": "mgussin2@dell.com",
            "password": "marble"
          }, {
            "id": "1a0aff12-89a8-422a-9f8c-725f5726d6ef",
            "organization": "Stark and Sons",
            "user_name": "dwherrett3",
            "first_name": "Daryl",
            "last_name": "Wherrett",
            "address": "87 Katie Park",
            "phone": "(117) 3674044",
            "email": "dwherrett3@nbcnews.com",
            "password": "marble"
          }, {
            "id": "37e13b96-6c5a-4d7f-8fcb-c49a383ce211",
            "organization": "Hagenes Inc",
            "user_name": "jmacknish4",
            "first_name": "Jodie",
            "last_name": "Macknish",
            "address": "502 Westridge Road",
            "phone": "(617) 2918018",
            "email": "jmacknish4@paypal.com",
            "password": "marble"
          }, {
            "id":"1c0be7ba-b80b-46a2-940b-fc968ecf27ec",
            "organization": "Cronin, Pfeffer and Rolfson",
            "user_name": "iflarity5",
            "first_name": "Ilyssa",
            "last_name": "Flarity",
            "address": "74 Comanche Pass",
            "phone": "(764) 6643131",
            "email": "iflarity5@uol.com.br",
            "password": "marble"
          }, {
            "id": "32c64173-c0cd-42f4-bb79-7ebe637f1b87",
            "organization": "Russel-Hane",
            "user_name": "vwhetton6",
            "first_name": "Valentijn",
            "last_name": "Whetton",
            "address": "071 North Plaza",
            "phone": "(766) 8893748",
            "email": "vwhetton6@imgur.com",
            "password": "marble"
          }, {
            "id": "8bf02048-08e5-4e39-9182-9f4e37f70356",
            "organization": "Klein-Schneider",
            "user_name": "gmatuszkiewicz7",
            "first_name": "Gherardo",
            "last_name": "Matuszkiewicz",
            "address": "23 Amoth Parkway",
            "phone": "(596) 8052653",
            "email": "gmatuszkiewicz7@nba.com",
            "password": "marble"
          }
      ]);
    });
};