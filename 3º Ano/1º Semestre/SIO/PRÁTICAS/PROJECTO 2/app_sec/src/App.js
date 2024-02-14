import React from 'react';
import './App.css';
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import Navbar from './Components/Base/Navbar.js';
import Footer from './Components/Base/Footer.js';
import MainPage from './Components/Pages/MainPage.js';
import FilteredPage from './Components/Pages/FilteredPage';
import LoginPage from './Components/Pages/LoginPage.js';
import LoginByGooglePage from './Components/Pages/LoginByGooglePage.js';
import RegisterPage from './Components/Pages/RegisterPage.js';
import CartPage from './Components/Pages/CartPage.js';
import AccountPage from './Components/Pages/AccountPage.js';
import PaymentPage from './Components/Pages/PaymentPage.js';
import AddressPage from './Components/Pages/AddressPage.js';
import PassPage from './Components/Pages/ChangePassPage.js';
import HelpPage from './Components/Pages/HelpPage.js';
import CheckoutPage from './Components/Pages/CheckoutPage.js';
import WishlistPage from './Components/Pages/WhislistPage.js';
import ReciptPage from './Components/Pages/ReciptPage.js';
import LastOrderPage from './Components/Pages/LastOrdersPage.js';
import TermsCond from './Components/Pages/TermsCond.js';
import Item0 from './Components/Pages/ItemPages/item0.js';
import Item1 from './Components/Pages/ItemPages/item1.js';
import Item2 from './Components/Pages/ItemPages/item2.js';
import Item3 from './Components/Pages/ItemPages/item3.js';
import Item4 from './Components/Pages/ItemPages/item4.js';
import Item5 from './Components/Pages/ItemPages/item5.js';
import Item6 from './Components/Pages/ItemPages/item6.js';
import Item7 from './Components/Pages/ItemPages/item7.js';
import Item8 from './Components/Pages/ItemPages/item8.js';
import Item9 from './Components/Pages/ItemPages/item9.js';
import Item10 from './Components/Pages/ItemPages/item10.js';
import Item11 from './Components/Pages/ItemPages/item11.js';

function App() {

  return (
    <>
      <Router>
        <Navbar />
        <Routes>
          <Route path='/' element={<MainPage />} />
          <Route path='/Clothes' element={<FilteredPage Category="Clothes"/>} />
          <Route path='/Accessories' element={<FilteredPage Category="Accessories"/>} />
          <Route path='/Home' element={<FilteredPage Category="Home"/>} />
          <Route path='/Login' element={<LoginPage />} />
          <Route path='/LoginByGoogle' element={<LoginByGooglePage />} />
          <Route path='/Register' element={<RegisterPage />} />
          <Route path='/Cart' element={<CartPage />} />
          <Route path='/Account' element={<AccountPage />} />
          <Route path='/PaymentOpt' element={<PaymentPage />} />
          <Route path='/AddressLog' element={<AddressPage />} />
          <Route path='/ResetPass' element={<PassPage />} />
          <Route path='/Help' element={<HelpPage />} />
          <Route path='/Checkout' element={<CheckoutPage />} />
          <Route path='/Wishlist' element={<WishlistPage />} />
          <Route path='/Recipt' element={<ReciptPage />} />
          <Route path='/LastOrders' element={<LastOrderPage />} />
          <Route path='TermsCond' element={<TermsCond />} />
          <Route path='/Item1' element={<Item1 />} />
          <Route path='/Item2' element={<Item2 />} />
          <Route path='/Item3' element={<Item3 />} />
          <Route path='/Item4' element={<Item4 />} />
          <Route path='/Item5' element={<Item5 />} />
          <Route path='/Item6' element={<Item6 />} />
          <Route path='/Item7' element={<Item7 />} />
          <Route path='/Item8' element={<Item8 />} />
          <Route path='/Item9' element={<Item9 />} />
          <Route path='/Item10' element={<Item10 />} />
          <Route path='/Item11' element={<Item11 />} />
          <Route path='/Item0' element={<Item0 />} />

        </Routes>
        <Footer />
      </Router>
    </>
  );
}

export default App;
