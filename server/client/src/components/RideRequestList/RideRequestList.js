import "./RideRequestList.scss";
import RideRequestCard from "../RideRequestCard/RideRequestCard";
import { Link } from "react-router-dom";
import React from 'react';

export default function RideRequestList({requestList}) {
  if (!requestList) {
    return <div>.Loading...</div>;
  }

  return (
    <div>
      <h1 className="request-list__title"> REQUESTS</h1>
      <div className="request-list__list">
        {requestList.map((request) => (
          <Link
            className="request-list__link"
            to={"/requests/" + request.id}
            key={request.id}
          >
            <div className="request-list__item" key={request.id}>
              {" "}
              <RideRequestCard request={request} />
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}