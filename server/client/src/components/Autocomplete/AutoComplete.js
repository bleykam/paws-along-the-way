import "./AutoComplete.scss";
import React, {useEffect } from 'react';
import { handleKeyPress, loader as externalLoader} from "../../utils";

export default function AutoComplete({ label, onPlaceSelected, className, defaultValue, ref}) {
  const userJSON = localStorage.getItem('user');
  const user = JSON.parse(userJSON);
  const autoRef = useRef("");

  const handleChange = (event) => {
    if (!event) {
      return;
    }
  };

  useEffect(() => {
    externalLoader.load().then(() => {
      const input = autoRef.current;
      const autocomplete = new google.maps.places.Autocomplete(input, {
        fields: ["place_id", "geometry", "formatted_address", "name"],
      });

      autocomplete.addListener("place_changed", () => {
        const place = autocomplete.getPlace();
        // Call the callback function with the selected place information
        onPlaceSelected(place);
      });
    });
  }, []);

  return (
    <main>
        <div className="new-request__div">
          <label className="new-request__label" htmlFor="origin">
            {label}
          </label>
          <input
          onKeyDown={handleKeyPress}
            className={className}
            name="orgin"
            required={true}
            id="origin"
            defaultValue={defaultValue} 
            ref={ref}
            placeholder="Enter City and State"
            onChange={handleChange}
          />
        </div>
    </main>
  );
}
