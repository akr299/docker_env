import React, { useEffect, useState } from "react";
import logo from "./logo.svg";
import "./App.css";

function App() {
  // APIからのメッセージを保存するための状態を定義
  const [message, setMessage] = useState("");

  // コンポーネントがマウントされたときにAPIを呼び出す
  useEffect(() => {
    fetch("http://host.docker.internal:3000/api") // DockerでホストPCのAPIを呼び出すURL
      .then((response) => response.json())
      .then((data) => setMessage(data.message))
      .catch((error) => console.error("Error:", error));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        {/* APIから取得したメッセージを表示 */}
        <p>Serverless APIからのメッセージ: {message}</p>
      </header>
    </div>
  );
}

export default App;
