import { Loader } from "@googlemaps/js-api-loader";
import { format } from "date-fns";
import { useEffect, useRef, useState } from "react";

export  const token = localStorage.getItem("token");
export const apiKey = process.env.REACT_APP_GOOGLE_API_KEY;


export const base_url = process.env.NODE_ENV === 'production' ? process.env.REACT_APP_BASE_URL_PROD
  : process.env.REACT_APP_BASE_URL_DEV ?? "http://localhost:5000/api";

export function convertTime(inputDate) {
  const dateObj = new Date(inputDate);
  const formattedDate = dateObj.toLocaleDateString("en-US", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  });
  
  return formattedDate
  };
  

export function handleKeyPress(event){
  if (event.key === 'Enter') {
    event.preventDefault();
  }
};

export const loader = new Loader({
  apiKey: apiKey,
  version: "weekly",
  libraries: ["places", "maps", "geocoding", "marker", "routes", "drawing"],
  componentRestrictions: { country: ["us", "ca"] },
  fields: ["address_components", "geometry"],
});

export function formatDate(dateString){
  const date = new Date(dateString);
  return format(date, "yyyy-MM-dd");
};


export const useAutocomplete = () => {
  const inputRef = useRef("");
  const [value, setValue] = useState("");
  const [location, setLocation] = useState("");
  const [placeId, setPlaceId] = useState("");

  useEffect(() => {
    loader.load().then(() => {
      const autocomplete = new window.google.maps.places.Autocomplete(inputRef.current);

      autocomplete.addListener("place_changed", () => {
      const place = autocomplete.getPlace();
      setValue(place.formatted_address);
      setPlaceId(place.place_id);
      setLocation(JSON.stringify(place.geometry.location));
    });
  });
  }, [inputRef]);

  return { inputRef, value, setValue, location, placeId };
};

export  const config = {
  headers: {
      Authorization: `Bearer ${token}`,
  },
};

