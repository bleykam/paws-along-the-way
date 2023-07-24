import { useNavigate } from "react-router-dom";
import React from "react";

export default function Logout() {
  const navigate = useNavigate();

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    navigate("/");
  };

  return (
    <main>
      <button className="profile__logout" onClick={handleLogout}>
        Log out
      </button>
    </main>
  );
}
