import React, {useState} from 'react'
import '../../App.css'
import './AccountPage.css'
import { Link } from 'react-router-dom'

function AccountPage() {  

    /************ Const Declaration ************/
   


    /************ Main Function ************/
    return (  

        
        <section className='acc-main-container'> 
            <section className='acc-container'>
                <section className='acc-bar'>
                    <Link to='/Account' className='acc-bar-item'>
                        <h1><i className='fas fa-user' /> Account Info</h1>
                    </Link>
                    <Link to='/PaymentOpt' className='acc-bar-item'>
                        <h1><i className='fas fa-wallet' /> Payment Methods</h1>
                    </Link>
                    <Link to='/ResetPass' className='acc-bar-item'>
                        <h1><i className='fas fa-marker' /> Change Password</h1>
                    </Link>
                    <Link to='/AddressLog' className='acc-bar-item'>
                        <h1><i className='fas fa-book' /> Address List</h1>
                    </Link>
                    <Link to='/Help' className='acc-bar-item'>
                        <h1><i className='fas fa-circle-info' /> Help</h1>
                    </Link>
                </section>

                <h1 className='acc-title'> <i className='fas fa-user' /> Account Info</h1>

                <section className='acc-form-container'>
                    <form className='acc-form'>
                        <div className='acc-form-names'>
                            <fieldset className="acc-form-group1">
                                <input className="acc-form-input1" type="text" name="name" id="name" placeholder='Name' />
                            </fieldset>
                            <fieldset className="acc-form-group1">
                                <input className="acc-form-input1" type="text" name="surname" id="surname" placeholder='Surname' />
                            </fieldset>
                        </div>
                        <fieldset className="acc-form-group2">
                            <input className="acc-form-input2" type="tel" name="phone" id="phone" placeholder='Phone Number' />
                        </fieldset>
                        <fieldset className="acc-form-group2">
                            <input className="acc-form-input2" type="tel" name="NIF" id="NIF" placeholder='Tax Identification Number' />
                        </fieldset>
                    </form>
                    <div className='acc-form-btn'>
                        <button className='acc-btn'>SAVE</button>
                    </div>
                </section>
            </section>
        </section>
    )
}

export default AccountPage