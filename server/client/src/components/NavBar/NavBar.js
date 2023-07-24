import "./NavBar.scss";
import { NavLink } from "react-router-dom";
import head from "../../assets/profile-circle-svgrepo-com.svg";
import React from 'react';

export default function NavBar() {

  return (
    <header className="header">
      <div className="header__home">
        <NavLink className="header__homelink" to="/">
     
          Paws Along The Way
     
        </NavLink>
      </div>
      <div className="header__right">
        <div className="header__request">
          <NavLink to="/requests" className="header__request-link">
            New Request
          </NavLink>
        </div>
        <div className="header__account">
          <div className="header__profile">
            {" "}
            <NavLink to="/profile">
              <img className="header__icon" src={head} alt="profile icon"></img>
            </NavLink>
          </div>
          <NavLink to="/account" className="header-profile">
              <button>Account</button>
          </NavLink>
        </div>
      </div>
    </header>
  );
}
