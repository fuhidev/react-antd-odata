import React from 'react';
import { EditableTable } from '../Table/EditableTable';
import { Column } from '../Table/Model';
import { RoleAPI } from '../../services/QuanLyNhomQuyen/api/RoleAPI';
import { Role } from '../../services/QuanLyNhomQuyen/models/QuanLyNhomQuyenModel';
export class MainComponent extends React.Component {
  private api = new RoleAPI();
  private columns: Column[] = [];
  constructor() {
    super({});
    this.columns = [{
      title: 'ID',
      dataIndex: 'ID',
      width: '40%',
      editable: false,
      isPrimary: true
    },
    {
      title: 'Tên',
      dataIndex: 'Name',
      width: '60%',
      editable: true,
    }
    ];
  }
  render() {

    return (
      <EditableTable<Role>
        columns={this.columns}
        api={this.api}
      />
    );
  }
}