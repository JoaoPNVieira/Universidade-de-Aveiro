import React,{useState, useEffect} from 'react'
import '../../App.css' 
import './CartPage.css'
import CartItem from '../Sales/CartItem'
import { getItems } from '../ConnectAPI/ItemManager'
import { sendCart } from '../ConnectAPI/CartManager'
import { useNavigate } from 'react-router-dom'


function CartPage() {

    /*********** Const Declaratrion **********/
    const [itemList, setItemList] = useState([])
    useEffect(() => { getItems().then(data => { setItemList(data) }).catch(e => console.log("Error", e)) }, [])
    const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
    const [getAmount, setAmount] = useState([0])
    const [getShipping, setShipping] = useState([0])
    const [getPromo, setPromo] = useState(1)
    const [promoCode, setPromoCode] = useState('')
    const [finalPrice, setFinalPrice] = useState(0)
    const navigate = useNavigate();
    let date = new Date()
    date.setDate(date.getDate() + 15)

    /*********** Calc Shopping Cart Value **********/
    useEffect(() => { 
        let amount = 0
        for(const item of itemList){
            amount = amount + (cart[item.Id] * item.Price)
        }
        setAmount(amount.toFixed(2)) 
    }, [itemList, cart])

    /*********** Calc Shipping Value **********/
    useEffect(() => { 
        let ship = 0
        if(getAmount < 20 && getAmount > 0){
            ship = 2.99
        }else{
            ship = 0
        }
        setShipping(ship.toFixed(2)) 
    }, [getAmount])

    /*********** Calc Promo **********/
    const checkPromo = () => {
        if(promoCode === '20VALORES'){
            setPromo(0.2)
        }
    }

    /*********** Calc Total Value **********/
    useEffect(() => { 
        let final = 0
        final = (getAmount * getPromo) + parseFloat(getShipping)
        setFinalPrice(final.toFixed(2))

    }, [getAmount, getShipping, getPromo])


    /*********** Submit **********/
    function handlesubmit(){
        let name = ""
        const aCookie = document.cookie.split(';')
        for(let i = 0; i < aCookie.length; i++){
            let cookie = aCookie[i].split('=')[0].trim()
            if(cookie === 'userDetitalism'){
                name = aCookie[i].split('=')[1]
            }
        }
        let cart = []
        cart[0] = name
        cart[1] = JSON.parse(window.localStorage.getItem("detitalismoh"))
        cart[2] = parseFloat(finalPrice)
        sendCart(cart)
        navigate('/Checkout')
    }

    /*********** Main Function ************/
    return (  

        <section className='cart-main-container'> 
            <section className='cart-container'>

                {/************* Shopping Cart Tag ************/}
                <section className='cart-name'>
                    <h1> <i className="fas fa-cart-shopping"></i> Shopping Cart</h1> 
                </section>

                {/************* Items On Cart ************/}
                <section className='cart-items'>
                    <CartItem />
                </section>

                {/************* Summary Of Cart ************/}
                <section className='cart-resume'>
                    <h1>Summary</h1>
                    <div className='cart-values'>   
                        <p className='cartvalue-text'>Subtotal:</p>
                        <p className='cartvalue-price'>{getAmount}€</p>
                    </div>
                    <div className='cart-values'>   
                        <p className='cartvalue-text'>Shipping:</p>
                        <p className='cartvalue-price'>{getShipping}€</p>
                    </div>
                    <div className='cart-total'>   
                        <p className='cartvalue-text'>Total:</p>
                        <p className='cartvalue-price'>{finalPrice}€</p>
                    </div>
                </section>

                {/************* Info About ************/}
                <section className='cart-info'>
                    <h1><i className="fas fa-circle-info"/> Info</h1>
                    {getAmount > 0 ?<div className='cart-infos'>   
                        <p className='cartvalue-text'>Delivery From:</p>
                        <p className='cartvalue-price'>{((date).toUTCString()).slice(0,16)}</p>
                    </div> : null}
                    {getAmount < 20 ?<div className='cart-infos'>   
                        <p className='cartvalue-text'>Buy More To Get Free Shipping:</p>
                        <p className='cartvalue-price'>{20 - parseFloat(getAmount)}€</p>
                    </div>: null}
                    {getAmount < 10 ? <div className='cart-infos2'>   
                        <p className='cartvalue-text'>Minimum Order is 9.99€</p>
                    </div> : null}
                </section>

                {/************* Coupons ************/}
                <section className='cart-coupon'>
                    <h1> <i className="fas fa-tag"></i> Promo Codes</h1>
                    <div className='promo-values'>   
                        <input type='text' className='promo-input' placeholder='Promo Code' on onChange={(e) => setPromoCode(e.target.value)}/>
                        <button className='promo-btn' onClick={() => checkPromo()}>Apply</button>
                    </div>                  
                </section>

                {/************* Submit ************/}
                <section className='cart-checkout'>
                    <button className='checkout-btn' onClick={() => handlesubmit()}>Proceed To Checkout</button>                  
                </section>
            </section>
        </section>
    )
}

export default CartPage