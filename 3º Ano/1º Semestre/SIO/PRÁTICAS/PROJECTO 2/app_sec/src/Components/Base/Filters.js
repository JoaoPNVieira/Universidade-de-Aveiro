import React from "react";
import '../../App.css'
import './Filters.css'
import { Link } from "react-router-dom";


/*********** Filters Declaratrion **********/
const filters = [
    {name: "Clothes", active: false},
    {name: "Home", active: false},
    {name: "Accessories", active: false},
]

/*********** Main Function ************/
function Filters(props) {

    let filterArray = []

    /*********** Handle Filter Buttons ************/
    for (const filter of filters) {
        /* If Filter Is Already Active */
        if(filter.active === true){
            filterArray.push(<Link to="/" key={filter.name} className={filter.active ? "filterButton active" : "filterButton"} onClick={() => {filter.active = !filter.active;props.setOpen(false)}}>{filter.name}</Link>)
        }
        /* If Filter Is Not Active */
        else{
            filterArray.push(<Link to={"/"+filter.name} key={filter.name} className={filter.active ? "filterButton active" : "filterButton"} onClick={() => {filter.active = !filter.active;
                /* Disable Other Filters */
                for(const filter2 of filters){
                    if(filter2.name !== filter.name){
                        filter2.active = false
                    }
                };
                props.setOpen(false)
            }}>{filter.name}</Link>)
        }
    }

    /*********** Display Filters ************/
    return (
        <>
            <section className="filterDropdown" onMouseLeave={() => props.setOpen(false)}>
                <h1>{filterArray}</h1>
            </section>
        </>
  );
}

export default Filters;