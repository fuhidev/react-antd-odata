import React from 'react';
import { EditableTable } from '../Table/EditableTable';
import { Column } from '../Table/Model';
import { AccountAPI } from '../../services/QuanLyTaiKhoan/api/AccountAPI';
import { Account } from '../../services/QuanLyTaiKhoan/models/QuanLyTaiKhoanModel';
export class MainComponent extends React.Component {
  private api = new AccountAPI();
  private columns: Column[] = [];
  constructor() {
    super({});
    this.columns = [{
      title: 'Tên tài khoản',
      dataIndex: 'Username',
      width: '40%',
      editable: false,
      isPrimary: true
    },
    {
      title: 'Mật khẩu',
      dataIndex: 'Password',
      width: '40%',
      editable: true,
      render: (text: any, record: any) => {
        return <input type="password" value="*****************" readOnly style={{ border: 'none' }} />
      }
    },
    {
      title: 'Tên hiển thị',
      dataIndex: 'DisplayName',
      width: '20%',
      editable: true,
    },
    {
      title: 'Quyền',
      dataIndex: 'Role',
      width: '10%',
      editable: true,
    }
    ];
  }
  render() {

    return (
      <EditableTable<Account>
        columns={this.columns}
        api={this.api}
      />
    );
  }
}