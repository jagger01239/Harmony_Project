import axios, { AxiosError, AxiosResponse } from "@ohos/axios"
import { PersonListEntity } from  "../entity/PersonListEntity"
import { PersonListDataSource } from "../model/PersonListDataSource"
import {CommonEntity} from "../entity/HttpResEntity"

@Entry
@Component
export default struct PersonPage {

  @State personListArr:PersonListDataSource = new PersonListDataSource()

  aboutToAppear(): void {
    axios.get<CommonEntity<PersonListEntity>,AxiosResponse<PersonListEntity>,null>("http://iwenwiki.com:3006/api/person/list")
      .then((res:AxiosResponse) =>{
        if (res.data.status === 200) {
          this.personListArr.pushData(res.data.data)
        }
      })
      .catch((err:AxiosError) =>{
        console.log("axios-err",JSON.stringify(err))
      })
  }

  build() {
   List(){
     LazyForEach(this.personListArr,(item:PersonListEntity) =>{
       ListItem(){
         Row(){
           Image(item.image).width(100).borderRadius(5)
           Column(){
             Text(item.name).fontWeight(500).fontSize(18)
             Text("工作经验" + item.age).fontSize(14).fontColor("#999").margin({ bottom:5 })
             Text(item.price + "元/月").fontSize(14).fontColor("#f44").margin({ bottom:10 })
             Text(item.descs).fontSize(14).fontColor("#999")
           }
           .padding({ left:10,right:10 })
           .alignItems(HorizontalAlign.Start)
         }
         .padding(10)
       }
     })
   }
  }
}