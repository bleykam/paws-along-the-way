import "./RideRequestCard.scss";
import { convertTime } from "../../utils";
import Delete from "../Delete/Delete";
import Accept from "../AcceptRequest /AcceptRequest";
import React from 'react';


export default function RideRequest({request}) {
    const userJSON = localStorage.getItem('user');
    const user = JSON.parse(userJSON);
    const { organization, animal, origin, destination, date, time, driver_id,} = request;

    if (!request) {
        return <p>Loading...</p>;
    }

    return (
        <main className="ride-card">
            <h3 className="ride-card__title">{organization}</h3>
            <section className="ride-card__middle">
                <div className="ride-card__animal">
                    <label className="ride-card__label" htmlFor="animal">
                        Animal Info
                    </label>
                    <div id="animal">{animal}</div>
                </div>

                <div className="ride-card__date">
                    <label className="ride-card__label" htmlFor="date">
                        Date
                    </label>
                    <div id="date">{convertTime(date)}</div>
                    <label className="ride-card__label" htmlFor="time">
                        Time
                    </label>
                    <div id="time">{time}</div>
                </div>

                <div className="ride-card__location">
                    <label className="ride-card__label" htmlFor="origin">
                        Pickup:{" "}
                    </label>
                    <div id="origin">{origin}</div>
                    <label className="ride-card__label" htmlFor="destination">
                        DropOff:{" "}
                    </label>
                    <div name="destination">{destination}</div>
                </div>
            </section>

            <div className="ride-card__driver">
                {driver_id && <p>Driver Assigned!{driver_id}</p>}
                <p>{driver_id}</p>
                {!driver_id && (
                     <Accept user={user} request={request}/>
                )}
            
                {user && (
                    <Delete request={request}/>
                )}
            </div>
        </main>
    );
}