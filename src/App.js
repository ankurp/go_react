import React from 'react';
import logo from './logo.svg';
import './App.css';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { message: '' };
  }

  componentDidMount() {
    fetch('/api')
      .then(res => res.json())
      .then(json => this.setState(json))
  }

  render() {
    const { message } = this.state;
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1>{message}</h1>
        </header>
      </div>
    );  
  }
}

export default App;
