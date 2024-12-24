import axios, { AxiosError, AxiosResponse } from "@ohos/axios"
import {RecommendGoodsItem} from "../../entity/RecommendGoodsEntity"
import { router } from "@kit.ArkUI"
import {RecommendGoods} from "../../entity/HttpResEntity"

@Component
export default struct RecommendGoodsView{

  @State recommendGoodsData:RecommendGoodsItem[] = []

  aboutToAppear(): void {
    // 因为将RecommendGoods改为公共类型，此处多处用泛型
    axios.get<RecommendGoods<RecommendGoodsItem>,AxiosResponse<RecommendGoods<RecommendGoodsItem>>,null>("http://iwenwiki.com:3006/api/recommendgoods")
      .then((res:AxiosResponse) =>{
        console.log("axios-res",JSON.stringify(res))
        if (res.data.status === 200) {
          this.recommendGoodsData = res.data.data
        }
      })
      .catch((err:AxiosError) =>{
        console.log("axios-err",JSON.stringify(err))
      })
  }

  build() {
    List(){
      ForEach(this.recommendGoodsData,(item:RecommendGoodsItem) =>{
        ListItem(){
          Column(){
            Row(){
               Image(item.image).width(120).height(120).borderRadius(10)
              Column(){
                 Text(item.title).margin({ bottom:20 }).fontSize(14)
                 Text(`￥${item.price}`).fontSize(20).fontColor("#ff0000")
              }
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.SpaceAround)
              .padding({ left:5 })
            }
            .onClick(() =>{
              router.pushUrl({
                url:"pages/HomeDetails",
                // 参数传递
                params:{
                  id:item.id
                }
              })
            })
          }
          .margin({ bottom:10 })
        }
      })
    }
    .padding({ left:10,top:10,right:0,bottom:50})
    .margin({ top:10,bottom:10})
    .backgroundColor("#ffffff")
  }
}