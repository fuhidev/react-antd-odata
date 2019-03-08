import React, { Component } from 'react';
import MainLayout from './components/Layout/MainLayout';
import './App.css';
import {QuanLyTaiKhoanPage,QuanLyNhomQuyenPage} from './pages';
import { BrowserRouter as Router, Route } from "react-router-dom";

class App extends Component {
  render() {
    return (
      <Router>
      <MainLayout>
      <Route exact path="/" component={QuanLyTaiKhoanPage} />
      <Route path="/quan-ly-nhom-quyen" component={QuanLyNhomQuyenPage} />
      <Route path="/quan-ly-tai-khoan" component={QuanLyTaiKhoanPage} />
      </MainLayout>
      </Router>
    );
  }
}

export default App;
