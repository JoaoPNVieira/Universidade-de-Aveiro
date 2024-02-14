import React, {useState} from 'react'
import '../../App.css'
import './PaymentPage.css'
import { Link } from 'react-router-dom'
import { updatePass } from '../ConnectAPI/PeopleManager';

function PassPage() {  
/************ Const Declaration ************/
    const [oldpass, setOldPass] = useState('');
    const [newpass, setNewPass] = useState('');
   

    function handlepass(){
        let name = ""
        const aCookie = document.cookie.split(';')
        for(let i = 0; i < aCookie.length; i++){
            let cookie = aCookie[i].split('=')[0].trim()
            if(cookie === 'userDetitalism'){
                name = aCookie[i].split('=')[1]
            }
        }
        let data = []
        data[0] = name
        data[1] = oldpass
        data[2] = newpass
        updatePass(data)
    }


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

                <h1 className='acc-title'><i className='fas fa-marker' /> Change Password</h1>

                <section className='acc-form-container'>
                    <form className='acc-form'>
                        <fieldset className="acc-form-group2">
                            <input className="acc-form-input2" onChange={(e) => setOldPass(e.target.value)} type="text" name="phone" id="phone" placeholder='Old Password' />
                        </fieldset>
                        <fieldset className="acc-form-group2">
                            <input className="acc-form-input2" onChange={(e) => setNewPass(e.target.value)} type="text" name="NIF" id="NIF" placeholder='New Password' />
                        </fieldset>
                    </form>
                    <div className='acc-form-btn'>
                        <button className='acc-btn' onClick={() => handlepass()}>SAVE</button>
                    </div>
                </section>
            </section>
        </section>
    )
}

export default PassPage