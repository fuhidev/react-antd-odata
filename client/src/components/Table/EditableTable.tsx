import React from 'react';
import {
  Table, Input, InputNumber, Popconfirm, Form, message, Button,
} from 'antd';
import { FormComponentProps } from 'antd/lib/form';
import { WrappedFormUtils } from 'antd/lib/form/Form';
import { Column } from './Model';
import { ColumnProps } from 'antd/lib/table';
import IService from '../../services/api/IService';
const KEY_NEW = ' ';
const FormItem = Form.Item;
const EditableContext = React.createContext({});

const EditableRow = ({ form, ...props }
  : FormComponentProps) => (
    <EditableContext.Provider value={form}>
      <tr {...props} />
    </EditableContext.Provider>
  );

const EditableFormRow = Form.create()(EditableRow);

type EditableCellProps = {
  inputType: 'string' | 'number',
  editing: boolean,
  dataIndex: never,
  title: string,
  record: any[],
};

class EditableCell extends React.Component<EditableCellProps, {}> {
  getInput = () => {
    if (this.props.inputType === 'number') {
      return <InputNumber />;
    }
    return <Input />;
  };

  render() {
    const {
      editing,
      dataIndex,
      title,
      inputType,
      record,
      ...restProps
    } = this.props;
    return (
      <EditableContext.Consumer>
        {(form) => {
          const { getFieldDecorator } = form as WrappedFormUtils;
          return (
            <td {...restProps}>
              {editing ? (
                <FormItem style={{ margin: 0 }}>
                  {getFieldDecorator(dataIndex, {
                    rules: [{
                      required: true,
                      message: `Nhập ${title}!`,
                    }],
                    initialValue: record[dataIndex],
                  })(this.getInput())}
                </FormItem>
              ) : restProps.children}
            </td>
          );
        }}
      </EditableContext.Consumer>
    );
  }
}

type States<T> = {
  editingKey: string,
  data: T[]
};

type Props<T> = {
  columns: Column[],
  api: IService<T, any>
};

export class EditableTable<T> extends React.Component<Props<T>, States<T>> {
  private columns: Column[] = [];
  constructor(props: Props<T>) {
    super(props);
    this.state = { data: [], editingKey: '' };
    this.columns = props.columns.map(m =>
      ({
        isPrimary: m.isPrimary != undefined ? m.isPrimary : false,
        title: m.title,
        dataIndex: m.dataIndex,
        width: m.width,
        editable: m.editable != undefined ? m.editable : false,
        render: m.render
      } as Column));
    this.columns.push({
      title: '',
      dataIndex: 'operation',
      render: (text: any, record: any) => {
        const editable = this.isEditing(record);
        return (
          <div>
            {editable ? (
              <span>
                <EditableContext.Consumer>
                  {form => (
                    <a
                      href="javascript:;"
                      onClick={() => this.save(form, record[this.getPrimaryColumn().dataIndex])}
                      style={{ marginRight: 8 }}
                    >
                      Lưu
                      </a>
                  )}
                </EditableContext.Consumer>
                <Popconfirm
                  title="Chắc chắn muốn hủy?"
                  onConfirm={() => this.cancel()}
                >
                  <a>Hủy</a>
                </Popconfirm>
              </span>
            ) : (
                <div>
                  <a onClick={() => this.edit(record[this.getPrimaryColumn().dataIndex])}>Chỉnh sửa</a> |
                    <Popconfirm title="Chắc chắn muốn xóa?" onConfirm={() => this.delete(record[this.getPrimaryColumn().dataIndex])}>
                    <a href="javascript:;">Xóa</a>
                  </Popconfirm>
                </div>
              )}
          </div>
        );
      },
    })
  }

  async componentDidMount() {
    const data = await this.props.api.getAll();
    this.setState({ data });

  }

  private getPrimaryColumn() {
    const primaryColumn = this.columns.find(f => f.isPrimary != undefined && f.isPrimary === true);
    if (!primaryColumn) {
      throw new Error('Không xác định được primary column');
    }
    return primaryColumn as Column;
  }

  isEditing = (record: any) =>
    record[this.getPrimaryColumn().dataIndex] === this.state.editingKey;

  cancel = () => {
    let newState = { editingKey: '' } as any;
    if (this.state.editingKey === KEY_NEW) {
      let newData = [...this.state.data];
      let index = newData.findIndex((f: any) =>
        f[this.getPrimaryColumn().dataIndex] === this.state.editingKey);
      newData.splice(index, 1);
      newState['data'] = newData;
    }
    this.setState(newState);
  };


  save(form: any, key: any) {
    form.validateFields((error: any, row: any) => {
      if (error) {
        return;
      }
      const newData = [...this.state.data]; // sao chép mảng
      const index = newData.findIndex((item: any) => key === item[this.getPrimaryColumn().dataIndex]); // tìm index
      if (this.state.editingKey !== KEY_NEW) {

        // nếu tồn tại
        if (index > -1) {
          const item = newData[index] as any;
          let newItem = {
            ...item,
            ...row,
          };
          newData.splice(index, 1, newItem);
          let hide = message.loading('Đang cập nhật...', 0);
          this.props.api.update(item[this.getPrimaryColumn().dataIndex], newItem)
            .then(r => r && message.success('Cập nhật thành công!') && this.setState({ data: newData, editingKey: '' }))
            .catch(_ => message.error('Cập nhật thất bại!'))
            .finally(() => hide());

        }
      } else {
        // thêm mới
        let newItem = {
          ...row
        };
        let hide = message.loading('Đang thêm mới...', 0);
        this.props.api.add(newItem)
          .then(newItem => {
            newItem
              && newData.push(newItem)
              && index > -1 && newData.splice(index, 1)
              && message.success('Thêm mới thành công!')
              && this.setState({ data: newData, editingKey: '' })
          })
          .catch(_ => message.error('Thêm mới thất bại!'))
          .finally(() => hide());

        this.setState({ data: newData, editingKey: '' });
      }
    });
  }

  edit(key: string) {
    this.setState({ editingKey: key });
  }

  private delete(key: string) {
    const newData = [...this.state.data]; // sao chép mảng
    const index = newData.findIndex((item: any) => key === item[this.getPrimaryColumn().dataIndex]); // tìm index

    // nếu tồn tại
    if (index > -1) {
      const item = newData[index] as any;
      newData.splice(index, 1);
      let hide = message.loading('Đang xóa...', 0);
      this.props.api.delete(item[this.getPrimaryColumn().dataIndex])
        .then(r => r && message.success('Xóa thành công!') && this.setState({ data: newData, editingKey: '' }))
        .catch(_ => message.error('Xóa thất bại!'))
        .finally(() => hide());

    }
  }

  private handleAdd() {
    if (!this.state.editingKey) {
      const newData = [{ [this.getPrimaryColumn().dataIndex]: KEY_NEW } as any, ...this.state.data]; // sao chép mảng
      this.setState({ data: newData, editingKey: KEY_NEW });
    }
  }

  render() {
    const components = {
      body: {
        row: EditableFormRow,
        cell: EditableCell,
      },
    };

    const columns = this.columns.map((col) => {
      let output: ColumnProps<T> = {
        ...col,
        render: col.render ? (text: any, record: any) =>
        col.render && col.render(text, record, this.isEditing(record))
          : undefined
      };
      if (col.editable) {
        output.onCell = (record: any) => ({
          record,
          inputType: col.inputType || 'string',
          dataIndex: col.dataIndex,
          title: col.title,
          editing: this.isEditing(record),
        })
      }
      return output;
    });

    return (
      <div>
        <Button
          disabled={this.state.editingKey !== ''}
          onClick={this.handleAdd.bind(this)}
          type="primary"
          style={{ marginBottom: 16 }}
        >
          Thêm mới
    </Button>
        <Table
          components={components}
          bordered
          dataSource={this.state.data}
          columns={columns}
          rowClassName={_ => "editable-row"}
        />
      </div>
    );
  }
}