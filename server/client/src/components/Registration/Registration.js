// Import necessary modules and components
import "./Registration.scss";
import React, { useState, useRef, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { base_url, loader } from "../../utils";



export default function Registration() {
    console.log(process.env.NODE_ENV, base_url)

    // Initialize state variables
    const addressRef = useRef("");
    const [address, setAddress] = useState("");
    const [placeId, setPlaceId] = useState("");
    const [coordinates, setCoordinates] = useState("");
    const navigate = useNavigate();
    const [values, setValues] = useState({
        organization: "",
        firstName: "",
        lastName: "",
        userName: "",
        address: "",
        coordinates: "",
        phone: "",
        email: "",
        password: "",
        confirmPassword: "",
        place_id: "",
    });
    const [error, setError] = useState("");
    const [success, setSuccess] = useState(false);

    // Handle input field changes
    const handleChange = (event) => {
        const { name, value } = event.target;
        setValues({ ...values, [name]: value });
    };

    // Handle form submission
    const handleSubmit = (event) => {
        event.preventDefault();

        // Validate required fields
        if (
            !values.firstName ||
            !values.lastName ||
            !values.email ||
            !values.userName ||
            !values.password ||
            !values.confirmPassword
        ) {
            alert("Missing required fields.");
            return;
        }

        // Validate password match
        if (values.password !== values.confirmPassword) {
            alert("Passwords must match.");
            return;
        }

        // Create user object
        let newUser = {
            organization: values.organization,
            first_name: values.firstName,
            last_name: values.lastName,
            user_name: values.userName,
            address: address,
            phone: values.phone,
            email: values.email,
            password: values.password,
            place_id: placeId,
            coordinates: coordinates,
        };

        // Send POST request to register user
        axios
            .post(`${base_url}/user/register`, newUser)
            .then(() => {
                setSuccess(true);
                setError("");
                event.target.reset();
            })
            .catch((error) => {
                setSuccess(false);
                setError("Try Again");
            });

        // Reset form values
        for (let key in newUser) {
            newUser[key] = "";
        }

    

    };

    // Handle cancel button click
    const handleCancel = () => {
        navigate(-1);
    };

    // Initialize Google Maps Places Autocomplete
    useEffect(() => {
     
        loader.load().then(() => {
            const autocomplete = new window.google.maps.places.Autocomplete(
                addressRef.current
            );
            autocomplete.addListener("place_changed", () => {
                const place = autocomplete.getPlace();
                setPlaceId(place.place_id);
                setAddress(place.formatted_address);
                setCoordinates(place.geometry.location);
            });
        });
    }, []);

    // Render the registration form
    return (
        <main className="signup-page">
            <form className="signup" onSubmit={handleSubmit}>
            <h1 className="signup__title">Create Account</h1>
                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="organization">
                        Organization
                    </label>
                    <input className="signup-page__input" type="text" name="organization" id="organization" required={true} value={values.organization} onChange={handleChange} />
                </div>
                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="firstName">
                        First Name
                    </label>
                    <input className="signup-page__input" type="text" name="firstName" id="firstName" required={true} onChange={handleChange} />
                </div>

                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="lastName">
                        Last Name
                    </label>
                    <input className="signup-page__input" name="lastName" required={true} id="lastName" value={values.lastName} onChange={handleChange} />
                </div>

                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="email">
                        Email
                    </label>
                    <input className="signup-page__input" type="email" name="email" required={true} id="email" value={values.email} onChange={handleChange}/>
                </div>
                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="userName">
                        User Name
                    </label>
                    <input className="signup-page__input" type="text" name="userName" id="userName" value={values.userName} onChange={handleChange} />
                </div>

                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="address">
                        Address
                    </label>
                    <input className="signup-page__input" type="text" name="address" id="address" ref={addressRef} />
                </div>

                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="phone">
                        Phone
                    </label>
                    <input className="signup-page__input" type="tel" name="phone" id="phone" value={values.phone} onChange={handleChange}/>
                </div>

                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="password">
                        Password
                    </label>
                    <input className="signup-page__input" type="password" name="password" id="password" value={values.password} onChange={handleChange}/>
                </div>

                <div className="signup-page__div">
                    <label className="signup-page__label" htmlFor="password">
                        Confirm Password
                    </label>
                    <input className="signup-page__input" type="password" name="confirmPassword" id="confrmPassword" value={values.confirmPassword} onChange={handleChange}/>
                </div>

                <div>
                    {/* Cancel button */}
                    <button className="signup__button" type="secondary" onClick={handleCancel}>Cancel</button>
                    {/* Submit button */}
                    <button className="signup__button" type="submit" onClick={handleSubmit}>Submit</button>
                </div>

                {/* Success and error messages */}
                {success && <div className="signup__message">Signed up!</div>}
                {error && <div className="signup__message">{error}</div>}
            </form>
        </main>
    );
}
