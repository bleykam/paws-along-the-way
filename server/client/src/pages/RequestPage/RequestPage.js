import "./RequestPage.scss";
import { useParams, useNavigate } from "react-router-dom";
import React, { useEffect, useRef } from "react";
import { base_url, convertTime, loader} from "../../utils";
import Accept from "../../components/AcceptRequest /AcceptRequest";
import ContactInfo from "../../components/ContactInfo/ContactInfo";

export default function RequestPage({ requestList }) {
  const userJSON = localStorage.getItem('user');
  const user = JSON.parse(userJSON);
  const mapRef = useRef("");
  const navigate = useNavigate();
  const { requestId } = useParams();

  const request = requestList.find((item) => item.id === requestId);
  
  const {animal, date, time, description, medical, origin, destination_location, origin_location, destination, driver_id} = request;

  useEffect(() => {
  
    loader.load().then(() => {
      let map;
      const directionsService = new window.google.maps.DirectionsService();
      const directionsRenderer = new window.google.maps.DirectionsRenderer({
        draggable: true,
        map,
      });
      new window.google.maps.Marker();
      map = new window.google.maps.Map(mapRef.current, {
        zoom: 4.5,
        center: { lat: 40.72, lng: -103.96 },
      });

      directionsRenderer.setMap(map);

      let start = JSON.parse(origin_location);
      let end = JSON.parse(destination_location);
      let request = {
        origin: start,
        destination: end,
        travelMode: "DRIVING",
      };
      directionsService.route(request, function (result, status) {
        if (status === "OK") {
          directionsRenderer.setDirections(result);
        }
      });
    });
  }, [origin_location, destination_location]);


  function handleEdit() {
    if(user.organization === request.organization){
    navigate(`/requests/${requestId}/edit`);
    }else
    {
      alert("You do not have persmission to edit");
    }
  }

  const handleBack= () => {
    navigate(-1);
    console.log("requestpage");
  };


  return (
    <main className="request-page">
      <div id="map" style={{ height: "500px" }} ref={mapRef}></div>
      <div id="total"></div>

      <h2 className="request-page__title">Ride Request</h2>

      <div className="request-page__div">
        <h3 className="request-page__title">Animal Info</h3>
        <span id="animal" className="request-page__info">
          {animal}
        </span>
      </div>
      <div className="request-page__div">
        <h3 className="request-page__title">Pick-Up Location</h3>
        <span className="request-page__info">{origin}</span>
      </div>
      <div className="request-page__div">
        <h3 className="request-page__title">Drop-off Location</h3>
        <span>{destination}</span>
      </div>
      <div className="request-page__div">
        <h3 className="request-page__title">Date / Time</h3>
        <span>{`${convertTime(date)}  / ${time}`}</span>
      </div>

      <div className="request-page__div">
        <h3 className="request-page__title">Description</h3>
        <span>{description}</span>
      
        <div className="request-page__div">Medical: {medical}</div>
      </div>

      <ContactInfo />

      <div className="ride-card__driver">
        {driver_id && <p>Driver Assigned!</p>}
        {!driver_id && <Accept request={request} user={user}/>}
        {user.id && (<button className="new-request__button" onClick={handleEdit}>Edit</button>)}
        <button className="new-request__button" type="secondary" onClick={handleBack}>Back</button>
      </div>
    </main>
  );
}
