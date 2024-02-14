import React,{useState, useEffect} from 'react'
import '../../App.css' 
import './CartPage.css'
import LastOrderItem from '../Sales/LastOrderItems'


function LastOrderPage() {

    /*********** Const Declaratrion **********/



    /*********** Main Function ************/
    return (  

        <section className='cart-main-container'> 
            <section className='cart-container'>

                {/************* Shopping Cart Tag ************/}
                <section className='cart-name'>
                    <h1> <i className="fas fa-heart"></i> Wishlist</h1> 
                </section>

                {/************* Items On Cart ************/}
                <section className='cart-items'>
                    <LastOrderItem />
                </section>
                
            </section>
        </section>
    )
}

export default LastOrderPage