import React from 'react'
import Arkaplan from '../img/arkaplan.jpg'


const Home = () => {
  return (
    <div className="home">
      <img className='backgroundimg'src={Arkaplan} alt="" />
      <div className='text'>HIZLI KARGO</div>
      <div className='text1'>ANINDA KAPINIZDA</div>
      <div class="rectangle">
      <input placeholder=' Kargo takip numaranızı giriniz.' className='search-input'  />
      <button type="button">Takip et</button>
      </div>
      </div>          
  )
}

export default Home 