function requests(_type, _url, _data) {
    // var myHeaders = new Headers();
    // myHeaders.append("Content-Type", "application/json");
    // if(_header) myHeaders.append(_header);
    const request = new Request("http://localhost:4000/api/" + _url, {
        method: _type,
        // credentials: 'include',
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(_data),
    });
    return fetch(request);
}

// _____________________________________GET____________________________________________

//GET USER 
export async function getUser(_id) {
    return await requests("GET", "users/" + _id)
}

//GET WORKING TIMES 
export async function getWorkingTimes(_userId) {
    return await requests("GET", "workingtimes/" + _userId)
}

//GET WORKING TIME
export async function getWorkingTime(_userId, _id) {
    return await requests("GET", "workingtimes/" + _userId + "/" + _id)
}

// _____________________________________POST____________________________________________ 

//CREATE A NEW USER
export async function createUser(_data) {
    return await requests("POST", "users",_data)
}

//CREATE WORKING TIME
export async function createWorkingTime(_userId, _data) {
    return await requests("POST", "workingtimes/" + _userId, _data)
}

//_____________________________________UPDATE____________________________________________ 

//PATCH AN USER
export async function updateUser(id, _data) {
    return await requests("PATCH", "users/" + id,_data)
}

//PATCH WORKING TIME
export async function updateWT(_id, _data) {
    return await requests("PUT", "workingtimes/" + _id, _data)
}
//_____________________________________DELETE____________________________________________
//DELETE AN USER
export async function deleteUser(id) {
    return await requests("DELETE", "users/" + id)
}