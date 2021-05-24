// Import All Our Components
import AllBlogs from "./pages/AllBlogs";
import SingleBlog from "./pages/SingleBlog";
import Form from "./pages/Form";

// Import React and hooks
import React, { useState, useEffect } from "react";

// Import components from React Router
import { Route, Switch, Link } from "react-router-dom";

function App(props) {
  ////////////////////
  // Style Objects
  ////////////////////

  const h1 = {
    textAlign: "center",
    margin: "10px",
  };

  const button = {
    backgroundColor: "navy",
    display: "block",
    margin: "auto",
  };

  ///////////////
  // State & Other Variables
  ///////////////

  // Our Api Url
  const url = "http://localhost:8000/blog/";

  // State to Hold The List of Blogs
  const [blogs, setBlogs] = useState([]);

  // an object that represents a null blog
  const nullBlog = {
    title: "",
    body: "",
  };

  // const state to hold blog to edit
  const [targetBlog, setTargetBlog] = useState(nullBlog);

  //////////////
  // Functions
  //////////////

  // Function to get list of Blogs from API
  const getBlogs = async () => {
    const response = await fetch(url);
    const data = await response.json();
    setBlogs(data);
  };

  // Function to add blog from form data
  const addBlogs = async (newBlog) => {
    const response = await fetch(url, {
      method: "post",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newBlog),
    });

    // get updated list of blogs
    getBlogs();
  };

  // Function to select blog to edit
  const getTargetBlog = (blog) => {
    setTargetBlog(blog);
    props.history.push("/edit");
  };

  // Function to edit blog on form submission
  const updateBlog = async (blog) => {
    const response = await fetch(url + blog.id + "/", {
      method: "put",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(blog),
    });

    // get updated list of blogs
    getBlogs();
  };

  const deleteBlog = async (blog) => {
    const response = await fetch(url + blog.id + "/", {
      method: "delete",
    });
  
    // get updated list of blogs
    getBlogs();
    props.history.push("/");
  };
  //////////////
  // useEffects
  //////////////

  // useEffect to get list of blogs when page loads
  useEffect(() => {
    getBlogs();
  }, []);

  /////////////////////
  // returned JSX
  /////////////////////
  return (
    <div>
      <h1 style={h1}>My Blog List</h1>
      <Link to="/new">
        <button style={button}>Create New Blog</button>
      </Link>
      <Switch>
        <Route
          exact
          path="/"
          render={(routerProps) => <AllBlogs {...routerProps} blogs={blogs} />}
        />
        <Route
          path="/blog/:id"
          render={(routerProps) => (
            <SingleBlog {...routerProps} blogs={blogs} edit={getTargetBlog} deleteBlog={deleteBlog}/>
          )}
        />
        <Route
          path="/new"
          render={(routerProps) => (
            <Form
              {...routerProps}
              initialBlog={nullBlog}
              handleSubmit={addBlogs}
              buttonLabel="create blog"
            />
          )}
        />
        <Route
          path="/edit"
          render={(routerProps) => (
            <Form
              {...routerProps}
              initialBlog={targetBlog}
              handleSubmit={updateBlog}
              buttonLabel="update blog"
            />
          )}
        />
      </Switch>
    </div>
  );
}

export default App;
