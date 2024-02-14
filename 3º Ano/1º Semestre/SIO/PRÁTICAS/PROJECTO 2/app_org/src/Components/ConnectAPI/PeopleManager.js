export const logentry = {
    Email: "",
    Password: ""
}

export const regentry = {
    FName: "",
    LName: "",
    Email: "",
    Password: "",
    Phone: 0,
    Nif: 0
}


export async function logPerson(newPerson) {
    const res = await( await fetch('/login', {
        method: "POST",
        body: JSON.stringify(newPerson),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}

export async function regPerson(newPerson) {
    const res = await( await fetch('/signup', {
        method: "POST",
        body: JSON.stringify(newPerson),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}

export async function getCartPerson(mail) {
    const res = await( await fetch('/mecart', {
        method: "POST",
        body: JSON.stringify(mail),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}

export async function updatePass(passes) {
    const res = await( await fetch('/change_password', {
        method: "POST",
        body: JSON.stringify(passes),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}

export async function postAddress(addres) {
    const res = await( await fetch('/postAddress', {
        method: "POST",
        body: JSON.stringify(addres),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}

export async function GetAddress(name) {
    const res = await( await fetch('/meaddr', {
        method: "POST",
        body: JSON.stringify(name),
        headers: {
            "content-type": "application/json"
        }
    })).json()

    return res
}