export async function getItems(){
    
    let obj = {};
    let ItemList = []
    const ditems = await (await fetch('/Items')).json()
    
    for (const item of ditems) {
        obj = {Id: item.id-1, ProductName: item.title, ProductDescription: item.descrip, Category: item.category, ImagePath: item.imagePath, Price: item.price, Stock: item.stock}
        if(obj.ImagePath !== undefined){
            ItemList.push(obj)
        }
    }
    
    return ItemList
    
}

export async function getRatings(){

    let obj = {};
    let ItemList = []
    const ditems = await (await fetch('/Ratings')).json()
    
    for (const item of ditems) {
        obj = {Id: item[0], User: item[1], Product: item[2], Rating: item[3], Comment: item[4]}
        ItemList.push(obj)
    }
    return ItemList
    
}

export async function postComment(rating) {
    const res = await( await fetch('/rate_comment_product', {
        method: "POST",
        body: JSON.stringify(rating),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}