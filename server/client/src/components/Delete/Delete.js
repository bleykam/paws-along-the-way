import './Delete.scss'
import axios from "axios";
import {base_url} from '../../utils'
import React from 'react';

export default function Delete({request}) {
  const { id } = request;
  const data = id ;

  function handleDelete() {
    alert("confirm delete");
   
    axios
      .delete(`${base_url}/requests/delete-request`, data)
      .then((res) => {
        alert("Requests successfully deleted!");
        window.location.reload();
      })
      .catch((error) => {
        console.log(`Error: ${error}`);
      });
  }

  return (
    <main>
      <button className ="delete-button" onClick={handleDelete}>Delete</button>
    </main>
  );
}


export function DeleteUser({user}) {
  const data = user.id; 

  alert("confirm delete");
  axios
    .delete(`${base_url}/requests/delete-user`, data)
    .then((res) => {
      alert("User successfully deleted!");
    })
    .catch((error) => {
      console.log(`Error: ${error}`);
    });

    return (
      <main>
        <button className ="delete-button" onClick={DeleteUser}>Delete User</button>
      </main>
    );
}
  
