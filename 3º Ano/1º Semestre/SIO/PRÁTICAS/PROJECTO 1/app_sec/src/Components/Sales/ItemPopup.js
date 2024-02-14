import React from 'react'
import './ItemPopup.css'
import '../../App.css'

function ItemPopup(props) {
    return (props.trigger) ? (
        <div className="popup">
            <div className="popup-inner">
                <i className={props.onWish ? "fas fa-heart" :  "far fa-heart"} onClick={() => props.setWish(!props.onWish)}></i>
                <i className="fas fa-xmark" onClick={() => props.setTrigger(false)}></i>
                {props.children}
            </div>
        </div>
    ) : "";
}

export default ItemPopup