import "./MyRequestCard.scss";
import { convertTime } from "../../utils";
import Delete from "../Delete/Delete";
import { Link } from "react-router-dom";
import React from "react";

export default function MyRequestCard({ request }) {
    const userJSON = localStorage.getItem('user');
    const user = JSON.parse(userJSON);
    const {animal, origin, destination, date, time, } = request;

    if (!request) {
        return <p>Loading...</p>;
    }

    return (
     
      <main className="myrequest-card">
        <Link className='request-link' to={"/requests/" + request.id}>
        <div className="myrequest-card__item">
          {animal}
        </div>
        <div className="myrequest-card__item">
          {origin}
        </div>
        <div className="myrequest-card__item">
          {destination}
        </div>
        <div className="myrequest-card__item">
          {convertTime(date)}
        </div>
        <div className="myrequest-card__item">
          {time}
        </div>
        <div className="myrequest-card__item">
        {user && (
                    <Delete request={request}/>
                )}
        </div>
     </Link>
            
    </main>
  );
}
