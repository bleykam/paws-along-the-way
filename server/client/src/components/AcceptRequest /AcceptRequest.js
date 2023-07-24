import axios from "axios";
import React from 'react';
import { base_url, config } from "../../utils";

export default function Accept({ request }) {
  const { id } = request;

  function handleAccept() {
    axios.put(`${base_url}/requests/set-driver`,
      { id: id }
      , config)
      .catch((error) => {
        console.log(`Error: ${error}`);
      });
  }
  return (
    <main>
      <button className="new-request__button" onClick={handleAccept}>Accept</button>
    </main>
  );
}
