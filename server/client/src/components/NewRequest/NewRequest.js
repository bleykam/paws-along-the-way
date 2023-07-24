import "./NewRequest.scss";
import React, { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import axios from "axios";
import { handleKeyPress, base_url, useAutocomplete, formatDate, config, convertTime } from "../../utils";

export default function NewRequest({initialData, isEditing}) {
    const userJSON = localStorage.getItem('user');
    const user = JSON.parse(userJSON);
    const formattedDate =formatDate(initialData.date);
       
    
    const originAutocomplete = useAutocomplete();
    const destinationAutocomplete = useAutocomplete();
    const navigate = useNavigate();
    const [values, setValues] = useState({
      animal: "",
      animal_image: "",
      date: formattedDate || "",
      time: "",
      description: "",
      medical: "",
    });

    const handleSubmit = (event) => {
        event.preventDefault();

        let formattedDate = formatDate(values.date);

        let newRequest = {
            animal: values.animal,
            animal_image: values.animal_image,
            organization: user.organization,
            origin: originAutocomplete.inputRef.current.value,
            destination: destinationAutocomplete.inputRef.current.value,
            date: formattedDate,
            time: values.time,
            origin_location: originAutocomplete.location,
            destination_location: destinationAutocomplete.location,
            description: values.description,
            medical: values.medical,
            phone: user.phone,
            email: user.email,
            user_id: user.id,
            origin_id: originAutocomplete.placeId,
            destination_id: destinationAutocomplete.placeId,
        };
        
        if(!isEditing){
            
        const fields = [
            { name: 'Organization', value: user.organization },
            { name: 'Animal Info', value: values.animal },
            { name: 'Pickup Location', value: originAutocomplete.inputRef.current.value },
            { name: 'Drop-Off Location', value: destinationAutocomplete.inputRef.current.value },
            { name: 'Date', value: formattedDate},
            { name: 'Time', value: values.time }
          ];
          
          fields.forEach(field => {
            if (!field.value) {
                alert(`Missing required Fields. ${field.name} is blank `)
            }
            });
       
    axios
    .post(`${base_url}/requests/new-request`, newRequest, config)
    .then(() => {
        originAutocomplete.inputRef="";
        destinationAutocomplete.inputRef.current="";
        setValues({ values: ""});
        navigate("/profile")
        })
        .catch((error) => {
            console.log(error);
        });
    }   

    if (isEditing) {
        const editReq={};

        for (const field in newRequest) {
            if (newRequest[field] !== initialData[field] && newRequest[field] !== "" ) {
            editReq[field] = newRequest[field];
          }
        }
        
        axios
        .patch(`${base_url}/requests/${initialData.id}/edit`, editReq, config)
        .then(() => {
            navigate("/requests/:requestId");
            })
        .catch((error) => {
            console.log(error);
        });           
        }
    };

    const handleChange = (event) => {
        if (!event) {
            return;
        }
        const { name, value } = event.target;
        setValues({ ...values, [name]: value });
    };

    const handleCancel = () => {
        if(!isEditing){
            navigate('/');
        }else{
            navigate(`/requests/${initialData.id}`);
        }
      
    };

    if(user===null){
        <p>Loading....</p>
    }

    return (
        <main>
        
        {user &&
        
        <form id="form" className="new-request" onKeyDown={handleKeyPress} >
            {!isEditing &&
          
            <>
             <h2 className="new-request__title">New Request - {user.organization}</h2>
    
            <div className="new-request__div">
                <label className="new-request__label" htmlFor="origin">Pickup Location:{" "}</label>
               <input className="new-request__input" name="orgin" required={true} id="origin" placeholder="Enter City and State" ref={originAutocomplete.inputRef} onChange={handleChange} ></input> 
            </div>

            <div className="new-request__div">
                <label className="new-request__label" htmlFor="destination"> Drop-off Location:{" "}</label>
                <input className="new-request__input" name="destination" required={true} id="destination" placeholder="Enter City and State" ref={destinationAutocomplete.inputRef} onChange={handleChange} ></input> 
            </div>
            </>
            }



        {isEditing &&
            <>
              <h2 className="new-request__title">Edit Request - {user.organization}</h2>
            <div className="new-request__div">
                <label className="new-request__label" htmlFor="origin">Pickup Location:{" "}</label>
               <input className="new-request__input" name="orgin" required={true} id="origin" placeholder="Enter City and State" ref={originAutocomplete.inputRef} onChange={handleChange} defaultValue={initialData?.origin || ""}></input> 
            </div>

            <div className="new-request__div">
                <label className="new-request__label" htmlFor="destination"> Drop-off Location:{" "}</label>
                <input className="new-request__input" name="destination" required={true} id="destination" placeholder="Enter City and State" ref={destinationAutocomplete.inputRef} onChange={handleChange} defaultValue={initialData?.destination || ""} ></input> 
            </div>
            <div className="new-request__div">
                <label className="new-request__label" htmlFor="driver"> Driver-ID:{" "}</label>
                <input className="new-request__input" name="driver" id="driver" defaultValue={initialData?.driver_id || ""} onChange={handleChange} ></input> 
            </div>

            </>
            }

            <div className="new-request__div">
                <label className="new-request__label" htmlFor="animal">Animal Info:{" "}</label>
                <input className="new-request__input" type="text" name="animal" id="animal" required={true} placeholder="Enter type of Animal/Name" defaultValue={initialData?.animal || ""} onChange={handleChange} />
            </div>

            <div className="new-request__div">
                <label className="new-request__label" htmlFor="animal_image">
                    Animal Image:{" "}
                </label>
                <input className="new-request__input" type="text" name="animal_image" id="animal_image" placeholder="Enter path to photo" defaultValue={initialData?.animal_image || ""} onChange={handleChange} />
            </div>

            <div className="new-request__div">
                <label className="new-request__label" htmlFor="date">Pickup Date:{" "}</label>
                <input className="new-request__input" type="text" name="date" id="date" required={true} placeholder="Enter City and State" defaultValue={convertTime(initialData?.date)|| ""} onChange={handleChange} />
            </div>
            <div className="new-request__div">
                <label className="new-request__label" htmlFor="time">Choose a Time:</label>
                <select name="time" id="time" defaultValue = {initialData?.time || ""} onChange={handleChange} className="new-request__input" >
                    <option value="Select">Select Time</option>
                    <option value="morning">Morning</option>
                    <option value="afternoon">Afternoon</option>
                    <option value="evening">Evening</option>
                    <option value="flexible">Flexible</option>
                </select>
            </div>
            <div className="new-request__div">
                <label className="new-request__label" htmlFor="description"> Description:{" "} </label>
                <textarea className="new-request__input" type="text" name="description" id="descritpion" placeholder="Enter Request details" defaultValue={initialData?.description || ""} onChange={handleChange} />
            </div>

            <div className="new-request__div">
                <label className="new-request__label" htmlFor="medical">Medical:{" "}</label>
                <input className="new-request__checkbox" type="checkbox" name="medical" id="medical" defaultValue = {initialData?.medical || ""} checked={values.medical === "YES"} onChange={(e) => setValues({ ...values, medical: e.target.checked ? "YES" : "NO" })} />
            </div>

            <div>
                <button className="new-request__button" type="secondary" onClick={handleCancel}>Cancel</button>
                <button className="new-request__button" onClick={handleSubmit}>Submit</button>
            </div>
        </form>
        }

        {!user && <div> You must be logged in to view this page <Link to="/account">login</Link> </div>}
        </main>
    );
};