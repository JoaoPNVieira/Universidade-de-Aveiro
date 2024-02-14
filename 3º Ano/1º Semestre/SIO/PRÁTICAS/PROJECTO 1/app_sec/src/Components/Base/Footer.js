import React from 'react'
import { Link } from 'react-router-dom'
import './Footer.css'

function Footer() {

    /*********** Main Function ************/
    return (
        <>
            {/************* Display Items *************/}
            <footer className='footer'>
                <section className='footer-container'>
                    <div className='footer-info'>
                        <div className='footer-info-wrapper'>
                            {/************* Project Makers *************/}
                            <div className='footer-info-items'>
                                <h2>José Silva</h2>
                                <p>103248</p>
                                <p>jm.silva@ua.pt</p>
                                <p>SIO</p>
                                <p>UA - ECI</p>
                            </div>
                            <div className='footer-info-items'>
                                <h2>Henrique Cruz</h2>
                                <p>103442</p>
                                <p>henriquecruz@ua.pt</p>
                                <p>SIO</p>
                                <p>UA - ECI</p>
                            </div>
                        </div>
                        <div className='footer-info-wrapper'>
                            <div className='footer-info-items'>
                                <h2>João Vieira</h2>
                                <p>50458</p>
                                <p>joaopvieira@ua.pt</p>
                                <p>SIO</p>
                                <p>UA - ECI</p>
                            </div>
                            <div className='footer-info-items'>
                                <h2>Luís Diogo</h2>
                                <p>108668</p>
                                <p>luismtd@ua.pt</p>
                                <p>SIO</p>
                                <p>UA - ECI</p>
                            </div>
                        </div>
                    </div>
                    {/************* Logo And SM *************/}
                    <section className='social-media'>
                        <div className='footer-logo'>
                            <Link to='/' className='social-logo'>
                                <img src="/Images/DETItalismo.png" alt="logo" height={60}/>
                            </Link>
                        </div>
                        <div className='social-media-wrap'>
                            <small className='website-rights'>DETItalismo © 2023</small>
                            <div className='social-icons'>
                                <Link to='/'>
                                    <i className='fab fa-facebook-f' />
                                </Link>
                                <Link to='/'>
                                    <i className='fab fa-instagram' />
                                </Link>
                                <Link to='/'>
                                    <i className='fab fa-youtube' />
                                </Link>
                                <Link to='/'>
                                    <i className='fab fa-twitter' />
                                </Link>
                            </div>
                        </div>
                    </section>
                </section>   
            </footer>
        </>
  )
}


export default Footer