import React, {useState} from 'react'
import '../../App.css'
import './PaymentPage.css'
import { Link, useNavigate } from 'react-router-dom'
import { endCart } from '../ConnectAPI/CartManager'

function CheckoutPage() {  

    /************ Const Declaration ************/
    const navigate = useNavigate();
   
    function handlefinish(){
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
        cart[2] = parseFloat(0)
        endCart(cart)
        let cartA = []
        let cartE = cart[1]
        for(const item of cartE){
            cartA.push(0)
        }
        window.localStorage.setItem("detitalismoh", JSON.stringify(cartA))
        navigate('/Recipt')
    }

    /************ Main Function ************/
    return (  

        
        <section className='pay-main-container'> 
            <section className='pay-container'>

                <h1 className='acc-title'> <i className='fas fa-wallet' /> Payment Methods</h1>

                <section className='pay-form-container'>
                    <section className='acc-form'>
                        
                    </section>
                </section>
                <button onClick={() => handlefinish()} className='pay-btn'>Finish</button>
            </section>
        </section>
    )
}

export default CheckoutPage