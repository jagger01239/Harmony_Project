import { PersonListEntity } from "../entity/PersonListEntity"



class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];


  public totalCount(): number {
    return 0;
  }

  public getData(index: number): Object {
    return index;
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

export class PersonListDataSource extends BasicDataSource{
  // 处理数据懒加载
  private  personListData:Array<PersonListEntity> = []

  public totalCount(): number {
    return this.personListData.length
  }

  public getData(index: number): PersonListEntity {
    return this.personListData[index]
  }

  public addData(index:number,data:PersonListEntity){
    this.personListData.splice(index,0,data)
    this.notifyDataAdd(index)
  }

  public pushData(data:PersonListEntity[]){
    this.personListData.push(...data)
    this.notifyDataAdd(this.personListData.length-1)
  }

}