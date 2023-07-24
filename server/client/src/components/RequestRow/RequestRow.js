import "./RequestRow.scss";
import { Link } from "react-router-dom";
import chevronRightIcon from "../../assets/Icons/chevron_right-24px.svg";
import editIcon from "../../assets/Icons/edit-24px.svg";

export default function RequestRow({request}) {
    const{ organization, animal, origin, destination, date, time, driver_id}=request;
  
  return (
    <div className="request-row">
      <div className="request-row__col request-row__col--name">
        <h4 className="request-row__cell-header">ITEM</h4>
        <Link className="request-row__link" to={`/requests/:${request.id}`}>
          {animal}
        </Link>
        <img
          className="request-row__icon"
          src={chevronRightIcon}
          alt="open"
        />
      </div>
      <div className="request-row__col request-row__col--category">
        <h4 className="request-row__cell-header">Organization</h4>
        {organization}
      </div>

      <div className="request-row__col request-row__col--category">
        <h4 className="request-row__cell-header">date</h4>
        {date}
      </div>
      
      <div className="request-row__col request-row__col--category">
        <h4 className="request-row__cell-header">Time</h4>
        {time}
      </div>

      <div className="request-row__col request-row__col--category">
        <h4 className="request-row__cell-header">Origin</h4>
        {origin}
      </div>
      <div className="request-row__col request-row__col--category">
        <h4 className="request-row__cell-header">Destination</h4>
        {destination}
      </div>

      <div className="request-row__col request-row__col--quantity">
        <h4 className="request-row__cell-header">Driver ID</h4>
        <div className="request-row__contact-info">
          <p className="request-row__quantity">{driver_id}</p>
        </div>
      </div>
      <div className=" request-row__col--actions">
       
      
      </div>
    </div>
  );
};
