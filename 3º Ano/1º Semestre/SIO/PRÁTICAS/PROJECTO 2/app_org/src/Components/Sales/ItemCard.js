import React, {useState} from 'react'
import '../../App.css'
import './ItemCard.css'
import ItemPopup from './ItemPopup'

function ItemCard(props) {

    /**********  Const Declaration **********/
    const [onWish, setWish] = useState(false)
    const [buttonPopup, setButtonPopup] = useState(false)
    const [firsterror, setfirtError] = useState(false)
    const [quantity, setQuantity] = useState(1)
    const [Images, setImages] = useState([{image: props.src + "1.png"}, {image: props.src + "2.png"}, {image: props.src + "3.png"}, {image: props.src + "4.png"}, {image: props.src + "5.png"}, {image: props.src + "6.png"}, {image: props.src + "7.png"}, {image: props.src + "8.png"}])
    const [currentSlide, setCurrentSlide] = useState(0)
    const nextSlide = () => {setCurrentSlide(currentSlide === Images.length - 1 ? 0 : currentSlide + 1)};
    const prevSlide = () => {setCurrentSlide(currentSlide === 0 ? Images.length - 1 : currentSlide - 1)};

    /**********  Quantity To Cart **********/
    const quantityUp = () => {setQuantity(quantity >= props.stock ? props.stock : quantity + 1)};
    const quantityDown = () => {setQuantity(quantity <= 1 ? 1 : quantity - 1)};
    const quantitySet = (e) => {
        if(e.target.value > props.stock){
            setQuantity(props.stock)
        }
        else if(e.target.value < 1 && e.target.value !== ''){
            setQuantity(1)
        }else{
            setQuantity(e.target.value)
        }};

    /**********  Handle Error if images < 8 **********/
    const handleerror = () => {
        setfirtError(true);
        const newImages = [];
        for(let i = 0; i < currentSlide; i++){
            newImages.push(Images[i]);
        }
        setImages(newImages);
        setCurrentSlide(0);
        console.log(newImages);
    }

    /**********  Submit To Cart **********/
    function submitCart(){
        const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
        cart[props.id] = cart[props.id] + quantity
        window.localStorage.setItem("detitalismoh", JSON.stringify(cart))
    }
    
    return (
        <>
            {/*********** Card ***********/}
            <li className='item_card'>
                <section className='item_card_container'>
                    <figure className='item_card_pic' data-category={props.price + ' €'} >
                        <i className={onWish ? "fas fa-heart" :  "far fa-heart"} onClick={() => setWish(!onWish)}></i>
                        <img src={props.src + "2.png"} alt='Error Loading...' className='item_card_img2' onClick={() => setButtonPopup(true)} />
                        <img src={props.src + "1.png"} alt='Error Loading...' className='item_card_img1' onClick={() => setButtonPopup(true)} />
                    </figure>
                    <div className='item_card_info' onClick={() => setButtonPopup(true)}>
                        <h5 className='item_card_text'>{props.name}</h5>
                    </div>
                </section>
            </li>
            {/********* PopUp On Click ***********/}
            {buttonPopup ? document.body.classList.add('overflow') : document.body.classList.remove('overflow')}
            <ItemPopup trigger={buttonPopup} setTrigger={setButtonPopup} onWish={onWish} setWish={setWish}>

                <h2 className='Item_Name'>{props.name}</h2>
                <img src={Images[currentSlide].image} alt={Images[currentSlide].i} className='PopUp_img' onError={handleerror}/>
                {(firsterror || currentSlide !== 0) && <div className='prevImageArrow' onClick={prevSlide}>
                    <i className='fas fa-v fa-rotate-90' />
                </div>}
                <div className='nextImageArrow' onClick={nextSlide}>
                    <i className='fas fa-v fa-rotate-270' />
                </div>
                <div className='Item_Info'>
                    <p className='Item_Description'>{props.desc} </p>
                </div>
                <div className='addCart'>
                    <div className='Price_Quantity'>
                        <div className='Price_Info'>
                            <p style={{margin:'10px'}} className={props.stock > 0 ? 'checkStockPrice soldOut' : 'checkStock soldOut'}>Not </p>
                            <p className={props.stock > 0 ? 'checkStock' : 'checkStock soldOut'}>Available</p>
                            <p className={props.stock > 0 ? 'checkStock' : 'checkStockPrice soldOut'}>: </p>
                            <p style={{margin:'10px'}} className={props.stock > 0 ? 'checkStockPrice' : 'checkStockPrice soldOut'}>{props.price + "€"}</p>
                        </div>
                        {props.stock > 0 ? <button className='Cart_Btn' onClick={() => {submitCart(); window.location.reload(false); }}>Add to Cart</button> : <button className='Cart_Btn soldOut'>Add to WishList</button>}
                        {props.stock > 0 && <div className='quantity'>
                            <button className='quantity_btn' onClick={quantityDown}>-</button>
                            <input type="text" value={quantity} className='quantity_number' onChange={quantitySet}/>
                            <button className='quantity_btn' onClick={quantityUp}>+</button>
                        </div>}
                    </div>
                </div>

            </ItemPopup>
        </>
    )
   
}

export default ItemCard