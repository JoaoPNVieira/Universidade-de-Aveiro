import React, {useState, useEffect} from 'react'
import '../../App.css'
import './RegisterPage.css'
import { Link, useNavigate } from 'react-router-dom'
import { regentry, regPerson } from '../ConnectAPI/PeopleManager';

function RegisterPage() {
  /************ Const Declaration ************/
  const [Fname, setFName] = useState("");
  const [Lname, setLName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confpassword, setConfPassword] = useState("");
  const [firsterror, setfirtError] = useState(false);
  const [secerror, setsecError] = useState(false);
  const [passerror, setPassError] = useState(false);
  const [emailerror, setEmailError] = useState(false);
  const [res, setRes] = useState(false);
  const [f, setf] = useState(0);
  const navigate = useNavigate();

  useEffect(() => {
    const minLength = 8;
    const hasUppercase = /[A-Z]/.test(password);
    const hasLowercase = /[a-z]/.test(password);
    const hasNumber = /[0-9]/.test(password);
    if (password.length >= minLength && hasUppercase && hasLowercase && hasNumber || password.length < 1) {
      setPassError(false);
    }else{
      setPassError(true);
    }
    if (password === "" || confpassword === "") {
      setfirtError(false);
    } else {
      if (password !== confpassword) {
        setfirtError(true);
      } else {
        setfirtError(false);
        regentry.Password = password;
      }
    }
  }, [password, confpassword]);

useEffect(() => {

  if(!email.includes("@") && email.length > 0){
    setEmailError(true);
  }else{
    setEmailError(false);
  }

}, [email])

  useEffect(() => {
    if (f === 0) {
      setf(1);
    } else {
      if (res === true) {
        navigate("/Login");
      }
    }
  }, [res, f, navigate])

  const handleSubmit = () => {
    
    regentry.FName = Fname;
    regentry.LName = Lname;
    regentry.Email = email;
    if (firsterror === false && passerror === false && emailerror === false) {
      regPerson(regentry).then(function (result) {
        if (result === true) {
          navigate("/Login");
        }else{
          setsecError(true);
        }
      });
    }
  };
  

  /************ Main Function ************/
  //!: CWE 549- substitui o type="text" para type="password"
  return (
    <section className="reg-main-container">
      <section className="reg-container">
        <section className="reg-form-container">
          <h1 className="reg-title">Create Your Account</h1>

          <form className="reg-form">
            <div className="reg-form-name-inputs">
              <fieldset className="form-groupN">
                <input
                  className="form-inputN"
                  value={Fname}
                  onChange={(e) => setFName(e.target.value)}
                  type="text"
                  name="FName"
                  id="FName"
                  placeholder="First Name"
                />
              </fieldset>
              <fieldset className="form-groupN">
                <input
                  className="form-inputN"
                  value={Lname}
                  onChange={(e) => setLName(e.target.value)}
                  type="text"
                  name="LName"
                  id="LName"
                  placeholder="Last Name"
                />
              </fieldset>
            </div>
            <fieldset className="form-groupR">
              <input
                className="form-inputR"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                type="email"
                name="email"
                id="email"
                placeholder="E-mail"
              />
            </fieldset>
            <fieldset className="form-groupR">
              <input
                className="form-inputR"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                type="password"
                name="password"
                id="password"
                placeholder="Password"
              />
            </fieldset>
            <fieldset className="form-groupR">
              <input
                className="form-inputR"
                value={confpassword}
                onChange={(e) => setConfPassword(e.target.value)}
                type="password"
                name="password"
                id="password"
                placeholder="Confirm Password"
              />
            </fieldset>
          </form>
          <button className="reg-btn" onClick={handleSubmit}>
            REGISTER
          </button>
          {emailerror && <p className="errorp"> Not a Valid Email</p>}
          {passerror && <p className="errorp"> Passwords Doesn't Fullfil Requiremets</p>}
          {firsterror && <p className="errorp"> Passwords Don't Match</p>}
          {secerror && <p className="errorp"> User Already Exists</p>}
          <p className="signUp-Q">
            Already have an account? <Link to="/Login">Log In</Link>
          </p>
        </section>
      </section>
    </section>
  );
}

export default RegisterPage