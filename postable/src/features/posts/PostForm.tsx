import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../app/store';
import { createPostAsync } from "./postSlice";

function PostForm() {
    const dispatch = useDispatch<AppDispatch>();
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');

    function submitHandler(e: any) { 
        e.preventDefault();
        const formData = {
            post: {
                title: title, 
                content: content
            }
        }
        dispatch(createPostAsync(formData));
        resetState();
    }

    function resetState() {
        setTitle('');
        setContent('');
    }

    return <div>
        <h1>PostForm</h1>
        <form> 
            <input 
                type="text"
                className="form-control text-start"
                name="title"
                value={title}
                onChange={(e) => setTitle(e.target.value)}/>
            
            <textarea
                className="form-control text-start"
                name="body"
                value={content}
                onChange={(e) => setContent(e.target.value)}
                />
            <button 
                type="submit"
                className="btn btn-success"
                onClick={(e) => submitHandler(e)}>Submit
            </button>
        </form>
    </div>;
}

export default PostForm;
