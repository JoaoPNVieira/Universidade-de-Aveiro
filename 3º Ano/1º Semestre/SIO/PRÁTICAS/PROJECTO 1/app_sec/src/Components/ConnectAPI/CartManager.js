export async function sendCart(cart) {
    const res = await( await fetch('/updateCarts', {
        method: "POST",
        body: JSON.stringify(cart),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}

export async function endCart(cart) {
    const res = await( await fetch('/endCarts', {
        method: "POST",
        body: JSON.stringify(cart),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}