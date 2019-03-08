export interface Column {
  isPrimary?:boolean;
  title: string;
  dataIndex: string;
  width?: string | number;
  editable?: boolean;
  inputType?: 'string' | 'number' | 'date',
  render?:(text:string,record:any,isEditable:boolean)=>JSX.Element
};