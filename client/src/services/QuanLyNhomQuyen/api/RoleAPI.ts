import IService from '../../api/IService';
import { Role } from '../models/QuanLyNhomQuyenModel';
import { odata, API_URL } from '../../api';

const URL = API_URL + '/odata/Roles';

export class RoleAPI implements IService<Role, string>{
  getById(id: string): Promise<Role | null> {
    throw new Error("Method not implemented.");
  }
  getAll(): Promise<Role[]> {
    return odata.get(URL);
  }
  delete(id: string): Promise<boolean> {
    return odata.delete(URL + `('${id}')`);
  }
  add(model: Role): Promise<Role | null> {
    return odata.post(URL, JSON.stringify(model));
  }
  update(id: string, model: Role): Promise<Role | null> {
    return odata.patch(URL + `('${model.ID}')`, JSON.stringify(model));
  }
}
