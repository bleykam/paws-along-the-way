import "./HeaderRow.scss";
import sortIcon from "../../assets/Icons/sort-24px.svg";


export default function HeaderRow() {

  return (
    <thead className="request-header">
      
      <div className="request-header__item">
          ANIMAL
          <img src={sortIcon} alt='sort icon'></img>
        </div>
        <div className="request-header__item">
          PICKUP
          <img src={sortIcon} alt='sort icon'></img>
        </div>
        <div className="request-header__item">
          DROP-OFF
          <img src={sortIcon} alt='sort icon'></img>
        </div>
        <div className="request-header__item">
          DATE
          <img src={sortIcon} alt='sort icon'></img>
        </div>
        <div className="request-header__item">
          TIME 
          <img src={sortIcon} alt='sort icon'></img>
        </div>
        <div className="request-header__item">
          Delete
        </div>
      </thead>

      )
}