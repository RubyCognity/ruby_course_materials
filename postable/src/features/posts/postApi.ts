import { PostDeleteData, PostFormData, PostsState, PostState, PostUpdateData } from "./postSlice";

const API_URL = "http://localhost:3001/api";

export async function fetchPosts() { 
    return fetch(`${API_URL}/posts`, {
        method: "GET", 
        headers: {
            "Content-Type": "application/json"
        },
    }).then((response) => response.json())
    .catch((error) => {
        console.log("Error: ", error);
        return {} as PostState;
    });
}

export async function createPost(payload: PostFormData) { 
    const post = payload.post; 

    return fetch(`${API_URL}/posts`, {
        method: "POST", 
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            post
        })
    }).then((response) => response.json())
    .catch((error) => {
        console.log("Error: ", error);
        return {} as PostState;
    });
}

export async function updatePost(payload: PostFormData) { 
    const post = payload.post; 
    return fetch(`${API_URL}/posts/${post.id}`, {
        method: "PUT", 
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            post,
        })
    })
    .then((response) => response.json())
    .catch((error) => {
        console.log("Error: ", error);
        return {} as PostsState;
    })
}

export async function destroyPost(payload: PostDeleteData) { 
    const post = payload.post; 

    return fetch(`${API_URL}/posts/${post.post_id}`, {
        method: "DELETE", 
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            post
        })
    }).then((response) => response.json())
    .catch((error) => {
        console.log("Error: ", error);
        return {} as PostState;
    });
}
