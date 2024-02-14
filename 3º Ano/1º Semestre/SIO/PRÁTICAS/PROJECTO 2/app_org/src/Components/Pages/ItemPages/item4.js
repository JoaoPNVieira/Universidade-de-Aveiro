import React, {useState, useEffect} from 'react'
import '../../../App.css'
import './item.css'
import { getItems, getRatings, postComment  } from '../../ConnectAPI/ItemManager'

function Item4() {  

    /**********  Const Declaration **********/
    
    const [item,setItem]= useState({Id: 0, ProductName: 'Temp', ProductDescription: 'Temp', Category: 'Temp', ImagePath: 'Images/Hoodie/', Price: 49.50, Stock: 2})
    const [itemList, setItemList] = useState([])
    const [commentList, setCommentList] = useState([])
    let show = false
    useEffect(() => { getRatings().then(data => { setCommentList(data) }).catch(e => console.log("Error", e)) }, [])
    const [Images, setImages] = useState([{image: item.ImagePath + "1.png"}, {image: item.ImagePath + "2.png"}, {image: item.ImagePath + "3.png"}, {image: item.ImagePath + "4.png"}, {image: item.ImagePath + "5.png"}, {image: item.ImagePath + "6.png"}, {image: item.ImagePath + "7.png"}, {image: item.ImagePath + "8.png"}])
    useEffect(() => { getItems().then(data => { setItemList(data) }).catch(e => console.log("Error", e)) }, [])
    useEffect(() => { itemList.length > 0 ? setItem(itemList[4]) : <></>}, [itemList])
    useEffect(() => { item.ImagePath !== 'Images/Hoodie/' ? setImages([{image: item.ImagePath + "1.png"}, {image: item.ImagePath + "2.png"}, {image: item.ImagePath + "3.png"}, {image: item.ImagePath + "4.png"}, {image: item.ImagePath + "5.png"}, {image: item.ImagePath + "6.png"}, {image: item.ImagePath + "7.png"}, {image: item.ImagePath + "8.png"}]) : <></>}, [item])
    const [firsterror, setfirtError] = useState(false)
    const [quantity, setQuantity] = useState(1)
    const[currentSlide, setCurrentSlide] = useState(0)
    const nextSlide = () => {setCurrentSlide(currentSlide === Images.length - 1 ? 0 : currentSlide + 1)};
    const prevSlide = () => {setCurrentSlide(currentSlide === 0 ? Images.length - 1 : currentSlide - 1)};
    const [comment, setComment] = useState('')
    const [rating, setRating] = useState('0')
 
    /**********  Quantity To Cart **********/
    const quantityUp = () => {setQuantity(quantity >= item.Stock ? item.Stock : quantity + 1)};
    const quantityDown = () => {setQuantity(quantity <= 1 ? 1 : quantity - 1)};
    const quantitySet = (e) => {
        if(e.target.value > item.Stock){
            setQuantity(item.Stock)
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
    }

    /**********  Submit To Cart **********/
    function addtoCart(){
        const cart = JSON.parse(window.localStorage.getItem("detitalismoh"))
        cart[item.Id] = cart[item.Id] + quantity
        window.localStorage.setItem("detitalismoh", JSON.stringify(cart))
    }

    /**********  Submit To Wishlist **********/
    function addtoWish(){
        const cart = JSON.parse(window.localStorage.getItem("detitalismow"))
        cart[item.Id] = 1
        window.localStorage.setItem("detitalismow", JSON.stringify(cart))
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

    function handleComment(){
        let name = ""
        const aCookie = document.cookie.split(';')
        for(let i = 0; i < aCookie.length; i++){
            let cookie = aCookie[i].split('=')[0].trim()
            if(cookie === 'userDetitalism'){
                name = aCookie[i].split('=')[1]
            }
        }
        let comm = {User: name, Product: item.Id, Rating: parseInt(rating), Comment: comment}
        postComment(comm)
    }

    return (
        <>
            <section className='pageItem-main'>

                {/* Item Photo And Arrows*/}
                <section className='pageItem-imgContainer'>
                    {!(firsterror || currentSlide !== 0) && <div className='prevImageH'>
                        <i className='fas fa-v fa-rotate-90' />
                    </div>}
                    {(firsterror || currentSlide !== 0) && <div className='prevImage' onClick={prevSlide}>
                        <i className='fas fa-v fa-rotate-90' />
                    </div>}
                    <img src={Images[currentSlide].image} alt={Images[currentSlide].i} className='pageItem-img' onError={handleerror}/>
                    <div className='nextImage' onClick={nextSlide}>
                        <i className='fas fa-v fa-rotate-270' />
                    </div>
                </section>
                <section>
                    {/* Item Name And Description */}
                <section className='pageItem-textbox'>
                    <h1 className='pageItem-name'>{item.ProductName}</h1>
                    <p className='pageItem-desc'>{item.ProductDescription} </p>
                </section>
                <section className='pageaddCart'>
                    <div className='PriceQuantity'>
                        {/* Avalability */}
                        <div className='pagePrice_Info'>
                            <p style={{margin:'10px'}} className={item.Stock > 0 ? 'pcheckStockPrice soldOut' : 'pcheckStock soldOut'}>Not </p>
                            <p className={item.Stock > 0 ? 'pcheckStock' : 'pcheckStock soldOut'}>Available</p>
                            <p className={item.Stock> 0 ? 'pcheckStock' : 'pcheckStockPrice soldOut'}>: </p>
                            <p style={{margin:'10px'}} className={item.Stock > 0 ? 'pcheckStockPrice' : 'pcheckStockPrice soldOut'}>{item.Price + "€"}</p>
                        </div>

                        {/* Add to Cart */}
                        {item.Stock > 0 ? <button className='Cart_Btn' onClick={() => addtoCart()}>Add to Cart</button> : <button className='Cart_Btn soldOut' onClick={() => addtoWish()}>Add to WishList</button>}

                        {/* Quantity */}
                        {item.Stock > 0 && <div className='quantity'>
                            <button className='quantity_btn' onClick={quantityDown}>-</button>
                            <input type="text" value={quantity} className='quantity_number' onChange={quantitySet}/>
                            <button className='quantity_btn' onClick={quantityUp}>+</button>
                        </div>}
                    </div>
                </section>
                </section>
            </section>
            <section className='pageItem-comments'>
                <h1 className='pageItem-comments-title'>Comments</h1>
                <section className='pageItem-comments-container'>
                {getCookie() && <div className='pageItem-comments-box'>
                        <div>
                            <label htmlFor="rate">Rating: </label>
                            <select className="pageItem-comments-select" name="rate" id="rate" onChange={(e) => setRating(e.target.value)}>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <input className='pageItem-comments-input' type="text" onChange={(e) => setComment(e.target.value)} placeholder='Write a comment...'/>
                        <button onClick={() => handleComment()} className='pageItem-comments-btn'>Send</button>
                        </div>
                }
                {commentList.map((comment) => {
                        if(comment.Product === item.Id){
                            show = true
                            return <div className='pageItem-comments-box' key={comment.Id}>
                                <div className='pageItem-comments-user'>
                                    <p className='pageItem-comments-user-name'>{comment.User}:</p>
                                    <p className='pageItem-comments-user-rating'>{comment.Rating}<i className='fas fa-star' /></p>
                                </div>
                                <p className='pageItem-comments-comment'>{comment.Comment}</p>
                            </div>
                        }else{
                            return null
                        }
                    })}
                    {!show && 
                            <div className='pageItem-comments-box'>
                                <div className='pageItem-comments-user'>
                                    <p className='pageItem-comments-user-name'>No Comments</p>
                                </div>
                            </div>
                    }
                </section>
                        
            </section>
 
        </>
    )
    
 }

export default Item4