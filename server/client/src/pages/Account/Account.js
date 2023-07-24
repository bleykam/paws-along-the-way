import "./Account.scss";
import Logout from "../../components/Logout/Logout";
import React from "react";
import {Link} from "react-router-dom"

export default function UserLogin() {
    const userJSON = localStorage.getItem('user');
    const user = JSON.parse(userJSON);
    return (
        <main className="user-login">
           
            {!user && 
            <section className="user-login__forms">
                <div className="user-login__login">
                <div className="user-login__prompt">Have an Account?</div> 
               <div ><Link  to="/login">Login</Link></div> 
                </div>

                <div className="user-login__login">
                <p className="user-login__prompt"> Need an Account?</p>  <Link className="user-login__link" to="/registration">Register</Link>
                </div>
            </section>
        }
         {user &&  <Logout />}
         
        
        </main>
    );
}
