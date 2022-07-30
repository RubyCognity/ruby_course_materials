import React, { useState, useEffect } from 'react';
import ButtonGroup from './ButtonGroup';

function Post(props: any) {
    const [title, setTitle] = useState(props.post.title);
    const [content, setContent] = useState(props.post.content);
    const [isEditing, setIsEditing] = useState(props.postToEdit === props.post.id)

    useEffect(() => {
        setIsEditing(props.postToEdit === props.post.id);
    }, [props.postToEdit, props.post.id]);

    function submitHandler(e:any) { 
        e.preventDefault();
        const formData = {
            post: {
                id: props.post.id, 
                title: title, 
                content: content
            }
        }

        props.submitEdit(formData);
        resetState();
    }

    function resetState() {
        setTitle('');
        setContent('');
    }

    const titleElement = <h2 className="title text-start">{props.post.title}</h2>
    const contentElement = <p className="card-text text-start">{props.post.content}</p>;
    const editableTitle = <input 
                            type="text"
                            className="form-control text-start"
                            name="title"
                            value={title}
                            onChange={(e) => setTitle(e.target.value)}/>;
    const editableContent = <textarea 
                                className="form-control text-start"
                                value={content}
                                onChange={(e) => setContent(e.target.value)}/>;
    const submitButton = <button 
                            type="submit"
                            className="form-control btn btn-success"
                            onClick={(e) => submitHandler(e)}>Submit</button>

    return(<div>
        <div className="row">
            <div className="col-8">
                {isEditing ? editableTitle : titleElement}
            </div>
            <div className="col-4">
                <ButtonGroup
                    post_id={props.post.id}
                    dispatch={props.dispatch}
                    toggleEditForm={props.toggleEditForm}
                />
            </div>
        </div>
        <div className="row">
            <div className="col-8">
                {isEditing ? editableContent : contentElement}
            </div>
        </div>
        <div className="row"> 
            <div className="col-2">
                {isEditing ? submitButton : ""}
            </div>
        </div>
    </div>);
}

export default Post;
