import {
  createBrowserRouter,
  RouterProvider,
  Route,
  Outlet,
} from "react-router-dom";

import React from 'react'
import Hakkimizda from './pages/Hakkimizda'
import Iletisim from './pages/Iletisim'
import Navbar from './components/Navbar'
import Footer from './components/Footer'
import Home from './pages/Home'
import "./style.scss"

const Layout = ()=>{
  return (
    <>
    <Navbar/>
    <Outlet/>
    <Footer/>
    </>
  )
}

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <Home />,
      }
    ],
  },

  {
    path: "/iletisim",
    element: <Iletisim/>,
  },
  {
    path: "/hakkimizda",
    element: <Hakkimizda/>,
  },

]);


function App() {
  return (
    <div className="app">
      <div className="container">
      <RouterProvider router={router}/>
      </div>
    </div>
  );
}



export default App;


const mysql = require('mysql2/promise');


async function connectToDatabase() {
  const connection = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'kargo_firmasi_otomasyonu'
  });
  
  console.log('Connected to database!');

  return connection;
}


const connection = await connectToDatabase();



