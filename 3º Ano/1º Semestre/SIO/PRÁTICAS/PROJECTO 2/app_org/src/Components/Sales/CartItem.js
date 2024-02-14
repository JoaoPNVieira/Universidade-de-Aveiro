import React,{useState, useEffect} from 'react'
import '../../App.css'
import './CartItem.css'
import { getItems } from '../ConnectAPI/ItemManager'

function CardItem() {

    /*********** Const Declaratrion **********/
    const [itemList, setItemList] = useState([])
    useEffect(() => { getItems().then(data => { setItemList(data) }).catch(e => console.log("Error", e)) }, [])
    const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
    let showitem = false;
    
    function removeCart(id){
        const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
        cart[id] = 0
        window.localStorage.setItem("detitalismoh", JSON.stringify(cart))
        window.location.reload(false)
    }

    function removefromCart(id){
        const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
        cart[id] = cart[id] - 1
        window.localStorage.setItem("detitalismoh", JSON.stringify(cart))
        window.location.reload(false)
    }

    function addtoCart(id){
        const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
        cart[id] = cart[id] + 1
        window.localStorage.setItem("detitalismoh", JSON.stringify(cart))
        window.location.reload(false)
    }

    /*********** Main Function ************/
    return(
        <section className='cartItem-container'>
            {itemList.map((item) => {
                /*********** If Cart Has Items ************/
                if(cart[item.Id] > 0){
                    return(
                        showitem = true,
                        <div className='cartItem-card' key={item.Id}>

                            {/*********** Image ************/}
                            <div className='cartItem-img-container'>
                                <img src={item.ImagePath + "1.png"} alt='Error Loading...' className='cartItem-img' />
                            </div>

                            {/*********** Text ************/}
                            <div className='cartItem-details'>
                                <div className='cartItem-name'>
                                    <h1>{item.ProductName}</h1>
                                    <p className='cartItem-remove' onClick={() => removeCart(item.Id)}><i className="fas fa-trash"></i></p>
                                </div>

                                {/*********** Quantity ************/}
                                <div className='cartItem-info'>
                                    <div className='cartItem-quantity'>
                                        <button className='cartItem-quantity-button' onClick={() => removefromCart(item.Id)}>-</button>
                                        <p className='cartItem-quantity-text'>{cart[item.Id]}</p>
                                        <button className='cartItem-quantity-button' onClick={() => addtoCart(item.Id)}>+</button>
                                    </div>

                                    {/*********** Price ************/}
                                    <p className='cartItem-price'>{(item.Price * cart[item.Id]).toFixed(2)}€</p>
                                </div>
                            </div>
                        </div>
                    )
                }else{
                    return null
                }
            })}
            {/*********** If Cart Don't Have Items ************/}
            {showitem ? null : <section>
                <div className='cartItem-nullcard'>
                    <i className="fas fa-cart-plus"></i>
                    <h1 className='cartItem-nullcard-title'>Your Shopping Cart Is Empty!</h1>
                    <p className='cartItem-nullcard-text'>Start adding items to your cart.</p>
                </div>
            </section>}

        </section>
    )

}

export default CardItem