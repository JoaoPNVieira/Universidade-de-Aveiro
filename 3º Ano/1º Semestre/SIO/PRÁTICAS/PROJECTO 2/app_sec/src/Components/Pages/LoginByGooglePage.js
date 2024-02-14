import React, {useEffect, useState} from 'react'
import Cookies from 'universal-cookie'
import '../../App.css'
import './LoginByGooglePage.css'
import { Link, useNavigate } from 'react-router-dom'
import { jwtDecode } from "jwt-decode";
import { getCartPerson, logPerson, logentry, logGoogle } from '../ConnectAPI/PeopleManager'

function LoginByGooglePage() {
  /************ Const Declaration ************/
  const navigate = useNavigate();
  const navigatetoHome = () => {
    navigate("/");
  };


  const [ user, setUser ] = useState({});

  function handleCallbackResponse(response) {
    var userObject = jwtDecode(response.credential);
    setUser(userObject);
    document.getElementById("signInDiv").hidden = true;
    logGoogle(response.credential).then(function (result) {
      if(result === 1) {
        navigatetoHome();
      }else if(result === 0){

      }else{
        alert(result);
      }
    });

  }

  function handleSignOut(event){
    setUser({});
    document.getElementById("signInDiv").hidden = false;
  }

  useEffect(() => {
    /* global google */ 
    google.accounts.id.initialize({
      client_id: "933478365143-rff11v0iq4vls8ouobltdou7b7mlbdfb.apps.googleusercontent.com",
      callback: handleCallbackResponse
    });

    google.accounts.id.renderButton(
      document.getElementById("signInDiv"),
      { theme: "outline", size: "large" }
    )

  }, []);


  /************ Main Function ************/
return (
  
  <section className="login-main-container">
    <div className="cover">d</div>
    <section className="login-container">
      <section className="login-logo">
        <Link>
          <img src="/Images/DETItalismo.png" alt="logo" height={60} />
        </Link>
        <p className="slogan">Building the Future, One Byte at a Time</p>
      </section>
      <section className="login-form-container">
        <h1 className="login-title">2nd Step</h1>
        <div id="signInDiv"></div>
        { Object.keys(user).length !== 0 &&
        <button onClick={(e) => handleSignOut(e)}>Sign Out</button>
      }
      </section>
    </section>
  </section>
);
}

export default LoginByGooglePage