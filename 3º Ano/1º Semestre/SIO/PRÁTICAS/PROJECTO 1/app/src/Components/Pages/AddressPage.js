import React, {useState, useEffect} from 'react'
import '../../App.css'
import './AddressPage.css'
import { Link } from 'react-router-dom'
import { GetAddress, postAddress } from '../ConnectAPI/PeopleManager'

function AddressPage() {  

    /************ Const Declaration ************/
    const [showPop, setShowPop] = useState(false)
    const [address, setAddress] = useState('')
    const [country, setCountry] = useState('')
    const [door, setDoor] = useState('')
    const [floor, setFloor] = useState('')
    const [postal, setPostal] = useState('')
    const [addrList, setAddrList] = useState([])
    useEffect(() => { 
        let name = ""
        const aCookie = document.cookie.split(';')
        for(let i = 0; i < aCookie.length; i++){
            let cookie = aCookie[i].split('=')[0].trim()
            if(cookie === 'userDetitalism'){
                name = aCookie[i].split('=')[1]
            }
        }
        GetAddress(name).then(data => { setAddrList(data) }).catch(e => console.log("Error", e)) }, [])
   

    function handleClick(){
        setShowPop(false)
        let name = ""
        const aCookie = document.cookie.split(';')
        for(let i = 0; i < aCookie.length; i++){
            let cookie = aCookie[i].split('=')[0].trim()
            if(cookie === 'userDetitalism'){
                name = aCookie[i].split('=')[1]
            }
        }
        let data = {User: name, Address: address, Country: country, Door: door, Floor: floor, Postal: postal}
        postAddress(data)
        
    }

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
                        <h1><i className='fas fa-marker' /> Change Password</h1>
                    </Link>
                    <Link to='/AddressLog' className='acc-bar-item'>
                        <h1><i className='fas fa-book' /> Address List</h1>
                    </Link>
                    <Link to='/Help' className='acc-bar-item'>
                        <h1><i className='fas fa-circle-info' /> Help</h1>
                    </Link>
                </section>

                <h1 className='acc-title'><i className='fas fa-book' /> Address List</h1>

                <section className='pay-form-container'>
                    <button className='pay-btn'onClick={() => setShowPop(true)}><i className='fas fa-plus' /> Add Option</button>
                    <section className='acc-form'>
                        {addrList.map((addr) => {
                            return (
                                <section className='acc-form-item'>
                                    <h1 className='acc-form-text'>{addr[4] + ", "}</h1>
                                    <h1 className='acc-form-text'>{addr[3] + ", "}</h1>
                                    <h1 className='acc-form-text'>{addr[2] + ", "}</h1>
                                    <h1 className='acc-form-text'>{addr[6] + ", "}</h1>
                                    <h1 className='acc-form-text'>{addr[5]}</h1>
                                </section>
                            )
                        })}
                        
                    </section>
                    {showPop && <section className='pay-pop-container'>
                        <section className='pay-pop'>
                            <h1 className='pay-pop-title'>Add Address</h1>
                            <form className='pay-pop-form'>
                                <fieldset className="pay-pop-form-group">
                                    <input className="pay-pop-form-input" onChange={(e) => setAddress(e.target.value)} type="text" name="address" id="address" placeholder='Address' />
                                </fieldset>
                                <fieldset className="pay-pop-form-group">
                                    <input className="pay-pop-form-input" onChange={(e) => setCountry(e.target.value)} type="text" name="city" id="city" placeholder='Country' />
                                </fieldset>
                                <fieldset className="pay-pop-form-group">
                                    <input className="pay-pop-form-input" onChange={(e) => setDoor(e.target.value)} type="text" name="door" id="door" placeholder='Door' />
                                </fieldset>
                                <fieldset className="pay-pop-form-group">
                                    <input className="pay-pop-form-input" onChange={(e) => setFloor(e.target.value)} type="text" name="floor" id="floor" placeholder='Floor' />
                                </fieldset>
                                <fieldset className="pay-pop-form-group">
                                    <input className="pay-pop-form-input" onChange={(e) => setPostal(e.target.value)} type="text" name="postal" id="postal" placeholder='Postal Code' />
                                </fieldset>
                            </form>
                            <div className='pay-pop-btn'>
                                <button className='pay-pop-btn1'onClick={() => setShowPop(false)}>CANCEL</button>
                                <button onClick={() => handleClick()} className='pay-pop-btn2'>SAVE</button>
                            </div>
                            
                        </section>
                </section>}
            </section>
        </section>
    </section>
    )
}

export default AddressPage