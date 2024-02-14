import React, {useEffect, useState} from 'react'
import Cookies from 'universal-cookie'
import '../../App.css'
import './LoginPage.css'
import { Link, useNavigate } from 'react-router-dom'
import { getCartPerson, logPerson, logentry } from '../ConnectAPI/PeopleManager'

function LoginPage() {  

    /************ Const Declaration ************/
    const cookies = new Cookies();
    const [email, setEmail] = useState(''); 
    const [password, setPassword] = useState('');
    const [invLogin1, setInvLogin1] = useState(false);
    const [invLogin2, setInvLogin2] = useState(false);
    const [bResult, setResult] = useState(9)
    const navigate = useNavigate();
    const navigatetoHome = () => {
        navigate('/');
    }
    

    /************ Submit Login ************/

    useEffect(() => {
        if(logentry.Email !== "" || logentry.Password !== ''){
            if(bResult === 1){
                cookies.set("userDetitalism", email, {expires: new Date(Date.now() + 86400000), sameSite: 'none', secure: true})
                getCartPerson(email).then(function(result){window.localStorage.setItem("detitalismoh", JSON.stringify(result))})
                navigatetoHome()
            } else if(bResult === 0){
                setInvLogin1(true)
                setInvLogin2(false)
            }else{
                setInvLogin2(true)
                setInvLogin1(false)
            }
        }
    }, [bResult])

    const handleSubmit = () => {
        logentry.Email = email
        logentry.Password = password
        logPerson(logentry).then(function(result){setResult(result)})
    }

    /************ Main Function ************/
    return (  

        
        <section className='login-main-container'> 
            <section className='login-container'>
                <section className='login-logo'>
                    <Link to="/">
                        <img src="/Images/DETItalismo.png" alt="logo" height={60}/>
                    </Link>
                    <p className='slogan'>Building the Future, One Byte at a Time</p>
                </section>
                <section className='login-form-container'>
                    
                    <form className='login-form' onSubmit = {handleSubmit}>
                        <fieldset className="form-group">
                            <input className="form-input" value={email} onChange={(e) => setEmail(e.target.value)} type="email" name="email" id="email" placeholder='E-mail' />
                        </fieldset>
                        <fieldset className="form-group">
                            <input className="form-input1" value={password} onChange={(e) => setPassword(e.target.value)} type="text" name="password" id="password" placeholder='Password'/>
                        </fieldset>
                    </form>
                    {invLogin2 && <p className='errorp'> Wrong Password</p>}
                    {invLogin1 && <p className='errorp'> User Doesn't Exist</p>}
                    <button className='login-btn' onClick={handleSubmit}>LOG IN</button>
                    <p className='signUp-Q'>Don't have an account? <Link to="/Register">Sign Up</Link></p>
                </section>
            </section>
        </section>
    )
}

export default LoginPage