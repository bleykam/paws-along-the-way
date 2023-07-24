import "./Profile.scss";
import { Link } from "react-router-dom";
import React from "react";
import Logout from "../../components/Logout/Logout";
import MyRequestCard from "../../components/MyRequestCard/MyRequestCard";
import ContactInfo from "../../components/ContactInfo/ContactInfo";
import HeaderRow from "../../components/HeaderRow/HeaderRow";

function Profile({ requestList }) {
  const userJSON = localStorage.getItem('user');
  const user = JSON.parse(userJSON);

  
if(user==null) {
  return (
    <main className="profile__logged-out">
    <p className="profile__logged-out-link">
      <Link to="/account">Log in</Link>
    </p>
    <p className="profile__logged-out-message">You must be logged in to see this page.</p>
  </main>
  );
}

  const requests = requestList.filter((request) => request.user_id === user.id);
  const routes = requestList.filter((request) => request.driver_id === user.id);

  return (
    <section className="profile__section">
      <h1 className="profile__heading">Welcome, {user.first_name} {user.last_name}!</h1>
      <h2 className="profile__title">Contact Information</h2>
    <ContactInfo />
 
      <div className="profile__section">
        <h2 className="profile__title">My Request</h2>
        <HeaderRow />
        <div className="profile__request-list">
          {requests &&
            requests.map((request) => (
              <div className="profile__list-item" key={request.id}>
                {" "}
                <MyRequestCard request={request} />
              </div>
            ))}
        </div>
      </div>

      <div className="profile__section">
        <h2 className="profile__title">My Routes</h2>
        <HeaderRow />
        <div className="profile__request-list">
          {routes &&
            routes.map((route) => (
              <div className="profile__list-item" key={route.id}>
                {" "}
                <MyRequestCard request={route} />
              </div>
            ))}
        </div>
      </div>
      {user && 
      <div className="profile__button-block">
             
      <Logout user={user} />

      </div>}
    </section>
  );
}

export default Profile;
