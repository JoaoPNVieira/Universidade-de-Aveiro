import React, {useState} from 'react'
import '../../App.css'
import './PaymentPage.css'
import { Link } from 'react-router-dom'

function HelpPage() {  

    /************ Const Declaration ************/
   


    /************ Main Function ************/
    return (  

        
        <section className='pay-main-container'> 
            <section className='pay-container'>
                <section className='acc-bar'>
                    <Link to='/Account' className='acc-bar-item'>
                        <h1><i className='fas fa-user' /> Account Info</h1>
                    </Link>
                    <Link to='/PaymentOpt' className='acc-bar-item'>
                        <h1><i className='fas fa-wallet' /> Payment Methods</h1>
                    </Link>
                    <Link to='/ResetPass' className='acc-bar-item'>
                        <h1><i className='fas fa-marker' />Change Password</h1>
                    </Link>
                    <Link to='/AddressLog' className='acc-bar-item'>
                        <h1><i className='fas fa-book' /> Address List</h1>
                    </Link>
                    <Link to='/Help' className='acc-bar-item'>
                        <h1><i className='fas fa-circle-info' /> Help</h1>
                    </Link>
                </section>

                <h1 className='acc-title'> <i className='fas fa-wallet' /> Payment Methods</h1>

                <section className='pay-form-container'>
                    <button className='pay-btn'><i className='fas fa-plus' /> Add Option</button>
                    <section className='acc-form'>
                        
                    </section>
                </section>
            </section>
        </section>
    )
}

export default HelpPage