import React,{useState, useEffect} from "react";
import { getItems } from '../ConnectAPI/ItemManager'
import ItemCard from "../Sales/ItemCard";

function FilteredPage(props) {

    /*********** Const Declaratrion **********/
    const [itemList, setItemList] = useState([])
    useEffect(() => { getItems().then(data => { setItemList(data) }).catch(e => console.log("Error", e)) }, [])

    /*********** Main Function ************/
    return (
        <section className='main-container'>
             <section className='text-container'>
                <h1>Building the Future, One Byte at a Time</h1>

                {/*********** Cards ************/}
                <div className="item_cards">
                    <div className='item_card_wrapper'>
                        <ul className='item_card_items'>
                            {itemList.map((item, i) => {
                                if(item.Category === props.Category){
                                    return(
                                        <ItemCard key={item.Id} src= {item.ImagePath} price= {item.Price} name={item.ProductName} cat={item.Category} desc={item.ProductDescription} stock={item.Stock} id={item.Id}/>
                                    )
                                }else{
                                    return null
                                }
                            })}
                            
                        </ul>
                    </div>
                </div>
            </section>
        </section>
    )
}

export default FilteredPage;