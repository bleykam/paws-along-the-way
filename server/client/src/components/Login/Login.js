import "./Login.scss";
import { useNavigate } from "react-router-dom";
import React, { useState} from 'react';
import {base_url} from '../../utils'
import axios from "axios";


export default function Login() {
    const [error, setError] = useState("");
    const navigate = useNavigate();

    const handleSubmit = (e) => {
        e.preventDefault();

    axios
        .post(`${base_url}/user/login`, {
            email: e.target.email.value,
            password: e.target.password.value,
         })
        .then((response) => {
            const token = response.data.token;
            localStorage.setItem("token",token);
            const userJSON = JSON.stringify(response.data.user);
            localStorage.setItem('user', userJSON);
            navigate("/profile");
        })
        .catch((error) => {
            setError(error);
        });

    }
    return (
       
        <main className="login-page">
            <form className="login" onSubmit={handleSubmit}>
                <h1 className="login__title">Log In</h1>
                <label className="login-page__label" htmlFor="email">
                    Email
                </label>
                <input className="login__input" type="text" name="email" placeholder="Enter your email"/>
                <label className="login-page__label" htmlFor="email">
                    Password
                </label>
                <input className="login__input" type="password" name="password" placeholder="Enter your password" />
                <button className="login__button">Log In</button>
                {error && <div className="login__message">{error}</div>}
            </form>
        </main>
    );
}
