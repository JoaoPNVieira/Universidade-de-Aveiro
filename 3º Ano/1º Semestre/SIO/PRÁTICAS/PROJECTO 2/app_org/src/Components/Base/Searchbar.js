import React,{useState, useEffect} from "react";
import '../../App.css'
import './Searchbar.css'
import { getItems } from '../ConnectAPI/ItemManager'
import { Link } from "react-router-dom";

function Searchbar(props) {

    /*********** Const Declaratrion **********/
    const [itemList, setItemList] = useState([])
    useEffect(() => { getItems().then(data => { setItemList(data) }).catch(e => console.log("Error", e)) }, [])
    let itemArray = []

    /*********** Check If Item Contains Search **********/
    for (const item of itemList) {
        if (item.ProductName.toLowerCase().includes(props.searchR.toLowerCase())) {
            itemArray.push(
                <Link to={"Item"+item.Id} className="searchItems" key={item.Id}>
                    <img src={item.ImagePath + "1.png"} alt='Error Loading...' className="searchImage"/>
                    <p className="searchName">{item.ProductName}</p>
                </Link>
            )
        }
    }
    /*********** Display Items **********/
    return (
        <>
            <section className="searchDropdown" onMouseLeave={() => props.setOpen(false)} onClick={() => props.setOpen(false) & window.location.reload(false)}>
                <div>{itemArray}</div>
            </section>
        </>
  );
}

export default Searchbar;