import React, {useState, useEffect} from 'react'
import Cookies from 'universal-cookie'
import { Link } from 'react-router-dom'
import './Navbar.css'
import Searchbar from './Searchbar'
import Filters from './Filters'
import { getItems } from '../ConnectAPI/ItemManager'
import { useNavigate } from 'react-router-dom'

function Navbar() {

    /*********** Const Declaratrion **********/
    const cookies = new Cookies();
    const navigate = useNavigate();
    const [click, setClick] = useState(false)
    const handleClick = () => setClick(!click)
    const closeMobileMenu = () => setClick(false)
    const [searchActive, setSearchButton] = useState(false)
    const [searchFilter, setFilter] = useState(false)
    const [search, setSearch] = useState("")
    const [itemList, setItemList] = useState([])
    const [itemCount, setItemCount] = useState(0)
    useEffect(() => { getItems().then(data => { setItemList(data) }).catch(e => console.log("Error", e)) }, [])
    useEffect(() => {
        let emptyCart = []
        let count = 0
        let emptyWish = []
        const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
        const wish = JSON.parse(window.localStorage.getItem("detitalismow"))
        if (cart === null){
            for(const item of itemList){
                emptyCart[item.Id] = 0
            }
            emptyCart.length > 0 ? window.localStorage.setItem("detitalismoh", JSON.stringify(emptyCart)) : <></>
        } 

        if (wish === null){
            for(const item of itemList){
                emptyWish[item.Id] = 0
            }
            emptyCart.length > 0 ? window.localStorage.setItem("detitalismow", JSON.stringify(emptyWish)) : <></>
        } 
        if(cart !== null){
            for(const item of itemList){
                count = count + cart[item.Id]
            }
            if(count !== 0){
                setItemCount(count)
            }
        }
    }, [itemList])

    const handleSearch = (value) => {
        if (value === '') {
            setSearchButton(false)
        } else {    
            setSearchButton(true)
            setSearch(value)
        }
    }


    function getCookie() {
        const aCookie = document.cookie.split(';')
        for(let i = 0; i < aCookie.length; i++){
            let cookie = aCookie[i].split('=')[0].trim()
            if(cookie === 'userDetitalism'){
                if(aCookie[i].split('=')[1] === ""){
                    return false
                }else{
                    return true
                }
            }
        }
    }

    function logOut(){
        cookies.remove('userDetitalism', {path: '/'})
        navigate('/')
    }

    /*********** Main Function ************/
    return (
        <>
            <nav className='navbar'>

                {/*************** Logo On Nav *****************/}
                <div className='nav-logo'>
                    <Link to="/" className='logo'>
                        <img className='nav-logo-img' src="/Images/DETItalismo.png" alt="logo" height={60}/>
                    </Link>
                </div>

                {/*************** Search Items *****************/}
                <div className='menu-search'>
                    <input className='search-box' type="text" placeholder="Search..." onChange={(e) => handleSearch(e.target.value)}/>
                    <button onMouseEnter={() => setFilter(true)} onClick={() => setFilter(!searchFilter)}><i className="fa fa-search"></i></button>
                </div>
                {searchActive && <Searchbar searchR={search} setOpen={setSearchButton}/>}
                {searchFilter && <Filters setOpen={setFilter}/>}

                {/*************** Menu Options *****************/}
                <ul className='nav-menu'>
                    <li className='nav-item'>
                        <div className='nav-icon' onClick={handleClick}>
                            <i className='fas fa-users' />
                        </div>

                        {/*************** Login Dropdown *****************/}
                        {!getCookie() && <div className={click ? 'user-dropdown active' : 'user-dropdown'}>
                            <Link to="/Login" className={click ? 'dropdown-link active' : 'dropdown-link'} onClick={closeMobileMenu}>
                                <i className='fas fa-user' /> <p className='dpd-p' >Login</p>
                            </Link>

                            <Link to="/Register" className={click ? 'dropdown-link active' : 'dropdown-link'} onClick={closeMobileMenu}>
                                <i className='fas fa-user-plus' /> <p className='dpd-p' >Sign Up</p>
                            </Link>
                        </div>}

                        {getCookie() && <div className={click ? 'user-dropdown2 active' : 'user-dropdown2'}>
                            <Link to="/Account" className={click ? 'dropdown-link active' : 'dropdown-link'} onClick={closeMobileMenu}>
                                <i className='fas fa-user' /> <p className='dpd-p' >My Account</p>
                            </Link>

                            <Link to="/Wishlist" className={click ? 'dropdown-link active' : 'dropdown-link'} onClick={closeMobileMenu}>
                                <i className='fas fa-heart' /> <p className='dpd-p' >My Whislist</p>
                            </Link>

                            <Link to="/LastOrders" className={click ? 'dropdown-link active' : 'dropdown-link'} onClick={closeMobileMenu}>
                                <i className='fas fa-cart-arrow-down' /> <p className='dpd-p' >Past Orders</p>
                            </Link>

                            <div className={click ? 'dropdown-link active' : 'dropdown-link'} onClick={logOut}>
                                <i className='fas fa-user-slash' /> <p className='dpd-p' >Logout</p>
                            </div>
                        </div>}
                    </li>
                    <li className='nav-item'>
                        <Link to="/Cart" className='nav-icon' onClick={closeMobileMenu}>
                            <i className="fas fa-cart-shopping"></i>
                        </Link>
                        {itemCount >= 1 ? <div className='nav-cart-number'>
                            <p>{itemCount}</p>
                        </div> : null}
                    </li>
                </ul>

        </nav>
    </>
  )
}


export default Navbar