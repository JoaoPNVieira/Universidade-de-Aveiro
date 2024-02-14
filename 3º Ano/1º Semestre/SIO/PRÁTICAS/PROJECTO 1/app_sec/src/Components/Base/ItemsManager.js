
export async function getItems(){
    
    let obj = {};
    let ItemList = []
    const ditems = await (await fetch('/Items')).json()
    
    for (const item of ditems) {
        obj = {Id: item[0], ProductName: item[1], ProductDescription: item[2], Category: item[3], ImagePath: item[4], Price: item[5], Stock: item[6]}
        if(obj.ImagePath !== undefined){
            ItemList.push(obj)
        }
    }
    
    return ItemList
    
}