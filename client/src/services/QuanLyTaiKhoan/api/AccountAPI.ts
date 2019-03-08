import IService from '../../api/IService';
import { Account } from '../models/QuanLyTaiKhoanModel';
import { odata, API_URL } from '../../api';

const URL = API_URL + '/odata/Accounts';

export class AccountAPI implements IService<Account, string>{
  getById(id: string): Promise<Account | null> {
    throw new Error("Method not implemented.");
  }
  getAll(): Promise<Account[]> {
    return odata.get(URL);
  }
  delete(id: string): Promise<boolean> {
   return odata.delete(URL + `('${id}')`);
  }
  add(model: Account): Promise<Account | null> {
   return odata.post(URL,JSON.stringify(model));
  }
  update(id: string, model: Account): Promise<Account | null> {
    return odata.patch(URL + `('${model.Username}')`, JSON.stringify(model));
  }
}
