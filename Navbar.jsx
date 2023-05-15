import React from 'react'
import { Link } from "react-router-dom"
import Logo from "../img/logo.png"

const Navbar = () => {
  return (
    <div className='navbar'>
      <div className="container">
        <div className="logo">
          <Link className='link' to="/">
          <img src={Logo} className='logo'></img>
          </Link>
        </div>



        <div className="links">
          <Link className='link' to="/iletisim">İletişim</Link>
          <Link className='link' to="/hakkimizda">Hakkımızda</Link>
        </div>
      </div>
    </div>
   
  )
};

export default Navbar