import { BrowserRouter, Routes, Route, useParams} from "react-router-dom";
import React, { useState, useEffect } from "react";
import axios from "axios";
import NavBar from "./components/NavBar/NavBar";
import Home from "./pages/Home/Home";
import Login from "./components/Login/Login";
import RequestPage from "./pages/RequestPage/RequestPage";
import NewRequest from "./components/NewRequest/NewRequest";
import Profile from "./pages/Profile/Profile";
import "./App.scss";
import EditRequestPage from "./pages/EditRequestPage/EditRequestPage";
import Registration from "./components/Registration/Registration";
import Account from "./pages/Account/Account"
import { base_url } from "./utils";

function App() {
  const [requestList, setRequestList] = useState(null);
  const params = useParams();
  const id = params["requestId"];

  useEffect(() => {
    axios
      .get(`${base_url}/requests`)
      .then((response) => {
        setRequestList(response.data);
      })
      .catch((error) => {
        console.log("Error getting Requests list", `${error}`);
      });
  }, [id]);

  if (!requestList) {
    return (
      <main className="profile">
        <p>Loading...</p>
      </main>
    );
  }

  return (
    <div className="App">
      <BrowserRouter>
        <NavBar />
        <div className="App__body">
          <div className="page-container">
            <Routes>
              <Route path="/" element={<Home requestList={requestList} />} />
              <Route path="/login" element={<Login />} />
              <Route path="/registration" element={<Registration />} />
              <Route path="/account" element={<Account />} />
              <Route path="/requests/:requestId" element={<RequestPage requestList={requestList} />}/>             
              <Route path="/profile" element={<Profile requestList={requestList} />} />
              <Route path="/requests" element={<NewRequest />} />
              <Route path="/requests/:requestId/edit" element={<EditRequestPage requestList={requestList} />} />
            </Routes>
          </div>
        </div>
      </BrowserRouter>
    </div>
  );
}

export default App;
